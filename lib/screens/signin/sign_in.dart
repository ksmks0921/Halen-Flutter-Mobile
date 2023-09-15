import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halen_customer_app/routes/route_constants.dart';

import 'package:halen_customer_app/styles/app_colors.dart';

import 'package:halen_customer_app/utils/regex_validator.dart';
import 'package:halen_customer_app/widgets/verification_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  PhoneNumber? phoneNumber;

  late TapGestureRecognizer _tapGestureRecognizer;
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _isLoading = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = _onSignupClick;
  }

  void _onSignupClick() {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return const LoginPage();
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: const Key("sign-up_screen_scaffold"),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor1,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Form(
          // key: _formKey,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  key: const Key("sign_in_widget"),
                  "Sign in",
                  style: TextStyle(
                      fontSize: 28.h,
                      color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                      fontSize: 19.h,
                      fontFamily: 'Roboto',
                      color: AppColors.primaryColor1),
                ),
                IntlPhoneField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.h,
                  ),
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (data) {
                    if (data == null) return "Required Field";
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                    // Custom formatter for phone number format
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: '555-555-5555',
                  ),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    phoneNumber = phone;
                  },
                  onCountryChanged: (country) {},
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Container(
                            color: AppColors.lightBgColor, height: 2)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: AppColors.primaryColor1,
                            fontSize: 18.h,
                          ),
                        )),
                    Expanded(
                        child:
                            Container(color: AppColors.lightBgColor, height: 2))
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 19.h,
                      fontFamily: 'Roboto',
                      color: AppColors.primaryColor1),
                ),
                TextFormField(
                  validator: validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.h,
                  ),
                  controller: emailController,
                  decoration:
                      const InputDecoration(hintText: 'user.halen@gmail.com'),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
                SizedBox(height: 24.h),
                Text(
                  "We will send the verification code to the given  phone number",
                  style: TextStyle(fontSize: 16.h, color: Colors.black45),
                ),
                const Spacer(flex: 1),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const VerificationScreen(
                              mobile: "4444", routeName: homePageRoute);
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor1,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              "Get Code",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 19.h),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text.rich(
                    TextSpan(
                        text: "Already a customer? ",
                        style: TextStyle(color: Colors.black, fontSize: 17.h),
                        children: <InlineSpan>[
                          TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: 'Sign in',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18.h,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
