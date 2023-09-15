import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/components/checkout/go_to_category_buttons.dart';
import 'package:halen_customer_app/components/appBar/help_appbar.dart';
import 'package:halen_customer_app/screens/shop_retail/components/separator.dart';
import 'package:halen_customer_app/screens/orders/components/track_button.dart';
import 'package:halen_customer_app/screens/orders/data.dart';
import 'package:halen_customer_app/appstate/grocery_cart_state.dart';
import 'package:halen_customer_app/screens/eat/methods.dart';
import 'package:halen_customer_app/models/order_model_generic.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';

class GroceryConfirmCheckout extends ConsumerWidget {
  const GroceryConfirmCheckout({
    Key? key,
    required this.orders,
    required this.tipAmount,
  }) : super(key: key);

  final List<GOrder> orders;
  final double tipAmount;

  navigateAwayPress(BuildContext context, WidgetRef ref, String dest) {
    ref.read(grocOrderProv.notifier).clearCart();
    if (dest == "home") {
      ref.read(navStateProvider.notifier).state = 0;
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
    }
    if (dest == "track") {
      ref.read(navStateProvider.notifier).state = 0;
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
      pushTrackRouteForOrder(context, ordersInProgressData[0]);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double calcDeliveryFeeForOrderRes = calcDeliveryFeeForOrder(orders);
    double calcOrderSubtotalRes = calcOrderSubtotal(orders);

    List<Widget> builtConfirmVendorItems = [];

    for (GOrder eo in orders) {
      builtConfirmVendorItems.add(GroceryCheckoutConfirmVendorItemsList(
        orderData: eo,
      ));
    }
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.baseGreyColor,
            body: Column(
              children: [
                const HelpAppBar(
                  title: 'Order Placed',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Order Confirmation",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.color3B3551,
                              fontWeight: FontWeight.w700),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 1.h,
                              margin:
                                  EdgeInsets.fromLTRB(30.w, 50.h, 30.w, 50.h),
                              color: AppColors.grey300,
                            ),
                            Positioned(
                              top: 20.h,
                              left: 0,
                              right: 0,
                              bottom: 20.h,
                              child: Container(
                                width: 60.w,
                                height: 60.h,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Container(
                                  width: 40.w,
                                  height: 40.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.h),
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_dining_outlined,
                                    size: 24.r,
                                    color: AppColors.color20A39E,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Order Summary",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.color3B3551),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      // Handle the onTap event here
                                      // Add the logic for downloading the receipt
                                    },
                                    child: Text(
                                      'Download Receipt',
                                      style: TextStyle(
                                        color: AppColors.colorEF5B5B,
                                        fontSize: 11.sp,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    size: 24.r,
                                    color: AppColors.color20A39E,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "25/03/23, 11 AM",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        color: AppColors.color3B3551),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "ID: 27796430",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppColors.color3B3551),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              ...builtConfirmVendorItems,
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 30.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
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
                                    const SizedBox(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tip',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.grey600),
                                        ),
                                        Text(
                                          twoDecItemPriceString(tipAmount),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 26.h),
                                    const MySeparator(color: Colors.grey),
                                    SizedBox(height: 16.h),
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
                                                  calcDeliveryFeeForOrderRes +
                                                  tipAmount),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.color20A39E,
                                  foregroundColor: Colors.white,
                                  fixedSize: const Size(103, 27),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                                onPressed: () {
                                  // Handle button press event
                                  // Add the logic for tracking
                                  navigateAwayPress(context, ref, "track");
                                },
                                child: Text(
                                  "TRACK",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Continue Shopping",
                          style: TextStyle(
                              color: AppColors.color20A39E,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        CheckoutGoToCategoryButtons(
                            clearCartCB: navigateAwayPress),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 10.h),
                  child: ElevatedButton(
                    onPressed: () {
                      navigateAwayPress(context, ref, "home");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.color20A39E,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "HOME",
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

class GroceryCheckoutConfirmVendorItemsList extends StatelessWidget {
  const GroceryCheckoutConfirmVendorItemsList(
      {super.key, required this.orderData});

  final GOrder orderData;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.r),
                  border: Border.all(
                    color: AppColors.color134B97,
                    width: 1.w,
                  ),
                ),
                child: Image.asset(
                  // "assets/images/shop/Target_logo.png",
                  orderData.vendor.image,
                  width: 31.w,
                  height: 31.h,
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Target",
                    orderData.vendor.name,
                    style: TextStyle(
                        color: AppColors.color7D7871, fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 10.r,
                        color: AppColors.color7D7871,
                      ),
                      Text(
                        "856 Esta Unde",
                        style: TextStyle(
                            color: AppColors.color7D7871, fontSize: 10.sp),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColors.grey300,
          ),
          buildMultipleProductConfirms(context, orderData),
        ]);
  }

  Widget buildMultipleProductConfirms(BuildContext context, GOrder go) {
    return Column(
      children: List.generate(go.items.length,
          (index) => buildProductConfirm(context, go.items[index])),
    );
  }

  Widget buildProductConfirm(BuildContext context, GProduct product) {
    return Padding(
        padding: EdgeInsets.only(left: 10.w, top: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    child: Image.asset(
                      product.imageUrl,
                      width: 68.w,
                      height: 83.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "Ralph Lauren Cable-Knit Vest",
                      product.productName,
                      style: TextStyle(
                          fontSize: 11.sp, color: AppColors.color333836),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '1kg',
                      style: TextStyle(
                          fontSize: 9.sp, color: AppColors.color8E8E8E),
                    ),
                    SizedBox(height: 6.h),
                    Visibility(
                      visible: false,
                      child: Column(children: [
                        Row(
                          children: [
                            Text(
                              'Color: ',
                              style: TextStyle(
                                  fontSize: 9.sp, color: AppColors.color8E8E8E),
                            ),
                            Container(
                              width: 7.w,
                              height: 7.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                      ]),
                    ),
                    Text(
                      twoDecItemPriceString(product.price),
                      style: TextStyle(
                          fontSize: 9.sp, color: AppColors.color333836),
                    ),
                    SizedBox(height: 6.h),
                    SizedBox(
                      width: 12.w,
                      height: 12.h,
                      child: CircleAvatar(
                        backgroundColor: AppColors.color20A39E,
                        radius: 7.r,
                        child: Text(
                          product.quantity.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1.h,
              color: AppColors.grey300,
              // other properties and child widgets
            )
          ],
        ));
  }
}
