import 'package:flutter/material.dart';

class AspectVendorFeatureFullScreen extends StatelessWidget {
  const AspectVendorFeatureFullScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 2.15, child: child);
  }
}
