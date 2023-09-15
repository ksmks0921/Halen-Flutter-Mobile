import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

class CancelledReasonLVI extends StatelessWidget {
  const CancelledReasonLVI(
      {Key? key,
      required this.label,
      required this.index,
      required this.selectedIndex,
      required this.chooseItemCB})
      : super(key: key);
  final String label;
  final int index;
  final int? selectedIndex;
  final Function chooseItemCB;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          chooseItemCB(index);
        },
        child: Material(
            elevation: 8.w,
            child: SizedBox(
                height: 48.h,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 32.w),
                          child: Container(
                            height: 16.w,
                            width: 16.w,
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? AppColors.primaryColor1
                                    : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: selectedIndex == index
                                        ? AppColors.primaryColor1
                                        : Colors.black45,
                                    width: 2.w)),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 32.w),
                          child: Text(
                            label,
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.w),
                          ))
                    ]))));
  }
}
