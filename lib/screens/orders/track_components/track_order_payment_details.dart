import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';

class TrackOrderPaymentDetails extends StatelessWidget {
  const TrackOrderPaymentDetails({Key? key, required this.orderData})
      : super(key: key);
  final Map orderData;

  @override
  Widget build(BuildContext context) {
    TextStyle trackOrderSectionTS;
    trackOrderSectionTS =
        TextStyle(color: AppColors.primaryColor1, fontSize: 20.w);
    return Container(
        padding: EdgeInsets.all(16.w),
        child: Column(children: [
          Row(
            children: [
              Text(
                "Payment Details",
                style: trackOrderSectionTS,
              )
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${orderData["order_total_cost"]}",
                    style: w400_19Avenir(),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                          height: 24.w,
                          child: Image.asset(
                            orderData["payment_method"]["icon"],
                            fit: BoxFit.fitHeight,
                          )),
                      SizedBox(width: 12.w),
                      orderData["payment_method"]["type"] == "visa"
                          ? Text(
                              "**** ${orderData["payment_method"]["card_number"].substring(12, 16)}",
                              style: TextStyle(
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black))
                          : Container()
                    ],
                  )
                ],
              )),
        ]));
  }
}
