import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/add_payment/add_new_payment.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/styles/app_colors.dart';

class AddPaymentsButton extends StatelessWidget {
  const AddPaymentsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AddPaymentsPage();
          }));
        },
        child: Container(
            width: 1.sw,
            height: 60.h,
            color: AppColors.lightBgColor,
            child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 16,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Text(
                          "Add new payment",
                          style: w400_16Poppins(),
                        ))
                  ],
                ))));
  }
}
