import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionBulletPoint extends StatelessWidget {
  const SelectionBulletPoint(
      {Key? key, required this.index, required this.selectedIndex})
      : super(key: key);

  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 24.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 12.h,
              height: 12.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.black),
                color: index == selectedIndex ? Colors.black : null,
              ),
            )
          ],
        ));
  }
}
