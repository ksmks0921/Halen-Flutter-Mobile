import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/appBar/appbar_location_title_column.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/components/appBar/cart_action_with_badge.dart';
import 'package:halen_customer_app/components/appBar/appbar_leading_buttons.dart';

class ProfileNameCartAppBar extends StatelessWidget {
  const ProfileNameCartAppBar({
    super.key,
    required this.name,
    // required this.location,
    required this.image,
    this.subTitle,
    this.cartOnTap,
    this.cartItemCount,
  });

  final String name;
  // final String location;
  final String? subTitle;
  final String image;
  final Function? cartOnTap;
  final int? cartItemCount;

  @override
  Widget build(BuildContext context) {
    double leadingAvatarSize = .0458.sh;
    double actionBottomPadding = 12.h;
    double actionHorizontalPadding = 16.w;
    double actionButtonSize = 27.h;
    return Container(
        width: 1.sw,
        // height: .088.sh,
        color: AppColors.greenColor,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: .01.sh),
            child: Stack(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    AppBarLeadingAvatarButton(
                      image: image,
                      size: leadingAvatarSize,
                    )
                  ]),
                  SizedBox(width: 16.w),
                  subTitle == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Padding(
                            //     padding: EdgeInsets.only(
                            //         bottom: (leadingAvatarSize / 3)),
                            //     child:
                            Text(
                              "Welcome, $name",
                              style: TextStyle(
                                  fontSize: 19.h, color: Colors.white),
                            )
                            // )
                          ],
                        )
                      : AppBarLocationTitleCol(name: name, text: subTitle!
                          // center: true,
                          // location: location,
                          )
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
