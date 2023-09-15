import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/orders/components/order_lvi_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:halen_customer_app/screens/orders/track_components/order_details_line_items.dart';
import 'package:halen_customer_app/screens/orders//track_components/order_stages_line_indicator.dart';
import 'package:halen_customer_app/screens/orders/track_components/track_order_payment_details.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class TrackShopScreen extends StatelessWidget {
  const TrackShopScreen({Key? key, required this.orderData}) : super(key: key);

  final Map orderData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.lightBgColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Column(
        children: [
          const AccountAppBar(title: "Track Order"),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
                  child: ListView(children: [
                    TrackShopHeader(
                      orderData: orderData,
                    ),
                  ])))
        ],
      ),
    ));
  }
}

class TrackShopHeader extends StatelessWidget {
  const TrackShopHeader({Key? key, required this.orderData}) : super(key: key);
  final Map orderData;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Wrap(
          alignment: WrapAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  OrderLVIIcon(orderData: orderData, size: 28.w),
                  SizedBox(width: 12.w),
                  Flexible(
                      child: Text(
                    orderData["service_storefront_name"],
                    // "asdfaskdjflasdjflkasdjflasjdflkasjdflkasjdflkajsdlkfjasdl",
                    style: TextStyle(
                      color: AppColors.primaryColor2,
                      fontSize: 20.w,
                    ),
                  ))
                ]),
            Padding(
                padding: EdgeInsets.all(16.w),
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
                    color: AppColors.navyButton,
                    child: Center(
                      child: Text(
                        "Order ${orderData["order_status_value"]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ))),
          ]),
      Column(children: [
        Padding(
            padding: EdgeInsets.only(top: 16.w),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(.03.sw)),
                child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        const OrderStagesLineIndicator(),
                        OrderDetailsLineItems(
                          orderData: orderData,
                        ),
                        TrackOrderPaymentDetails(
                          orderData: orderData,
                        ),
                        SizedBox(
                          height: 64.h,
                        )
                      ],
                    )))),
      ]),
      SizedBox(
        height: 64.h,
      )
    ]);
  }
}
