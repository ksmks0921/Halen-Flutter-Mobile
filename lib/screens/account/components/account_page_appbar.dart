import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/components/appBar/appbar_leading_buttons.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({Key? key, required this.title, this.actions})
      : super(key: key);

  final String title;
  final Widget? actions;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: .08.sh,
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [actions ?? Container()]),
                ])
          ],
        ));
    // return AppBar(
    //   systemOverlayStyle: SystemUiOverlayStyle.dark,
    //   backgroundColor: AppColors.greenColor,
    //   centerTitle: true,
    //   leading: AppBarLeadingBackButton(
    //     actionBottomPadding: 15.h,
    //     actionHorizontalPadding: 16.w,
    //     actionButtonSize: 27.h * .8,
    //   ),
    //   title: Column(
    //     children: [
    //       Text(
    //         title,
    //         style: TextStyle(fontSize: 16.sp),
    //       ),
    //     ],
    //   ),
    //   actions: [actions ?? Container()],
    // );
  }
}
