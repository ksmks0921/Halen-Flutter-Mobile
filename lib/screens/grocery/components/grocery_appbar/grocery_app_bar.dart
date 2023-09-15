import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_cart/grocery_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/grocery_cart_state.dart';
import 'package:halen_customer_app/components/appBar/poppable_title_cart_appbar.dart';

class GroceryAppBar extends ConsumerWidget {
  const GroceryAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // cart items count
    int cic = ref.watch(cicProv);

    return PoppableTitleCartAppBar(
      title: title,
      cartOnTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const GroceryCart();
          },
        ));
      },
      cartItemCount: cic,
    );
  }
}
