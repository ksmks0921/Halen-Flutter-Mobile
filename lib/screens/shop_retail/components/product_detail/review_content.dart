import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/shop_retail/components/product_detail/rate_widget.dart';

class ReviewContent extends StatelessWidget {
  final String title;
  final String content;
  final String reviewerName;
  final String reviewDate;
  final int starCount;

  const ReviewContent({
    Key? key,
    required this.title,
    required this.content,
    required this.reviewerName,
    required this.reviewDate,
    required this.starCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RateWidget(
                starCount: starCount,
                starColor: Colors.yellow,
              ),
              SizedBox(height: 20.h),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                content,
                style: TextStyle(
                  color: AppColors.blackButton,
                  fontSize: 9.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '- $reviewerName',
                style: TextStyle(
                  color: AppColors.blackButton,
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                reviewDate,
                style: TextStyle(
                  color: AppColors.color868686,
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
