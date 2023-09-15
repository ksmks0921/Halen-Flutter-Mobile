import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/components/appBar/appbar_leading_buttons.dart';

class HelpAppBar extends StatelessWidget {
  const HelpAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: .088.sh,
        color: AppColors.greenColor,
        child: Stack(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                AppBarLeadingBackButton(
                  actionBottomPadding: 15.h,
                  actionHorizontalPadding: 16.w,
                  actionButtonSize: 27.h * .8,
                )
              ]),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: SizedBox(
                        width: .7.sw,
                        // height: 17.sp,
                        child: Center(
                            child: Text(title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 19.h, color: Colors.white)))))
              ])
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      onPressed: () {
                        // Handle Help button click
                      },
                      child: Text(
                        'Help',
                        style:
                            TextStyle(color: AppColors.white, fontSize: 14.h),
                      ),
                    )
                  ]),
                ])
          ],
        ));

    // return AppBar(
    //   systemOverlayStyle: SystemUiOverlayStyle.dark,
    //   backgroundColor: AppColors.greenColor,
    //   leading: const AppBarLeadingBackButton(),
    //   centerTitle: true,
    //   title: Text(
    //     title,
    //     style: TextStyle(fontSize: 18.sp),
    //   ),
    //   actions: [
    //     TextButton(
    //       onPressed: () {
    //         // Handle Help button click
    //       },
    //       child: Text(
    //         'Help',
    //         style: TextStyle(color: AppColors.white, fontSize: 14.sp),
    //       ),
    //     ),
    //   ],
    // );
  }
}
