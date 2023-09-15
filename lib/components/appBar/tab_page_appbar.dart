// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:halen_customer_app/components/appBar/appbar_location_title_column.dart';
// import 'package:halen_customer_app/constants/colors.dart';
// // import 'package:halen_customer_app/components/appBar/cart_action_with_badge.dart';
// // import 'package:halen_customer_app/components/appBar/appbar_constants.dart';
// // import 'package:halen_customer_app/components/appBar/appbar_leading_buttons.dart';
//
// class TabPageAppBar extends StatelessWidget {
//   const TabPageAppBar({
//     super.key,
//     required this.name,
//     this.subTitle,
//   });
//
//   final String name;
//   final String? subTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     double leadingAvatarSize = .0458.sh;
//     return Container(
//         width: 1.sw,
//         height: .1.sh,
//         color: AppColors.greenColor,
//         child: Stack(
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               SizedBox(width: 16.w),
//               subTitle == null
//                   ? Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.only(
//                                 bottom: (leadingAvatarSize / 3)),
//                             child: Text(
//                               "Welcome, $name",
//                               style: TextStyle(
//                                   fontSize: 18.h, color: Colors.white),
//                             ))
//                       ],
//                     )
//                   : AppBarLocationTitleCol(name: name, text: subTitle!
//                       // center: true,
//                       // location: location,
//                       )
//             ]),
//           ],
//         ));
//   }
// }
