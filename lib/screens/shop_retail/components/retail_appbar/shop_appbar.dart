import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/components/appBar/poppable_title_cart_appbar.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_cart/retail_cart.dart';
import 'package:halen_customer_app/appstate/retail_cart_state.dart';

class ShopAppBar extends ConsumerWidget {
  const ShopAppBar({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int cic = ref.watch(cicProv);

    return PoppableTitleCartAppBar(
      title: name,
      cartOnTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const RetailCart();
          },
        ));
      },
      cartItemCount: cic,
    );
  }
}
