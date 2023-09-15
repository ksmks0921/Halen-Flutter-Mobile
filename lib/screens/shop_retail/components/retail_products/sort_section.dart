import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

class SortSection extends StatelessWidget {
  const SortSection({super.key, required this.onCloseSortFilter});
  final VoidCallback onCloseSortFilter;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 200.h,
      left: 0,
      right: 0,
      bottom: 74.h,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.zero, // Remove bottom border radius
            bottomRight: Radius.zero, // Remove bottom border radius
          ),
        ),
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.h),
            Text(
              'SORT BY',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              height: 1.h,
              color: AppColors.colorE4E4E4,
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                onCloseSortFilter();
                // Handle the first option click
              },
              child: Text(
                "What's New",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                onCloseSortFilter();
                // Handle the second option click
              },
              child: Text(
                "Price - High to Low",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                onCloseSortFilter();
                // I want to call _closeSortFilter of retail widget here to close
                // Handle the third option click
              },
              child: Text(
                "Price - Low to High",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
