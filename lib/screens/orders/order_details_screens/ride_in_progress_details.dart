import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/screens/shop_retail/components/separator.dart';
import 'package:halen_customer_app/screens/orders/components/order_lvi_icon.dart';
import 'package:halen_customer_app/screens/orders/components/track_button.dart';
import 'package:halen_customer_app/screens/orders/components/contact_us_button.dart';
import 'package:halen_customer_app/screens/orders/methods/calc_order_total.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class RideInProgressDetailsScreen extends StatefulWidget {
  const RideInProgressDetailsScreen({Key? key, required this.orderData})
      : super(key: key);

  final Map orderData;
  @override
  State<RideInProgressDetailsScreen> createState() =>
      _RideInProgressDetailsScreenState();
}

class _RideInProgressDetailsScreenState
    extends State<RideInProgressDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.lightBgColor,
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(
              children: [
                const AccountAppBar(title: "Order Details"),
                Expanded(
                    child: ListView(children: [
                  OrderDetailsOrderHeader(
                    orderData: widget.orderData,
                  ),
                  OrderDetailsOrderFooter(orderData: widget.orderData),
                ]))
              ],
            )));
  }
}

class OrderDetailsOrderFooter extends StatelessWidget {
  const OrderDetailsOrderFooter({Key? key, required this.orderData})
      : super(key: key);

  final Map orderData;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                // borderRadius:BorderRadius.circular(.03.sw)),

                child: Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 12.w, 8.w, 0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                            Text(
                              '\$${orderData["subtotal"]}',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tip',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                            Text(
                              '\$${orderData["tip"]}',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Driver Fee',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                            Text(
                              '\$${orderData["driver_fee"]}',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        const MySeparator(color: Colors.grey),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 17.w, color: Colors.black),
                            ),
                            Text(
                              "\$${calcOrderTotalFromSlis([
                                    orderData["subtotal"],
                                    orderData["driver_fee"],
                                    orderData["tax"]
                                  ])}",
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    )),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(.03.sw),
                      bottomLeft: Radius.circular(.03.sw)),
                ),
                height: 56.w,
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(16.w, 12.w, 8.w, 0.w),
              child: Container(
                  color: AppColors.lightBgColor,
                  height: .3.sh,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 24.w),
                          child: Row(children: [
                            Text(
                              "Have an issue?",
                              style: TextStyle(
                                  fontSize: 18.w, color: Colors.black),
                            ),
                            SizedBox(width: 12.w),
                            const ContactButton()
                          ]))
                    ],
                  ))),
        ]);
  }
}

class OrderDetailsOrderHeader extends StatelessWidget {
  const OrderDetailsOrderHeader({
    Key? key,
    required this.orderData,
  }) : super(key: key);

  final Map orderData;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.w, 16.w, 0.w),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(.03.sw),
                topRight: Radius.circular(.03.sw)),
            child: Material(
                elevation: 8.w,
                child: Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom:
                              BorderSide(width: 1.w, color: Colors.black26)),
                    ),
                    width: .9.sw,
                    // height: .4.sw,
                    child: Column(children: [
                      Row(
                        children: [
                          OrderLVIIcon(orderData: orderData, size: 28.w),
                          Expanded(
                              child: Center(
                                  child: Text(orderData["service_date"],
                                      style: w400_16Avenir()))),
                          SizedBox(
                            width: .15.sw,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: .08.sw,
                              child: Image.asset(
                                orderData["service_img_primary"],
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                Row(children: [
                                  SizedBox(width: .06.sw),
                                  Text(
                                    "From",
                                    style: w400_14Poppins(),
                                  ),
                                ]),
                                Text(
                                  orderData["ride_from_location"],
                                  style: w400_17Avenir(),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(children: [
                                  SizedBox(width: .06.sw),
                                  Text(
                                    "To",
                                    style: w400_14Poppins(),
                                  ),
                                ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(orderData["ride_to_location"],
                                          style: w400_17Avenir())
                                    ]),
                              ])),
                          Column(
                            children: [
                              Text(orderData["order_status_type"],
                                  style:
                                      TextStyle(color: AppColors.primaryColor)),
                              Text(orderData["order_status_value"],
                                  style:
                                      TextStyle(color: AppColors.primaryColor)),
                              SizedBox(height: 16.w),
                              TrackButton(orderData: orderData)
                            ],
                          ),
                        ],
                      )
                    ])))));
  }
}
