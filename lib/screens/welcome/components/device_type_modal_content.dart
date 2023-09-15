import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

AlertDialog deviceTypeModalContent(BuildContext context) {
  return AlertDialog(
    content: Column(
      children: [
        Padding(
            padding: EdgeInsets.all(.04.sh),
            child: Container(
                padding: EdgeInsets.all(.04.sh),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
                child: SizedBox(
                  width: .05.sh,
                  height: .05.sh,
                  child: Center(
                      child: Image.asset(
                    "assets/logos/halen_logo.png",
                    fit: BoxFit.contain,
                  )),
                ))),
        Text(
          'Desktop Detected\n\n',
          style: TextStyle(
              fontSize: 20.h,
              fontWeight: FontWeight.w500,
              color: AppColors.bglDefTextColor),
        ),
        Text(
            "It appears you're trying to access Halen "
            "on a desktop. Please open Halen on "
            "your mobile device's browser to use the app. \n\n"
            "You can find it at https://app.gethalen.com.",
            style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w500,
                color: AppColors.bglDefTextColor))
      ],
    ),
    actions: const <Widget>[
      // TextButton(
      //   child: const Text('Back'),
      //   onPressed: () {
      //     Navigator.of(context).pop();
      //   },
      // ),
      // TextButton(
      //   child: const Text('Ok'),
      //   onPressed: () {
      //     Navigator.of(context).pop();
      //   },
      // ),
    ],
  );
}
