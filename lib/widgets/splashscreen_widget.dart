import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadialCircles extends StatelessWidget {
  final double left, top;
  final Color primaryColor;
  final Color borderColor;
  final double width, height;
  final Widget? child;
  const RadialCircles({
    super.key,
    required this.left,
    required this.top,
    required this.primaryColor,
    required this.borderColor,
    required this.width,
    required this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              // BoxShadow(
              //   color: Colors.black12,
              //   blurRadius: 6.r,
              //   offset: const Offset(4, 4), // Shadow position
              // ),
            ],
            shape: BoxShape.circle,
            color: primaryColor,
            border: Border.all(
                color: borderColor, width: 0.5.w, style: BorderStyle.solid),
          ),
          child: child),
    );
  }
}
