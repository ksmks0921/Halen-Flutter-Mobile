import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    Key? key,
    required this.starCount,
    required this.alignment,
    this.starColor = Colors.yellow,
    this.starSpacing = 12.0,
  }) : super(key: key);

  final MainAxisAlignment alignment;
  final int starCount;
  final Color starColor;
  final double starSpacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(
        5,
        (index) {
          if (index + 1 > starCount) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SizedBox(
                  width: 12.w,
                  height: 12.w,
                  child: const Icon(
                    Icons.star_border,
                    color: Colors.black38,
                  ),
                ));
          } else {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SizedBox(
                  width: 12.w,
                  height: 12.w,
                  child: Icon(
                    Icons.star,
                    color: starColor,
                  ),
                ));
          }
        },
      ),
    );
  }
}
