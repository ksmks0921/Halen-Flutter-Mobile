import 'dart:ui';

import 'package:flutter/material.dart';

///this class used for show the loading content
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key, this.widget, this.blurFilter})
      : super(key: key);

  /// this variable used for contain widget which you want show
  final Widget? widget;
  final ImageFilter? blurFilter;

  @override
  Widget build(BuildContext context) {
    ///BackdropFilter widget used for blur content in backGround while loading.
    return BackdropFilter(
      filter: blurFilter ??
          ImageFilter.blur(
            sigmaX: 2.0,
            sigmaY: 2.0,
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: widget ?? const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

///this class used for open dialog.
class LoadingState {
  ///while call this method you show loading state
  static void startLoading({
    required BuildContext context,
    Widget? widget,
    ImageFilter? blurFilter,
  }) {
    showDialog(
      context: context,
      builder: (context) => LoadingScreen(
        widget: widget,
        blurFilter: blurFilter,
      ),
    );
  }

  ///this method is used for stop loading dialog.
  static void stopLoading({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}
