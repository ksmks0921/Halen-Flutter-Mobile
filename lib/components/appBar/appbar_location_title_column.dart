import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarLocationTitleCol extends StatelessWidget {
  const AppBarLocationTitleCol(
      {super.key, required this.name, required this.text, this.center = false});
  final String name;
  final String text;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Welcome, $name",
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(top: 3.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 13.h,
                color: Colors.white,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 12.h,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
