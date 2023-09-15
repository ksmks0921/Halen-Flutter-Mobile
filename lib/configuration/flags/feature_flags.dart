import 'package:flutter/material.dart';

/// widgets
// prod:mvp false
bool showWelcomeScreenSignUpButton = false;
// prod:mvp true
bool showMoveForwardRideshare = true;

/// flow
// prod:mvp true
bool skipSignInScreenOnLoginButtonPress = true;

/// configuration
//prod:mvp false
bool enableDevicePreviewPackage = false;
//prod:mvp true
bool disableDesktopDevice = true;

class FFlagged extends StatelessWidget {
  const FFlagged({super.key, required this.child, required this.flag});

  final Widget child;
  final bool flag;

  @override
  Widget build(BuildContext context) {
    return flag ? child : Container();
  }
}
