import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/app_colors.dart';

Map iconForServiceType = {
  "Eat": Icons.local_restaurant,
  "Grocery": Icons.local_grocery_store_outlined,
  "Ride": Icons.car_rental,
  "Shop": Icons.shopping_basket_outlined
};

class OrderLVIIcon extends StatelessWidget {
  const OrderLVIIcon({Key? key, required this.orderData, required this.size})
      : super(key: key);
  final Map orderData;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size + (size / 2),
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor, shape: BoxShape.circle),
            padding: EdgeInsets.all(size / 4),
            child: Center(
                child: Icon(
              iconForServiceType[orderData["service_type"]],
              color: Colors.white,
              size: size,
            ))));
  }
}
