import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

class GroceryAppBarReset extends StatelessWidget {
  const GroceryAppBarReset({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.greenColor,
      leading: IconButton(
        icon: ImageIcon(
          const AssetImage('assets/images/icons/back.png'),
          size: 18.h,
          color: AppColors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(fontSize: 21.sp),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Handle Help button click
          },
          child: Text(
            'Reset',
            style: TextStyle(color: AppColors.white, fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}
