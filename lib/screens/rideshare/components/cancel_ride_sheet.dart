import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/payment_card_information.dart';
import 'package:halen_customer_app/constants/colors.dart';

class CancelRideSheet extends StatefulWidget {
  final bool visible;
  const CancelRideSheet({Key? key, required this.visible}) : super(key: key);

  @override
  State<CancelRideSheet> createState() => _CancelRideSheetState();
}

class _CancelRideSheetState extends State<CancelRideSheet> {
  int? groupValue;
  List<String> cancellationReasons = [
    "I don't need this trip",
    "I want to edit my trip",
    "The driver took too long to be appointed.",
    "Other"
  ];
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cancellationReasons.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: index,
                  groupValue: groupValue,
                  activeColor: AppColors.greenColor,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.w),
                  title: Text(
                    cancellationReasons[index],
                    style: TextStyle(color: AppColors.grey500, fontSize: 16.sp),
                  ),
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                );
              }),
          Padding(
            padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const PaymentCardInformation(
                  showArrow: false,
                ),
                SizedBox(
                  height: 45.h,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 3,
                    color: AppColors.grey400,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, right: 8.w, bottom: 8.h),
                            child: Text("Distance",
                                style: TextStyle(
                                    color: AppColors.grey500, fontSize: 16.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.w, right: 8.w, bottom: 8.h),
                            child: Text("Time",
                                style: TextStyle(
                                    color: AppColors.grey500, fontSize: 16.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 16.w, right: 8.w, bottom: 8.h),
                            child: Text("Price",
                                style: TextStyle(
                                    color: AppColors.grey500, fontSize: 16.sp)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, right: 12.w),
                            child: Text("1.4 mil",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, right: 12.w),
                            child: Text("6 min",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, right: 12.w),
                            child: Text("\$35.50",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.sp)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
