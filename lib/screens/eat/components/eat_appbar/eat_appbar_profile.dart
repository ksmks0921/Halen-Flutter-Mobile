import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/eat/components/eat_cart/eat_cart.dart';
import 'package:halen_customer_app/appstate/eat_cart_state.dart';
import 'package:halen_customer_app/components/appBar/profile_name_cart_appbar.dart';

class EatProfileAppBar extends ConsumerWidget {
  const EatProfileAppBar({
    super.key,
    required this.name,
    required this.location,
    required this.image,
  });

  final String name;
  final String location;
  final String image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // cart items count
    int cic = ref.watch(cicProv);

    return ProfileNameCartAppBar(
      image: image,
      name: name,
      // location: location,
      cartItemCount: cic,
      cartOnTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const EatCart();
          },
        ));
      },
    );
  }
}
