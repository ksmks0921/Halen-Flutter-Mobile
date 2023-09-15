import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/app_colors.dart';

class CircleIndicator extends StatelessWidget {
  final bool selected;

  const CircleIndicator({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        maxRadius: selected ? 8 : 5,
        backgroundColor:
            selected ? AppColors.primaryColor : AppColors.primaryAccentColor,
      ),
    );
  }
}
