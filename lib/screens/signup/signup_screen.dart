import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/utils/regex_validator.dart';
import 'package:halen_customer_app/widgets/verification_widget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  final bool _isLoading = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = _onSignupClick;
  }

  void _onSignupClick() {}

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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  key: const Key("signup_text"),
                  "Enter Contact Details",
                  style: TextStyle(
                      fontSize: 28.h,
                      color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 35),
                Text("Mobile",
                    style: TextStyle(
                        fontSize: 19.h, color: AppColors.primaryColor1)),
                IntlPhoneField(
                  focusNode: focusNode,
                  style: TextStyle(color: Colors.black, fontSize: 16.h),
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (data) {
                    if (data == null) return "Required Field";
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: '555-555-5555'),
                  initialCountryCode: 'US',
                  onChanged: (phone) {},
                  onCountryChanged: (country) {},
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text("Email",
                    style: TextStyle(
                        fontSize: 19.h, color: AppColors.primaryColor1)),
                TextFormField(
                  onChanged: (value) {
                    //_email = value;
                  },
                  style: TextStyle(color: Colors.black, fontSize: 16.h),
                  validator: validateEmail,
                  autovalidateMode: AutovalidateMode.always,
                  decoration:
                      const InputDecoration(hintText: "user.halen@gmail.com"),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 12.h),
                Text(
                  "We will send the verification code on the given  phone number",
                  style: TextStyle(fontSize: 18.h, color: Colors.black54),
                ),
                SizedBox(height: 15.h),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const VerificationScreen(
                            mobile: "4444",
                            isSignup: false,
                            routeName: registerStep1Route,
                          );
                        },
                      ),
                    );
                    // registerAccount(_email);
                    // if (_formKey.currentState!.validate()) {
                    //   signUpCustomFlow(_email, phoneNumber!.completeNumber);
                    // }
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
                              "Send",
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
                        style: TextStyle(
                          fontSize: 18.h,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: 'Sign in',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 19.h,
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
