import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/constants.dart';

class NextButton1 extends StatelessWidget {
  const NextButton1(
      {required this.title,
      required this.callback,
      this.height = 49,
      this.width = 333,
      Key? key})
      : super(key: key);

  final String title;
  final VoidCallback callback;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tight(Size(width.w, height)),
        decoration: BoxDecoration(
            color: AppColors.peachButton,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            title,
            style: Constants.style16White,
          ),
        ),
      ),
    );
  }
}

class NextButton2 extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final double height, width;

  const NextButton2(
      {required this.title,
      required this.callback,
      this.height = 49,
      this.width = 300,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tight(Size(width.w, height)),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.peachButton),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.peachButton,
                  fontFamily: 'DMSans',
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final double height, width;

  const GoogleSignInButton(
      {required this.title,
      required this.callback,
      this.height = 49,
      this.width = 300,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
          //constraints: BoxConstraints.tight(Size(height)),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.peachButton),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.peachButton,
                      fontFamily: 'DMSans',
                      fontSize: 16),
                ),
                const Image(
                  image: AssetImage('assets/images/google_logo.png'),
                  height: 35,
                )
              ],
            ),
          )),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const ButtonContainer(
      {required this.child,
      this.padding = const EdgeInsets.fromLTRB(21, 18, 21, 10),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        width: double.infinity,
        padding: padding,
        child: child,
      ),
    );
  }
}

class AppleButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final double height, width;

  const AppleButton(
      {required this.title,
      required this.callback,
      this.height = 49,
      this.width = 333,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tight(Size(width.w, height)),
        decoration: BoxDecoration(
            color: AppColors.blackButton,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontFamily: 'DMSans', fontSize: 16),
          ),
        ),
      ),
    );
  }
}
