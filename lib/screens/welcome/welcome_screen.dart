import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/strings.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/welcome/components/device_type_modal_content.dart';
import 'package:universal_io/io.dart' as uio;
import 'package:halen_customer_app/configuration/flags/feature_flags.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  showUseMobileDeviceMessage(BuildContext context) {
    if (disableDesktopDevice) {
      // have to use universal io because it has helpers that work on web. dart:io Platform crashes on web
      if (uio.Platform.operatingSystem == "linux" ||
          uio.Platform.operatingSystem == "macos" ||
          uio.Platform.operatingSystem == "windows") {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return deviceTypeModalContent(context);
              });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    showUseMobileDeviceMessage(context);

    return SafeArea(
        child: Scaffold(
            key: const Key("welcome_scaffold_key"),
            body: ListView(children: [
              SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: Stack(children: [
                    Positioned(
                        top: 0,
                        child: SizedBox(
                            height: .9.sh,
                            child: Center(
                                child: Image.asset(
                              'assets/images/illustrations/welcome_halen_fontlg_nobeach.png',
                              // height: .78.sh,
                              width: 1.sw,
                              fit: BoxFit.fitWidth,
                            )))),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRect(
                            child:
                                // BackdropFilter(
                                //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                //     child:
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.05)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 24.h),
                                          // Text(
                                          //   'Already have an account?',
                                          //   style: TextStyle(
                                          //     color: AppColors.primaryColor1,
                                          //     fontSize: 18.h,
                                          //   ),
                                          // ),

                                          Semantics(
                                              key: const Key("login_btn_key"),
                                              child:
                                                  WelcomeScreenOutlineLoginButton(
                                                onPressed: () {
                                                  debugPrint(
                                                      'login btn tapped');
                                                  if (skipSignInScreenOnLoginButtonPress) {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            homePageRoute);
                                                  } else {
                                                    Navigator.of(context)
                                                        .pushNamed(signInRoute);
                                                  }
                                                },
                                                childText: Strings.login,
                                              )),
                                          SizedBox(height: 24.h),
                                          FFlagged(
                                              flag:
                                                  showWelcomeScreenSignUpButton,
                                              child:
                                                  WelcomeScreenOutlineLoginButton(
                                                key: const Key("signup_button"),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, signUpRoute);
                                                },
                                                childText:
                                                    Strings.signUplowerCase,
                                              )),
                                          // const Text(
                                          //   'Halen Customer  App Demo**',
                                          //   style: TextStyle(
                                          //       color: Colors.black,
                                          //       fontSize: 11,
                                          //       fontStyle: FontStyle.italic,
                                          //       fontWeight: FontWeight.w500),
                                          // ),

                                          SizedBox(height: 55.h)
                                        ]))
                            // )
                            ))
                  ])),
            ])));
  }
}

class WelcomeScreenOutlineLoginButton extends StatelessWidget {
  const WelcomeScreenOutlineLoginButton(
      {super.key, required this.onPressed, required this.childText});

  final Function onPressed;
  final String childText;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 88.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(34.h),
                  border:
                      Border.all(width: 2.h, color: AppColors.primaryColor1)),
              child: Center(
                child: Text(childText,
                    style: TextStyle(
                      color: AppColors.primaryColor1,
                      fontWeight: FontWeight.w600,
                      fontSize: 19.h,
                    )),
              )))
    ]);
  }
}
