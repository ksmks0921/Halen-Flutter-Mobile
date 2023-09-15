// import 'package:flutter/material.dart';
// import 'package:halen_supper_app/main.dart';
import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';

class Utils {
  Utils._();

  /*static displayToastMessage(String? message) {
    Fluttertoast.showToast(msg: message!);
  }*/
  static showMessage(String? message) {
    // rootScaffoldMessengerKey.currentState!
    //     .showSnackBar(SnackBar(content: Text('$message')));
  }
}

class CartConfirmation {
  static void show(BuildContext context) {
    final snackBar = SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      content: const Center(
        child: Text(
          'Item added to cart',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
