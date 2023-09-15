import 'package:flutter/material.dart';

class AppColors {
  const AppColors();
  static Color primaryColor1 = const Color(0xff20A39E);
  static Color primaryColor2 = const Color(0xff28B7B1);
  static Color primaryColor3 = const Color(0xff27BFB9);
  static Color primaryAccentColor = const Color(0xffCAE9E8);
  static Color primaryColor = const Color(0xff147470);

  static const Color lightBgColor = Color.fromRGBO(223, 224, 227, 1);
  static const Color white = Colors.white;
  static const Color defaultDarkModeBg = Colors.black;
  static Color greyShade900 = Colors.grey.shade900;
  static Color defaultIconColor = Colors.blue;
  static Color greyShade600 = Colors.grey.shade600;
  static const purpleColor = Color.fromRGBO(22, 23, 41, 1);
  static const purpleColorOffet = Color.fromRGBO(31, 31, 58, 1);

  static const TextStyle styleForAppName = TextStyle(
    fontSize: 25,
    color: Colors.white,
  );
  static const groceryFontFamily = 'Avenir';
  static const TextStyle textStyleheade1 =
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white);
  static Color greyColor = const Color(0xffF5F3F0);

  static const TextStyle textStyleheade1black = TextStyle(
      fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF3f414e));

  static const TextStyle getStyleForLabelWithClickText = TextStyle(
      color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.bold);
}
