import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/screens/orders/components/order_lvi_icon.dart';
import 'package:halen_customer_app/screens/orders/components/rate_widget.dart';
import 'package:halen_customer_app/screens/orders/order_details_screens/order_history_details_screen.dart';
import 'package:halen_customer_app/screens/orders/order_details_screens/ride_history_details_screen.dart';

class OrderHistoryLVI extends StatelessWidget {
  const OrderHistoryLVI(
      {Key? key, required this.orderData, required this.rateTapCB})
      : super(key: key);

  final Map orderData;
  final Function rateTapCB;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (orderData["service_type"] == "Ride") {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RideHistoryDetailsScreen(
                orderData: orderData,
              );
            }));
          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return OrderHistoryDetailsScreen(
                orderData: orderData,
              );
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
                        padding: EdgeInsets.only(
                          top: 14.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(.03.sw),
                        ),
                        width: .9.sw,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              child: Row(
                                children: [
                                  OrderLVIIcon(
                                      orderData: orderData, size: 28.h),
                                  Flexible(
                                      child: Center(
                                          child: Text(orderData["service_date"],
                                              style: w400_16Avenir()))),
                                  Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                        Flexible(
                                            child: Text(
                                                "\$${orderData["order_total_cost"]}",
                                                style: TextStyle(
                                                    fontSize: 17.h,
                                                    overflow: TextOverflow.fade,
                                                    color: AppColors
                                                        .primaryColor)))
                                      ]))
                                ],
                              )),
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
                                          style: w400_15Avenir(),
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
                                            ])
                                      ])),
                                  Column(
                                    children: [
                                      Text(orderData["order_status_value"],
                                          style: TextStyle(
                                              color: orderData[
                                                          "order_status_value"] ==
                                                      "Complete"
                                                  ? AppColors.primaryColor
                                                  : Colors.redAccent)),
                                    ],
                                  ),
                                ],
                              )),
                          GestureDetector(
                              onTap: () {
                                rateTapCB();
                              },
                              child: Container(
                                  height: 44.h,
                                  padding:
                                      EdgeInsets.fromLTRB(24.h, 8.h, 8.h, 16.h),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(.03.sw),
                                        bottomLeft: Radius.circular(.03.sw)),
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                            height: 32.h,
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 12.h),
                                                      child: const Text(
                                                        "Rate:",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ))
                                                ])),
                                        SizedBox(
                                            height: 32.h,
                                            child: RateWidget(
                                              starCount: 0,
                                              starColor: Colors.black54,
                                              starSpacing: 24.h,
                                              alignment:
                                                  MainAxisAlignment.start,
                                            ))
                                      ])))
                        ]))))));
  }
}
