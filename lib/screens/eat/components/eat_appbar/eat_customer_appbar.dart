// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:halen_customer_app/appstate/eat_cart_state.dart';
// import 'package:halen_customer_app/constants/colors.dart';
// import 'package:halen_customer_app/components/appBar/cart_action_with_badge.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class EatCustomerAppBar extends ConsumerWidget {
//   const EatCustomerAppBar(
//       {super.key,
//       required this.name,
//       required this.location,
//       required this.image,
//       required this.poppable,
//       required this.cartOnTap});
//
//   final String name;
//   final String location;
//   final String image;
//   final bool poppable;
//   final Function cartOnTap;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //cart items count
//     int cic = ref.watch(cicProv);
//     double actionBottomPadding = 12.h;
//     double actionButtonSize = 24.h;
//     return AppBar(
//       systemOverlayStyle: SystemUiOverlayStyle.dark,
//       backgroundColor: AppColors.greenColor,
//       leading: !poppable
//           ? Padding(
//               padding: EdgeInsets.only(left: 10.w, top: 9.h, bottom: 9.h),
//               child: Container(
//                 width: 100.w,
//                 decoration: BoxDecoration(
//                   // borderRadius: BorderRadius.circular(50),
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: AssetImage(image),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             )
//           : IconButton(
//               icon: const ImageIcon(
//                 AssetImage('assets/images/icons/back.png'),
//                 size: 18.0,
//                 color: AppColors.white,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//       centerTitle: false,
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Welcome, $name',
//             style: TextStyle(fontSize: 16.sp),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 3.h),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.location_on_outlined,
//                   size: 13.sp,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   location,
//                   style: TextStyle(
//                       fontSize: 12.sp,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         CartActionWithBadge(
//             actionBottomPadding: actionBottomPadding,
//             cartIconHeight: actionButtonSize,
//             actionHorizontalPadding: 16.w,
//             cartOnTap: cartOnTap,
//             cartItemCount: cic)
//       ],
//     );
//   }
// }
