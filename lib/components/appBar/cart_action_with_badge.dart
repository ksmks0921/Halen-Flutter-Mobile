import 'package:flutter/material.dart';
import 'package:halen_customer_app/routes/route_constants.dart';

class CartActionWithBadge extends StatelessWidget {
  const CartActionWithBadge(
      {super.key,
      required this.cartIconHeight,
      required this.actionHorizontalPadding,
      required this.cartItemCount,
      required this.actionBottomPadding,
      this.cartOnTap});

  final double cartIconHeight;
  final double actionHorizontalPadding;
  final int cartItemCount;
  final Function? cartOnTap;
  final double actionBottomPadding;

  @override
  Widget build(BuildContext context) {
    String cicStr = "";

    if (cartItemCount > 9) {
      cicStr = "9+";
    } else {
      cicStr = cartItemCount.toString();
    }

    double cartBadgeFontSize = cartIconHeight / 2;
    if (cartItemCount > 9) {
      cartBadgeFontSize = cartIconHeight / 2.25;
    }

    double cartBadgePadding = cartIconHeight / 5.8;
    if (cartItemCount > 9) {
      cartBadgePadding = cartIconHeight / 8.8;
    }
    return Padding(
        padding: EdgeInsets.only(bottom: actionBottomPadding),
        // padding: EdgeInsets.only(bottom: 0),
        child: InkWell(
          onTap: () {
            cartOnTap != null
                ? cartOnTap!()
                : Navigator.of(context).pushNamed(retailCartRoute);
          },
          child: SizedBox(
            height: double.infinity,
            width:
                cartIconHeight + actionHorizontalPadding + (cartIconHeight / 2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: cartIconHeight + (cartIconHeight / 3),
                      height: cartIconHeight + (cartIconHeight / 3),
                      child: Stack(children: [
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                                width: cartIconHeight,
                                height: cartIconHeight,
                                child: Image.asset(
                                  'assets/images/icons/shopping-cart.png',
                                  width: cartIconHeight,
                                  height: cartIconHeight,
                                  fit: BoxFit.fitWidth,
                                ))),
                        cartItemCount > 0
                            ? Positioned(
                                bottom: cartItemCount < 10
                                    ? cartIconHeight -
                                        ((2 * cartIconHeight) / 3)
                                    : cartIconHeight - ((cartIconHeight) / 2),
                                right: 0,
                                child: Container(
                                    padding: cartItemCount < 10
                                        ? EdgeInsets.all(cartBadgePadding)
                                        : EdgeInsets.fromLTRB(
                                            1.2 * cartBadgePadding,
                                            cartBadgePadding,
                                            cartBadgePadding,
                                            cartBadgePadding),
                                    decoration: const BoxDecoration(
                                        // borderRadius: BorderRadius.circular(cartBadgeFontSize + (2* cartBadgePadding)),
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Center(
                                        child: Text(
                                      cicStr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: cartBadgeFontSize,
                                          fontWeight: FontWeight.w500),
                                    ))))
                            : Container(),
                        //     Image.asset(
                        //   'assets/images/icons/shopping-cart.png',
                        //   width: cartIconHeight,
                        //   height: cartIconHeight,
                        // )),
                      ])),
                ]),
          ),
        ));
  }
}
