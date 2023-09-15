import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/orders/components/order_lvi_icon.dart';

class TrackDeliveryHeader extends StatelessWidget {
  const TrackDeliveryHeader({Key? key, required this.orderData})
      : super(key: key);
  final Map orderData;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.h),
        color: Colors.white70,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            OrderLVIIcon(orderData: orderData, size: 28.h),
            SizedBox(width: 12.w),
            SizedBox(
                width: .38.sw,
                child: Column(children: [
                  Text(
                    orderData["service_storefront_name"],
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20.h,
                    ),
                  )
                ]))
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                      color: AppColors.navyButton,
                      child: Center(
                          child: Row(children: [
                        Text(
                          "${orderData["est_delivery_time"]} mins ",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.white,
                          size: 12.h,
                        ),
                        Text(
                          " ${orderData["delivery_on_time"]}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ]))))
            ],
          ),
        ]));
  }
}
