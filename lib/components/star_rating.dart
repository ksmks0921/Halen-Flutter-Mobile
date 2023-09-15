import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  const StarRating({
    Key? key,
    this.starCount = 5,
    this.iconSize = 35,
    this.rating = .0,
    required this.onRatingChanged,
    this.color = Colors.yellow,
  }) : super(key: key);

  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double iconSize;

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Colors.grey,
        size: iconSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: iconSize,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: iconSize,
      );
    }
    return InkResponse(
      onTap: () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
