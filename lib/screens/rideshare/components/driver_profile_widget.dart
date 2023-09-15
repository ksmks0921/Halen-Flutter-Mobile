import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

class DriverProfileWidget extends StatefulWidget {
  const DriverProfileWidget({super.key});

  @override
  State<DriverProfileWidget> createState() => _DriverProfileWidgetState();
}

class _DriverProfileWidgetState extends State<DriverProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 111.h,
        width: 1.sw,
        color: Colors.white,
        child: Center(
            child: Row(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55.h,
                      height: 55.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/illustrations/profile_image.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  ])),
          SizedBox(
              width: .5.sw,
              height: 110.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                // shrinkWrap: true,
                children: [
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Ben Stokes",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      Text("4.9",
                          style: TextStyle(
                              color: AppColors.grey500, fontSize: 16.sp)),
                    ],
                  ),
                ],
              ))
        ])));
  }
}
