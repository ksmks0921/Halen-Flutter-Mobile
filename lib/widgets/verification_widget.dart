import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/strings.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationScreen extends StatefulWidget {
  final String mobile;
  final bool isSignup;
  final String routeName;

  const VerificationScreen(
      {Key? key,
      required this.mobile,
      this.isSignup = false,
      required this.routeName})
      : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  PhoneNumber? phoneNumber;

  TextEditingController phoneController = TextEditingController();

  final bool _isLoading = false;
  String? smsCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter verification code",
                style: TextStyle(
                    fontSize: 28.h,
                    color: AppColors.primaryColor1,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                "assets/images/illustrations/illustration_1.png",
                width: 306.w,
                height: 306.w,
                // ),
              ),
              const SizedBox(height: 20),
              //otp textfield goes here
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OTPTextField(
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldStyle: FieldStyle.box,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40.w,
                    style: TextStyle(fontSize: 19.h, color: Colors.black),
                    onChanged: (pin) {
                      // Handle OTP code changes
                      // You can auto-submit the OTP or perform any desired actions here
                      if (pin.length == 6) {
                        // Auto-submit OTP or trigger your validation logic
                      }
                    },
                    onCompleted: (pin) {},
                  )),

              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(widget.routeName);
                },
                child: Container(
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
                              "Confirm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.h,
                                  fontWeight: FontWeight.bold),
                            ),
                    )),
              ),
              SizedBox(height: 36.h),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                      fontSize: 18.h,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500),
                  text: Strings.didntReceiveOtp,
                ),
              ),
              // fix styling.
              SizedBox(height: 8.h),
              TextButton(
                  onPressed: () {
                    var snackBar = SnackBar(
                        duration: const Duration(seconds: 3),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(
                            bottom: 100.0, left: 10, right: 10),
                        content: Padding(
                          padding: EdgeInsets.all(12.h),
                          child: Text(
                              "We have sent a new OTP code to your mobile number",
                              style: TextStyle(
                                fontSize: 18.h,
                              )),
                        ),
                        dismissDirection: DismissDirection.down);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Resend Code',
                      style: TextStyle(
                          fontSize: 19.h,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor1))),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
