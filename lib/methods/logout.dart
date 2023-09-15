import 'package:flutter/material.dart';

logOut(
  BuildContext context,
) {
  //TODO cache invalidation - reset state vars

  Navigator.of(context)
      .pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
}
