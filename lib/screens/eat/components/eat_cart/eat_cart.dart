import 'package:flutter/material.dart';
import 'package:halen_customer_app/appstate/eat_cart_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/eat/components/etc/dashed_separator.dart';
// import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_cart.dart';
import 'package:halen_customer_app/components/appBar/help_appbar.dart';
import 'package:halen_customer_app/screens/eat/components/eat_cart/eat_cart_product.dart';
import 'package:halen_customer_app/screens/eat/components/eat_checkout/eat_checkout.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/eat/methods.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/cart_general/no_items_placeholder.dart';

class EatCart extends ConsumerStatefulWidget {
  const EatCart({
    Key? key,
  }) : super(key: key);

  @override
  EatCartState createState() => EatCartState();
}

class EatCartState extends ConsumerState<EatCart> {
  @override
  Widget build(BuildContext context) {
    List<EatOrder> sEatOrder = ref.watch(eatOrderProv);

    List<Widget> buildSeparatedVendorProducts = [];

    double calcDeliveryFeeForOrderRes = calcDeliveryFeeForOrder(sEatOrder);
    double calcOrderSubtotalRes = calcOrderSubtotal(sEatOrder);

    bool cartItemsIsEmpty = true;
    if (ref.watch(cicProv) > 0) {
      cartItemsIsEmpty = false;
    }

    int orderIndex = 0;
    for (var eod in sEatOrder) {
      int locOrderIndex = orderIndex;
      buildSeparatedVendorProducts.add(ListView.separated(
        padding: EdgeInsets.only(top: 10.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: eod.items.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return eod.items.isEmpty
                ? Container()
                : ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              children: [
                                Text(
                                  eod.vendor.name,
                                  style: TextStyle(
                                      color: AppColors.bglDefTextColor,
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        SizedBox(height: 4.w),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              eod.vendor.shortDesc!,
                              style: TextStyle(
                                  color: AppColors.bglDefTextColor,
                                  fontSize: 12.w),
                            )),
                      ]);
          }
          return eod.items.isEmpty
              ? Container()
              : EatCartProduct(
                  product: eod.items[index - 1] as EatProduct,
                  vendor: eod.vendor as EatVendor,
                  orderIndex: locOrderIndex,
                  orderItemIndex: index - 1,
                );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 10.h,
            thickness: 2,
            color: Colors.transparent,
          );
        },
      ));

      orderIndex += 1;
    }

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.baseGreyColor,
            body: Column(
              children: [
                const HelpAppBar(title: "Eat Cart"),
                cartItemsIsEmpty
                    ? const CartNothingHere()
                    : Expanded(
                        // child: SingleChildScrollView(
                        child: ListView(
                          children: [
                            ...buildSeparatedVendorProducts,
                            ...[
                              Container(
                                height: 180.h,
                                margin:
                                    EdgeInsets.fromLTRB(14.w, 24.h, 14.w, 12.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 24.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.grey600),
                                        ),
                                        Text(
                                          twoDecItemPriceString(
                                              calcOrderSubtotalRes),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 18.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Delivery Fee',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.grey600),
                                        ),
                                        Text(
                                          twoDecItemPriceString(
                                              calcDeliveryFeeForOrderRes),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25.h),
                                    const DashedSeparator(color: Colors.grey),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.grey600),
                                        ),
                                        Text(
                                          '\$${(calcOrderSubtotalRes + calcDeliveryFeeForOrderRes).toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          ],
                        ),
                      ),
                cartItemsIsEmpty
                    ? Container()
                    : Container(
                        margin: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 10.h),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const EatCheckout();
                              },
                            ));

                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.color20A39E,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          child: Container(
                            height: 48.h,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              "CHECKOUT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            )));
  }
}
