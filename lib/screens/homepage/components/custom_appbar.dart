import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/components/appBar/profile_name_cart_appbar.dart';

// Shows avatar profile button leading, appbar with name and optional cart if cartOnTap is null
class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({
    super.key,
    this.leading,
    this.cartOnTap,
    this.cartItemCount,
    required this.name,
    // required this.location,
    required this.image,
  });

  final Widget? leading;
  final Function? cartOnTap;
  final int? cartItemCount;
  final String name;
  // final String location;
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileNameCartAppBar(
      image: image,
      name: name,
      // location: location,
    );
  }
}
