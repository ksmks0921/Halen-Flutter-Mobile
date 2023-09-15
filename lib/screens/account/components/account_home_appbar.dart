import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';

class AccountHomeAppBar extends ConsumerWidget {
  const AccountHomeAppBar({Key? key, required this.title, this.actions})
      : super(key: key);

  final String title;
  final Widget? actions;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.greenColor,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.home),
        onPressed: () {
          ref.read(navStateProvider.notifier).state = 0;
          Navigator.of(context)
              .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
        },
      ),
      title: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
      actions: [actions ?? Container()],
    );
  }
}
