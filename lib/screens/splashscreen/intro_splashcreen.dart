import 'dart:async';
import 'package:flutter/material.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/widgets/image_view.dart';

class IntroSplashScreen extends StatefulWidget {
  const IntroSplashScreen({super.key});

  @override
  State<IntroSplashScreen> createState() => _IntroSplashScreenState();
}

class _IntroSplashScreenState extends State<IntroSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, welcomeRoute));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.primaryColor1,
            body: const Stack(
              children: [
                Center(
                  child: ImageView(
                    fit: BoxFit.fill,
                    path: 'assets/logos/splash.svg',
                  ),
                ),
              ],
            )));
  }
//     return Scaffold(
//         body: Container(
//       color: AppColors.primaryColor,
//       child: Stack(
//         children: [
//           RadialCircles(
//               left: -77.4.w,
//               top: -37.03.h,
//               primaryColor: AppColors.primaryColor3,
//               borderColor: Colors.black12,
//               width: 873.42.w,
//               height: 873.42.h),
//           RadialCircles(
//               left: 74.75.w,
//               top: 120.75,
//               primaryColor: AppColors.primaryColor2,
//               borderColor: Colors.black12,
//               width: 563.5.w,
//               height: 563.5.h),
//           RadialCircles(
//               left: 215.62,
//               top: 261.62,
//               primaryColor: AppColors.primaryColor1,
//               borderColor: Colors.black12,
//               width: 281.75.w,
//               height: 281.75.h,
//               child: const Padding(
//                 padding: EdgeInsets.only(right: 48),
//                 child: Center(
//                   child: ImageView(path: "assets/logos/halen_logo.png"),
//                 ),
//               ))
//         ],
//       ),
//     ));
//   }
// }
}
