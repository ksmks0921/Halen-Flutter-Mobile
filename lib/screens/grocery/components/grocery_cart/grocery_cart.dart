import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_cart/grocery_checkout.dart';
import 'package:halen_customer_app/components/appBar/help_appbar.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_cart/cart_product.dart';
import 'package:halen_customer_app/screens/shop_retail/components/separator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/appstate/grocery_cart_state.dart';
import 'package:halen_customer_app/screens/eat/methods.dart';
import 'package:halen_customer_app/screens/cart_general/no_items_placeholder.dart';
import 'package:halen_customer_app/models/service_types.dart';

class GroceryCart extends ConsumerWidget {
  const GroceryCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GroceryOrder> grocOrder = ref.watch(grocOrderProv);

    List<Widget> buildSeparatedVendorProducts = [];

    double calcDeliveryFeeForOrderRes = calcDeliveryFeeForOrder(grocOrder);
    double calcOrderSubtotalRes = calcOrderSubtotal(grocOrder);

    bool cartItemsIsEmpty = true;
    if (ref.watch(cicProv) > 0) {
      cartItemsIsEmpty = false;
    }

    int orderIndex = 0;
    for (var sod in grocOrder) {
      int locOrderIndex = orderIndex;
      buildSeparatedVendorProducts.add(ListView.separated(
        padding: EdgeInsets.only(top: 10.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: sod.items.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return sod.items.isEmpty
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
                                  sod.vendor.name,
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
                              sod.vendor.shortDesc ?? "",
                              style: TextStyle(
                                  color: AppColors.bglDefTextColor,
                                  fontSize: 12.w),
                            )),
                      ]);
          }
          return sod.items.isEmpty
              ? Container()
              : CartProduct(
                  serviceType: ServiceType.grocery,
                  product: sod.items[index - 1],
                  vendor: sod.vendor as GroceryVendor,
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
                const HelpAppBar(
                  title: 'Grocery Cart',
                ),
                cartItemsIsEmpty
                    ? const CartNothingHere()
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...buildSeparatedVendorProducts,
                              cartItemsIsEmpty
                                  ? Container()
                                  : Container(
                                      height: 180.h,
                                      margin: EdgeInsets.fromLTRB(
                                          14.w, 24.h, 14.w, 12.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 0.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(11.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 26.h,
                                          ),
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
                                                    color:
                                                        AppColors.primaryColor),
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
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 32.h),
                                          const MySeparator(color: Colors.grey),
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
                                                twoDecItemPriceString(
                                                    calcOrderSubtotalRes +
                                                        calcDeliveryFeeForOrderRes),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
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
                                return const GroceryCheckout();
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
