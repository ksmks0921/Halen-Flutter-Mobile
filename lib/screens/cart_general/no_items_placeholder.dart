import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartNothingHere extends StatelessWidget {
  const CartNothingHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: SizedBox(
                width: 44.w, child: const Icon(Icons.shopping_cart_outlined)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
                child: Text(
              "Cart is Empty",
              style: TextStyle(fontSize: 18.h),
            ))
          ])
        ],
      )),
    );
  }
}
