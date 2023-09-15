import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';

class Constants {
  ///FireStore CollectionName
  String users = 'users';
  String card = 'card';
  static String categoryShop = "shop";
  static String categoryGrocery = "grocery";
  static String categoryHome = "home";
  static TextStyle header =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle subText1 = TextStyle(
      fontSize: 18, fontFamily: 'DMSans', color: Colors.grey.shade700);
  static TextStyle subText2 = TextStyle(
      fontSize: 14, fontFamily: 'DMSans', color: Colors.grey.shade500);
  static TextStyle subText3 = TextStyle(
      fontSize: 13, fontFamily: 'DMSans', color: Colors.grey.shade400);
  static TextStyle style24 = TextStyle(
      color: AppColors.blackButton, fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle style20Grey600 = TextStyle(
      color: AppColors.grey600, fontSize: 20, fontWeight: FontWeight.w300);
  static TextStyle style18Grey600 = TextStyle(
      color: AppColors.grey600, fontSize: 18, fontWeight: FontWeight.w300);
  static TextStyle style18Black = TextStyle(
    color: AppColors.blackButton,
    fontSize: 18,
  );
  static TextStyle style16Black = TextStyle(
    color: AppColors.blackButton,
    fontSize: 16,
  );
  static TextStyle style16Grey600 = TextStyle(
      color: AppColors.grey600, fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle style16Green = TextStyle(
      color: AppColors.greenColor, fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle style14Green = TextStyle(
      color: AppColors.greenColor, fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle style14Peach = TextStyle(
      color: AppColors.peachButton, fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle style13Grey500 = TextStyle(
      color: AppColors.grey500, fontSize: 13, fontWeight: FontWeight.w600);
  static TextStyle style16White = TextStyle(
      color: AppColors.whiteButton, fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle style16Grey300 = TextStyle(
      color: AppColors.grey500, fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle style15White = TextStyle(
      color: AppColors.whiteButton, fontSize: 15, fontWeight: FontWeight.bold);
  static TextStyle style16Peach = TextStyle(
      color: AppColors.peachButton, fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle style16PeachUnderLine = TextStyle(
      color: AppColors.peachButton,
      decoration: TextDecoration.underline,
      fontSize: 16,
      fontWeight: FontWeight.w300);
  static TextStyle style16 = const TextStyle(fontSize: 16);

  final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black87,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  // Elevated button style
  ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87, backgroundColor: Colors.grey[300],
    // minimumSize: Size(333, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  // Outline button style
  static ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.peachButton,
    minimumSize: const Size(333, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(
            color: AppColors.peachButton,
            width: 1,
          );
        } // Defer to the widget's default.
        return BorderSide(
          color: AppColors.peachButton,
          width: 1,
        );
      },
    ),
  );
}
