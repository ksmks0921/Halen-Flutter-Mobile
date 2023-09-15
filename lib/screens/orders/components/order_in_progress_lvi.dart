import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/orders/orders_screen.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/screens/orders/components/order_lvi_icon.dart';
import 'package:halen_customer_app/screens/orders/components/track_button.dart';
import 'package:halen_customer_app/screens/orders/order_details_screens/eat_grocery_in_progress_details.dart';
import 'package:halen_customer_app/screens/orders/order_details_screens/shop_in_progress_details.dart';
import 'package:halen_customer_app/screens/orders/order_details_screens/ride_in_progress_details.dart';

class OrderInProgressLVI extends StatelessWidget {
  const OrderInProgressLVI({
    Key? key,
    required this.orderData,
  }) : super(key: key);

  final Map orderData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (orderData["service_type"] == "Ride") {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RideInProgressDetailsScreen(
                orderData: orderData,
              );
            }));
          } else if (orderData["service_type"] == "Eat") {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EatGroceryInProgressDetailsScreen(
                orderData: orderData,
              );
            }));
          } else if (orderData["service_type"] == "Grocery") {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EatGroceryInProgressDetailsScreen(
                orderData: orderData,
              );
            }));
          } else if (orderData["service_type"] == "Shop") {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ShopInProgressDetailsScreen(
                orderData: orderData,
              );
            }));
          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const OrdersScreen();
            }));
          }
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.w, color: Colors.black26))),
            child: Padding(
                padding: EdgeInsets.fromLTRB(8.w, 12.w, 8.w, 12.w),
                child: Material(
                    elevation: 5.1.h,
                    borderRadius: BorderRadius.circular(.03.sw),
                    child: Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(.03.sw),
                        ),
                        width: .9.sw,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Row(
                            children: [
                              OrderLVIIcon(orderData: orderData, size: 28.h),
                              Flexible(
                                  child: Center(
                                      child: Text(orderData["service_date"],
                                          style: w400_16Avenir()))),
                              Expanded(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                    Flexible(
                                        child:
                                            // Text("\$${orderData["order_total_cost"]}000000000000000",
                                            Text(
                                                "\$${orderData["order_total_cost"]}",
                                                style: TextStyle(
                                                    fontSize: 17.h,
                                                    color: AppColors
                                                        .primaryColor)))
                                  ]))
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.all(14.h),
                              child: Row(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                        Text(
                                          orderData["service_type"] == "Ride"
                                              ? orderData["ride_from_location"]
                                              : orderData[
                                                  "service_storefront_name"],
                                          style: w400_17Avenir(),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                size: 13,
                                              ),
                                              Text(
                                                  orderData["service_type"] ==
                                                          "Ride"
                                                      ? orderData[
                                                          "ride_to_location"]
                                                      : orderData[
                                                          "service_address"],
                                                  style: w300_13Poppins())
                                            ]),
                                      ])),
                                  Column(
                                    children: [
                                      Text(orderData["order_status_type"],
                                          style: TextStyle(
                                              color: AppColors.primaryColor)),
                                      Text(orderData["order_status_value"],
                                          style: TextStyle(
                                              color: AppColors.primaryColor)),
                                      SizedBox(height: 16.h),
                                      TrackButton(orderData: orderData)
                                    ],
                                  ),
                                ],
                              ))
                        ]))))));
  }
}
