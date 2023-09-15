import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    // double actionBottomPadding = 15.h;

    return Container(
        width: 1.sw,
        // height: .088.sh,
        color: AppColors.greenColor,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: .02.sh),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // Padding(
                  //     padding: EdgeInsets.only(bottom: actionBottomPadding),
                  //     child:
                  SizedBox(
                      width: .7.sw,
                      // height: 17.sp,
                      child: Center(
                          child: Text(title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 19.h, color: Colors.white))))
                  // )
                ])
              ],
            )));
  }
}
