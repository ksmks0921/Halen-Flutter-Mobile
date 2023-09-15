import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/components/appBar/cart_action_with_badge.dart';
import 'package:halen_customer_app/components/appBar/appbar_leading_buttons.dart';

class PoppableTitleCartAppBar extends StatelessWidget {
  const PoppableTitleCartAppBar({
    super.key,
    required this.title,
    this.cartOnTap,
    this.cartItemCount,
  });

  final String title;
  final Function? cartOnTap;
  final int? cartItemCount;

  @override
  Widget build(BuildContext context) {
    double actionBottomPadding = 15.h;
    double actionHorizontalPadding = 16.w;
    double actionButtonSize = 27.h;

    return Container(
        width: 1.sw,
        height: .088.sh,
        color: AppColors.greenColor,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: .01.sh),
            child: Stack(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    AppBarLeadingBackButton(
                      actionBottomPadding: actionBottomPadding,
                      actionHorizontalPadding: actionHorizontalPadding,
                      actionButtonSize: actionButtonSize * .8,
                    )
                  ]),
                ]),
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: actionBottomPadding),
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
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  // actions: [
                  cartOnTap == null
                      ? Container()
                      : CartActionWithBadge(
                          actionBottomPadding: actionBottomPadding,
                          cartIconHeight: actionButtonSize,
                          actionHorizontalPadding: actionHorizontalPadding,
                          cartOnTap: () {
                            cartOnTap!();
                          },
                          cartItemCount: cartItemCount!)
                ])
              ],
            )));
  }
}
