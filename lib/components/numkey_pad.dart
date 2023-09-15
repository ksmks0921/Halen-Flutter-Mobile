import 'package:flutter/material.dart';

class OnScreenNumericKeypad extends StatefulWidget {
  const OnScreenNumericKeypad(
      {Key? key,
      required this.keyEntryCB,
      required this.backspace,
      required this.keyColor,
      required this.keyWidth,
      required this.keyHeight,
      required this.keySpacing,
      required this.keyRadius,
      required this.matButElevation,
      required this.keyStyle})
      : super(key: key);

  final Function keyEntryCB;
  final Function backspace;
  final Color keyColor;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;
  final double keySpacing;
  final double matButElevation;
  final TextStyle keyStyle;

  @override
  OnScreenNumericKeypadState createState() => OnScreenNumericKeypadState();
}

class OnScreenNumericKeypadState extends State<OnScreenNumericKeypad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 1,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle),
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 2,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle),
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 3,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle)
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 4,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle),
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 5,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle),
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 6,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle)
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 7,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle),
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 8,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle),
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 9,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle)
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: widget.keyColor,
                  borderRadius: BorderRadius.circular(widget.keyRadius)),
              width: widget.keyWidth,
              height: widget.keyHeight,
            ),
            OnScreenKeyboardKey(
                keyPressCB: widget.keyEntryCB,
                num: 0,
                matButElevation: widget.matButElevation,
                keyWidth: widget.keyWidth,
                keyHeight: widget.keyHeight,
                keyRadius: widget.keyRadius,
                keySpacing: widget.keySpacing,
                keyColor: widget.keyColor,
                keyStyle: widget.keyStyle),
            Padding(
                padding: EdgeInsets.all(widget.keySpacing),
                child: GestureDetector(
                    onTap: () {
                      widget.backspace();
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(widget.keyRadius),
                        child: Material(
                            color: widget.keyColor,
                            elevation: widget.matButElevation,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: widget.keyColor,
                                    borderRadius: BorderRadius.circular(
                                        widget.keyRadius)),
                                width: widget.keyWidth,
                                height: widget.keyHeight,
                                child: Center(
                                    child: Icon(Icons.backspace_outlined,
                                        color: Colors.white,
                                        size: widget.keyHeight / 3)))))))
          ],
        ),
      ],
    );
  }
}

class OnScreenKeyboardKey extends StatelessWidget {
  const OnScreenKeyboardKey(
      {Key? key,
      required this.keyPressCB,
      required this.num,
      required this.matButElevation,
      required this.keyWidth,
      required this.keyHeight,
      required this.keyRadius,
      required this.keySpacing,
      required this.keyColor,
      required this.keyStyle})
      : super(key: key);

  final Function keyPressCB;
  final Color keyColor;
  final double keyWidth;
  final double keyHeight;
  final double keyRadius;
  final double keySpacing;
  final int num;
  final double matButElevation;
  final TextStyle keyStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(keySpacing),
        child: InkWell(
            onTap: () {
              keyPressCB(num);
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(keyRadius),
                child: Material(
                    color: keyColor,
                    elevation: matButElevation,
                    child: Container(
                        decoration: BoxDecoration(
                            color: keyColor,
                            borderRadius: BorderRadius.circular(keyRadius)),
                        width: keyWidth,
                        height: keyHeight,
                        child: Center(
                            child: Text(num.toString(), style: keyStyle)))))));
  }
}
