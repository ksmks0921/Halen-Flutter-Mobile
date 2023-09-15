import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/payment_card_information.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/components/etc/vertical_dashed_line.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';

class TripDetailSheet extends ConsumerStatefulWidget {
  const TripDetailSheet({
    Key? key,
    required this.visible,
  }) : super(key: key);
  final bool visible;

  @override
  TripDetailSheetState createState() => TripDetailSheetState();
}

class TripDetailSheetState extends ConsumerState<TripDetailSheet> {
  @override
  Widget build(BuildContext context) {
    String? getPrice = ref.watch(rsPriceProv) ?? "0";
    String? getTax = (double.parse(getPrice) * .08).toStringAsFixed(2);
    String getTotal = (double.parse(getPrice) + double.parse(getTax))
        .toStringAsFixed(2)
        .toString();

    return Visibility(
      visible: widget.visible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Container(
                color: Colors.grey[100],
                child: Row(children: [
                  Icon(
                    Icons.my_location,
                    color: AppColors.greenColor,
                    size: 30,
                  ),
                  SizedBox(width: 15.w),
                  Text("Skate Park",
                      style: TextStyle(
                          fontSize: 15.h, fontWeight: FontWeight.w500))
                ])),
          ),
          SizedBox(
            height: 50.h,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 5 + 15 + 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h, child: const VerticalDashedLine()),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text("Distance:  1.4 mil",
                        style: TextStyle(
                            fontSize: 15.h, fontWeight: FontWeight.w500)),
                    SizedBox(width: 20.w),
                    Text("Time:  6 min",
                        style: TextStyle(
                          fontSize: 14.h,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                color: Colors.grey[100],
                child: Row(children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 30.h,
                  ),
                  SizedBox(width: 15.w),
                  Text("Home",
                      style: TextStyle(
                          fontSize: 15.h, fontWeight: FontWeight.w500))
                ]),
              )),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 24.h),
            margin: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Detail",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Trip Mileage Price",
                        style: TextStyle(color: Colors.black)),
                    Text("\$$getPrice",
                        style: const TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 10.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount Voucher",
                        style: TextStyle(color: Colors.black)),
                    Text("\$0.00", style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tax and Fees",
                        style: TextStyle(color: Colors.black)),
                    Text("\$$getTax",
                        style: const TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total", style: TextStyle(color: Colors.black)),
                    Text("\$$getTotal",
                        style: const TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    const PaymentCardInformation(
                      showArrow: false,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
