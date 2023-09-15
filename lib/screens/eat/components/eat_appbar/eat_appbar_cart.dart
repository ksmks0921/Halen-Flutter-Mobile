import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/components/appBar/poppable_title_cart_appbar.dart';
import 'package:halen_customer_app/appstate/eat_cart_state.dart';
import 'package:halen_customer_app/screens/eat/components/eat_cart/eat_cart.dart';

class EatCartAppBar extends ConsumerWidget {
  const EatCartAppBar(
      {super.key, required this.title, required this.showCartAction});

  final String title;
  final bool showCartAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // cart items count
    int cic = ref.watch(cicProv);

    // hides shopping cart if null
    Function? cartOnTap;
    if (showCartAction) {
      cartOnTap = () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const EatCart();
          },
        ));
      };
    }
    return PoppableTitleCartAppBar(
      title: title,
      cartItemCount: cic,
      cartOnTap: cartOnTap,
    );
  }
}
