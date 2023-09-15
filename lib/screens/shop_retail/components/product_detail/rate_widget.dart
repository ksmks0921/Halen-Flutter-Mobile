import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  final int starCount;
  final Color starColor;
  final double starSpacing;

  const RateWidget({
    Key? key,
    required this.starCount,
    this.starColor = Colors.yellow,
    this.starSpacing = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        starCount * 2 - 1,
        (index) {
          if (index % 2 == 0) {
            return SizedBox(
              width: 12,
              height: 12,
              child: Icon(
                Icons.star,
                color: starColor,
              ),
            );
          } else {
            return SizedBox(width: starSpacing);
          }
        },
      ),
    );
  }
}
