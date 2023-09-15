import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

enum AddOrRemove { add, remove }

class CartQuantityEditButton extends StatelessWidget {
  const CartQuantityEditButton(
      {super.key, required this.onTap, required this.addOrRemove});
  final Function onTap;
  final AddOrRemove addOrRemove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 32.h,
        height: 32.h,
        decoration: BoxDecoration(
            color: AppColors.grey300, borderRadius: BorderRadius.circular(4.h)
            // shape: BoxShape.circle,
            ),
        child: Icon(
          addOrRemove == AddOrRemove.add ? Icons.add : Icons.remove,
          color: Colors.black,
          size: 14.h,
        ),
      ),
    );
  }
}
