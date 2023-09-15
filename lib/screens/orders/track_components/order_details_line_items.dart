import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';

class OrderDetailsLineItems extends StatelessWidget {
  const OrderDetailsLineItems(
      {Key? key, required this.orderData, this.enableCallService})
      : super(key: key);
  final Map orderData;
  final bool? enableCallService;

  @override
  Widget build(BuildContext context) {
    TextStyle trackOrderSectionTS;
    trackOrderSectionTS =
        TextStyle(color: AppColors.primaryColor1, fontSize: 20.w);
    List buildOrderDetailsLineItems = [];

    for (var oi in orderData["order_items"]) {
      buildOrderDetailsLineItems.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w),
          child: Row(
            children: [
              Text(
                "${oi["title"]} - ${oi["quantity"]}",
                style: w400_19Avenir(),
              )
            ],
          )));
    }

    return Container(
        padding: EdgeInsets.all(16.w),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black38))),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Details",
                style: trackOrderSectionTS,
              ),
              enableCallService != null
                  ? Row(mainAxisSize: MainAxisSize.min, children: [
                      Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Container(
                              decoration: BoxDecoration(
                                  // border: Border.all(color: AppColors.primaryColor1),
                                  color: AppColors.primaryColor1,
                                  shape: BoxShape.circle),
                              padding: EdgeInsets.all(8.w),
                              child: Center(
                                child: Icon(
                                  Icons.call_sharp,
                                  color: Colors.white,
                                  size: 16.w,
                                ),
                              ))),
                      Text(
                        orderData["service_type"] == "Eat"
                            ? "Call Restaurant"
                            : orderData["service_type"] == "Grocery"
                                ? "Call Store"
                                : "",
                        style: TextStyle(color: AppColors.primaryColor1),
                      ),
                    ])
                  : Container()
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          ...buildOrderDetailsLineItems,
        ]));
  }
}
