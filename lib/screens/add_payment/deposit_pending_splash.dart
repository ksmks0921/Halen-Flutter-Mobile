import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';

class DepositPendingSplash extends StatelessWidget {
  const DepositPendingSplash({Key? key}) : super(key: key);

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
              const CircularProgressIndicator(),
              Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Text(
                    "Verifying Deposit ...",
                    style: w400_19Avenir(),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
