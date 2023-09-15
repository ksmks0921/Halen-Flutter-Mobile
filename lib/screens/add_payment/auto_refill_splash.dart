import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';

class AutoRefillSplash extends StatelessWidget {
  const AutoRefillSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Icon(
                    Icons.check,
                    color: AppColors.primaryColor2,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Text(
                    "Auto Refill Set!",
                    style: w400_19Avenir(),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
