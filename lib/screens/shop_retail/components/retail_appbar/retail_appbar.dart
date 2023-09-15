import 'package:flutter/material.dart';
import 'package:halen_customer_app/appstate/retail_cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_cart/retail_cart.dart';
import 'package:halen_customer_app/components/appBar/poppable_title_cart_appbar.dart';

class RetailAppBar extends ConsumerWidget {
  const RetailAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int cic = ref.watch(cicProv);

    cartOnTap() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return const RetailCart();
        },
      ));
    }

    return PoppableTitleCartAppBar(
      title: title,
      cartItemCount: cic,
      cartOnTap: cartOnTap,
    );
  }
}
