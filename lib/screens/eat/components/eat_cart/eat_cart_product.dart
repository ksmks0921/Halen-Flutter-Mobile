import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/eat_cart_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/eat/components/eat_product_detail/eat_product_detail.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/cart_general/quantity_edit_buttons.dart';

class EatCartProduct extends ConsumerWidget {
  const EatCartProduct({
    Key? key,
    required this.product,
    required this.vendor,
    required this.orderIndex,
    required this.orderItemIndex,
  }) : super(key: key);

  final EatProduct product;
  final EatVendor vendor;
  final int orderIndex;
  final int orderItemIndex;

  navToProduct(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return EatProductDetail(
          product: product,
          vendor: vendor,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    addRemoveOrderItemCB(
        WidgetRef ref, int orderIndex, int orderItemIndex, String action) {
      int newquant =
          ref.read(eatOrderProv)[orderIndex].items[orderItemIndex].quantity ??
              1;

      if (action == "quantitySubtract") {
        newquant > 1 ? newquant -= 1 : 1;
      }
      if (action == "quantityAdd") {
        newquant += 1;
      }

      if (action == "itemRemove") {
        ref
            .read(eatOrderProv.notifier)
            .removeOrderItem(orderIndex, orderItemIndex);
      } else {
        ref
            .read(eatOrderProv.notifier)
            .updateOrderItemQuantity(orderIndex, orderItemIndex, newquant);
      }
    }

    List<Widget> buildCustomizationsEntryItems = [];

    // Customizations are instances of EatProductCustomization
    if (product.customizations != null) {
      for (EatProductCustomization czn in product.customizations!) {
        buildCustomizationsEntryItems
            .add(CustomizationCartProductEntry(customization: czn));
      }
    }

    return Container(
      padding: EdgeInsets.only(
        top: 12.h,
        left: 18.w,
        right: 18.w,
      ),
      width: double.infinity,
      // height: 105.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(children: [
            SizedBox(
                child: GestureDetector(
              onTap: () {
                navToProduct(context);
              },
              child: Image.asset(product.imageUrl,
                  width: 120.w, height: 94.w, fit: BoxFit.cover),
            ))
          ])),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                    onTap: () {
                      navToProduct(context);
                    },
                    child: Text(
                      product.productName,
                      style:
                          TextStyle(fontSize: 16, color: AppColors.color333836),
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  product.sizes![product.selectedSize!],
                  style: TextStyle(fontSize: 16, color: AppColors.color333836),
                ),
                ...buildCustomizationsEntryItems,
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  product.ingredients!,
                  style:
                      TextStyle(fontSize: 12.sp, color: AppColors.color8E8E8E),
                ),
                SizedBox(height: 16.h),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartQuantityEditButton(
                        onTap: () {
                          // addRemoveItemCB(cartProvIndex, "quantitySubtract");
                          addRemoveOrderItemCB(ref, orderIndex, orderItemIndex,
                              "quantitySubtract");
                        },
                        addOrRemove: AddOrRemove.remove),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      // ref.watch(eatCartProv)[cartProvIndex].quantity.toString(),
                      product.quantity.toString(),
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.color20A39E),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CartQuantityEditButton(
                      onTap: () {
                        addRemoveOrderItemCB(
                            ref, orderIndex, orderItemIndex, "quantityAdd");
                      },
                      addOrRemove: AddOrRemove.add,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flex(direction: Axis.vertical, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  twoDecItemPriceString(product.price),
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
                SizedBox(height: 8.h),
                InkWell(
                  onTap: () {
                    addRemoveOrderItemCB(
                        ref, orderIndex, orderItemIndex, "itemRemove");
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(
                        fontSize: 15.h,
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(height: 1.h),
              ],
            )
          ]),
        ],
      ),
    );
  }
}

// what customization line items will be called for user e.g. with shrimp, add cola
Map entryTitleForCustomizationTitle = {
  "Select Ingredients": "with",
  "Add Beverage": "add"
};

class CustomizationCartProductEntry extends StatelessWidget {
  const CustomizationCartProductEntry({super.key, required this.customization});

  final EatProductCustomization customization;

  @override
  Widget build(BuildContext context) {
    List<Widget> buildCustomizationRowItems = [];
    for (EatProductCustomizationItem epci in customization.items) {
      buildCustomizationRowItems.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(epci.name), Text(twoDecItemPriceString(epci.price))],
      ));
    }

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text(entryTitleForCustomizationTitle[customization.name]),
          ...buildCustomizationRowItems
        ]);
  }
}
