library custom_line_indicator_bottom_navbar;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum IndicatorType { top, bottom }

class CustomLineIndicatorBottomNavbar extends StatelessWidget {
  final Color? backgroundColor;
  final List<CustomBottomBarItems> customBottomBarItems;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final double unselectedFontSize;
  final Color? splashColor;
  final int currentIndex;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final IndicatorType indicatorType;
  final Function(int) onTap;
  final double selectedFontSize;
  final double selectedImageSize;
  final double unselectedImageSize;
  final LinearGradient? gradient;

  const CustomLineIndicatorBottomNavbar({
    super.key,
    this.backgroundColor,
    this.selectedColor,
    required this.customBottomBarItems,
    this.unSelectedColor,
    this.unselectedFontSize = 11,
    this.selectedFontSize = 12,
    this.selectedImageSize = 20,
    this.unselectedImageSize = 15,
    this.splashColor,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 3,
    this.indicatorType = IndicatorType.top,
    this.gradient,
  });
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarThemeData bottomTheme =
        BottomNavigationBarTheme.of(context);

    List<Widget> navBarRowItems = [];

    for (int i = 0; i < customBottomBarItems.length; i++) {
      Widget iconOrImage = Container();

      if (customBottomBarItems[i].useIcon == true && currentIndex == i) {
        iconOrImage = customBottomBarItems[i].selectedIcon!;
      } else if (customBottomBarItems[i].useIcon == true && currentIndex != i) {
        iconOrImage = customBottomBarItems[i].unselectedIcon!;
      } else if (customBottomBarItems[i].useIcon == false) {
        iconOrImage = Image.asset(
          currentIndex == i
              ? customBottomBarItems[i].selectedImage!
              : customBottomBarItems[i].unselectedImage!,
          height: currentIndex == i ? selectedImageSize : unselectedImageSize,
        );
      }

      navBarRowItems.add(Expanded(
          child: SafeArea(
        child: Padding(
          padding: (i == 0)
              ? const EdgeInsets.only(left: 12)
              : (i == customBottomBarItems.length - 1)
                  ? const EdgeInsets.only(right: 12)
                  : const EdgeInsets.only(right: 7),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: splashColor ?? Theme.of(context).splashColor,
              onTap: () {
                onTap(i);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: enableLineIndicator
                      ? Border(
                          bottom: indicatorType == IndicatorType.bottom
                              ? BorderSide(
                                  color: currentIndex == i
                                      ? selectedColor ??
                                          bottomTheme.selectedItemColor!
                                      : Colors.transparent,
                                  width: lineIndicatorWidth,
                                )
                              : const BorderSide(color: Colors.transparent),
                          top: indicatorType == IndicatorType.top
                              ? BorderSide(
                                  color: currentIndex == i
                                      ? selectedColor ??
                                          bottomTheme.selectedItemColor!
                                      : Colors.transparent,
                                  width: lineIndicatorWidth,
                                )
                              : const BorderSide(color: Colors.transparent),
                        )
                      : null,
                ),
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: Column(
                  children: [
                    iconOrImage,
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      customBottomBarItems[i].label,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: currentIndex == i
                            ? selectedFontSize
                            : unselectedFontSize,
                        color: currentIndex == i
                            ? selectedColor ?? bottomTheme.unselectedItemColor
                            : unSelectedColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )));
    }

    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? bottomTheme.backgroundColor,
          gradient: gradient,
        ),
        child: SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: navBarRowItems)));
  }
}

class CustomBottomBarItems {
  final String? selectedImage;
  final String? unselectedImage;
  final Icon? selectedIcon;
  final Icon? unselectedIcon;
  final bool? useIcon;
  final String label;

  CustomBottomBarItems(
      {this.selectedImage,
      this.unselectedImage,
      required this.label,
      this.selectedIcon,
      this.unselectedIcon,
      this.useIcon});
}
