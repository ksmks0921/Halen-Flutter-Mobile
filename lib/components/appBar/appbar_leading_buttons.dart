import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/routes/route_constants.dart';

class AppBarLeadingBackButton extends StatelessWidget {
  const AppBarLeadingBackButton({
    super.key,
    required this.actionBottomPadding,
    required this.actionHorizontalPadding,
    required this.actionButtonSize,
  });

  final double actionBottomPadding;
  final double actionHorizontalPadding;
  final double actionButtonSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.only(
              bottom: actionBottomPadding, left: actionHorizontalPadding),
          // padding: EdgeInsets.only(bottom:0),
          child:
              // IconButton(
              // icon:
              Image.asset(
            'assets/images/icons/back.png',
            width: actionButtonSize,
            height: actionButtonSize,
            fit: BoxFit.fitWidth,
          ),
          // onPressed: () {
          //   Navigator.of(context).pop();
          // },
          // )
        ));
  }
}

class AppBarLeadingAvatarButton extends ConsumerWidget {
  const AppBarLeadingAvatarButton(
      {super.key, required this.image, required this.size});

  final String image;
  final double size;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () {
          ref.read(navStateProvider.notifier).state = 3;
          Navigator.of(context)
              .pushNamedAndRemoveUntil(accountRoute, (route) => false);
        },
        child: Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 6.h),
            child: Container(
              width: .0458.sh,
              height: .0458.sh,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(50),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )));
  }
}
