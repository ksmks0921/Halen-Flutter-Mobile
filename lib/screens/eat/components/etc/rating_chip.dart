import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/eat/models.dart';

class RatingChip extends StatelessWidget {
  const RatingChip({Key? key, required this.vendor}) : super(key: key);

  final EatVendor vendor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(.02.sw),
          border: Border.all(color: Colors.black38)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 12.w,
            color: AppColors.starIconColor,
          ),
          Text(
            vendor.rating.toString(),
            style: TextStyle(color: AppColors.bglDefTextColor, fontSize: 14.w),
          ),
          SizedBox(width: 4.w),
          Text(
            "(${vendor.reviewCount.toString()})+",
            style: TextStyle(
                color: AppColors.bglDefTextColor,
                fontWeight: FontWeight.w300,
                fontSize: 12.w),
          ),
        ],
      ),
    );
  }
}
