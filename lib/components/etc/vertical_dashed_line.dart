import 'package:flutter/material.dart';

class VerticalDashedLine extends StatelessWidget {
  const VerticalDashedLine(
      {Key? key, this.thickness = 1, this.color = Colors.black})
      : super(key: key);
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainHeight();
        double dashLength = 2;
        final dashThickness = thickness;
        final dashCount = (boxHeight / (2 * dashLength)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashThickness,
              height: dashLength,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
