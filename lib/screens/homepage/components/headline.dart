import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headline extends StatelessWidget {
  const Headline({super.key, required this.headline});
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          headline,
          style: TextStyle(
              color: Colors.grey[900],
              // fontWeight: FontWeight.w500,
              fontSize: 19.h),
        )
      ]),
    );
  }
}
