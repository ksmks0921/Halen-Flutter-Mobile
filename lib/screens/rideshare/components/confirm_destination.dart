import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';

class ConfirmDestinationSheet extends ConsumerWidget {
  const ConfirmDestinationSheet(
      {Key? key,
      required this.visible,
      required this.maximizeSheetCB,
      required this.showSheetCB})
      : super(key: key);
  final bool visible;
  final Function maximizeSheetCB;
  final Function showSheetCB;

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
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: TextField(
                onTap: () {
                  maximizeSheetCB(true);
                },
                onEditingComplete: () {
                  maximizeSheetCB(false);
                },
                onChanged: (value) {
                  ref.read(rsDestinationLocationProv.notifier).state = value;
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
                    hintText: "Pick a Destination"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
