import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';

class OrdersNothingHere extends StatelessWidget {
  const OrdersNothingHere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Nothing here yet",
          style: w400_19Avenir(),
        )
      ],
    );
  }
}
