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

class EatGroceryInProgressDetailsScreen extends StatefulWidget {
  const EatGroceryInProgressDetailsScreen({Key? key, required this.orderData})
      : super(key: key);

  final Map orderData;
  @override
  State<EatGroceryInProgressDetailsScreen> createState() =>
      _EatGroceryInProgressDetailsScreenState();
}

class _EatGroceryInProgressDetailsScreenState
    extends State<EatGroceryInProgressDetailsScreen> {
  List<Widget> orderItems = [];
  @override
  Widget build(BuildContext context) {
    int odIdx = 0;
    widget.orderData["order_items"].forEach((Map item) {
      orderItems.add(OrderDetailsOrderItem(
        orderData: widget.orderData,
        index: odIdx,
      ));
      odIdx += 1;
    });

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
                  ...orderItems,
                  OrderDetailsOrderFooter(orderData: widget.orderData),
                ]))
              ],
            )));
  }
}

class OrderDetailsOrderItem extends StatelessWidget {
  const OrderDetailsOrderItem(
      {Key? key, required this.orderData, required this.index})
      : super(key: key);

  final Map orderData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.w, color: Colors.black26))),
            child: Material(
                elevation: 8.w,
                child: Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(.03.sw),
                      color: Colors.white,
                    ),
                    width: .9.sw,
                    height: .4.sw,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: .16.sw,
                              height: .28.sw,
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                orderData["order_items"][index]["img_path"],
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            orderData["order_items"][index]
                                                ["title"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.w,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Text(
                                            orderData["order_items"][index]
                                                ["subtitle"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.w,
                                                fontWeight: FontWeight.w300)),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Text(
                                            "\$${orderData["order_items"][index]["price"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.w,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Icon(
                                          Icons.info,
                                          size: 18.w,
                                          color: Colors.yellow[800],
                                        )
                                      ]))),
                        ],
                      )
                    ])))));
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
                              'Delivery Fee',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                            Text(
                              '\$${orderData["delivery_fee"]}',
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
                              'Tax',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                            Text(
                              '\$${orderData["tax"]}',
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
                                    orderData["delivery_fee"],
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
                    height: .4.sw,
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
                                Text(
                                  orderData["service_storefront_name"],
                                  style: w400_17Avenir(),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 13,
                                      ),
                                      Text(orderData["service_address"],
                                          style: w300_13Poppins())
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
