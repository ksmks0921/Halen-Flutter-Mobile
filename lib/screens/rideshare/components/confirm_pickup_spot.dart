import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/payment_card_information.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';

class ConfirmPickupSpotSheet extends ConsumerWidget {
  const ConfirmPickupSpotSheet(
      {Key? key, required this.visible, required this.maximizeSheetCB})
      : super(key: key);

  final bool visible;
  final Function maximizeSheetCB;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: visible,
      child: Container(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Drag map or edit address to set your pickup",
                    style: TextStyle(fontSize: 16.sp, color: AppColors.grey500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: TextField(
                onTap: () {
                  maximizeSheetCB(true);
                },
                onEditingComplete: () {
                  maximizeSheetCB(false);
                },
                onChanged: (value) {
                  ref.read(rsPickupLocationProv.notifier).state = value;
                },
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    prefixIcon: Icon(
                      Icons.location_searching,
                      color: AppColors.greenColor,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    hintText: "Choose pick up location"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "+ Add note for driver",
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.greyShade600),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: const PaymentCardInformation(),
            ),
          ],
        ),
      ),
    );
  }
}
