// import 'dart:ui';
// import 'package:flutter/material.dart';

// class PriceRange extends RangeSliderThumbShape {
//   static const double _thumbSize = 10.0;
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return Size.fromRadius(_thumbSize);
//   }

//   @override
//   Future<void> paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     bool isDiscrete = false,
//     bool isEnabled = false,
//     bool isOnTop = true,
//     required SliderThemeData sliderTheme,
//     required TextDirection textDirection,
//     required Thumb thumb,
//   }) async {
//     final Canvas canvas = context.canvas;
//     Path thumbPath;
//     switch (textDirection) {
//       case TextDirection.rtl:
//         switch (thumb) {
//           case Thumb.start:
//             thumbPath = _rightShape(_thumbSize, center);
//             break;
//           case Thumb.end:
//             thumbPath = _leftShape(_thumbSize, center);
//             break;
//         }
//         break;
//       case TextDirection.ltr:
//         switch (thumb) {
//           case Thumb.start:
//             thumbPath = _leftShape(_thumbSize, center);
//             break;
//           case Thumb.end:
//             thumbPath = _rightShape(_thumbSize, center);
//             break;
//         }
//         break;
//     }
//     canvas.drawPath(thumbPath, Paint()..color = sliderTheme.thumbColor!);
//   }
// }

// Path _rightShape(double size, Offset thumbCenter, {bool invert = false}) {
//   final Path thumbPath = Path();
//   final double halfSize = size / 1.5;
//   final double sign = invert ? -1.0 : 1.0;
//   thumbPath.moveTo(thumbCenter.dx + halfSize * sign, thumbCenter.dy);
//   thumbPath.lineTo(thumbCenter.dx - halfSize * sign, thumbCenter.dy - size);
//   thumbPath.lineTo(thumbCenter.dx - halfSize * sign, thumbCenter.dy + size);
//   thumbPath.close();
//   return thumbPath;
// }

// Path _leftShape(double size, Offset thumbCenter) =>
//     _rightShape(size, thumbCenter, invert: true);
