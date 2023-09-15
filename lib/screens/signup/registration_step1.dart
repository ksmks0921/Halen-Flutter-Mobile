import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/onboarding/onboarding_screen.dart';
import 'package:halen_customer_app/screens/signup/address_signup.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/widgets/birthday_picker_widget.dart';
import 'package:intl_phone_field/phone_number.dart';

class UserRegistrationStep1 extends StatefulWidget {
  const UserRegistrationStep1({
    Key? key,
  }) : super(key: key);

  @override
  State<UserRegistrationStep1> createState() => _UserRegistrationStep1State();
}

class _UserRegistrationStep1State extends State<UserRegistrationStep1> {
  final bool _isFetchingUser = false;
  bool _isUpdating = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  PhoneNumber? phoneNumber;

  TextEditingController phoneController = TextEditingController();

  String? email;
  String? phone;

  late DateTime selectedDate;
  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    //  getUserDetails();
  }

  Future<void> updateDetails(BuildContext context) async {
    setState(() {
      _isUpdating = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Route route =
              MaterialPageRoute(builder: (context) => const OnBoardingPage());
          Navigator.pushAndRemoveUntil(
            context,
            route,
            (route) => false,
          );
          return true;
        },
        child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor1,
                  ),
                  onPressed: () {
                    // Route route = MaterialPageRoute(
                    //     builder: (context) => const OnBoardingPage());
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   route,
                    //   (route) => false,
                    // );
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              body: SafeArea(
                  child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: _isFetchingUser
                    ? const Center(child: CircularProgressIndicator())
                    : Form(
                        // key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Create Your Account',
                                style: TextStyle(
                                    fontSize: 28.h,
                                    color: AppColors.primaryColor1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'First Name*',
                                style: TextStyle(
                                    fontSize: 19.h,
                                    color: AppColors.primaryColor1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z\s]')),
                                ],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.h),
                                onChanged: (value) {
                                  //  _firstName = value;
                                },
                                controller: firstNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter First Name';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'John',
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            // Text(
                            //   "Verification Code",
                            //   style: TextStyle(fontSize: 16, color: primaryColor),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'Last Name*',
                                style: TextStyle(
                                    fontSize: 19.h,
                                    color: AppColors.primaryColor1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z\s]')),
                                ],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.h),
                                onChanged: (value) {
                                  //    _lastName = value;
                                },
                                controller: lastNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Last Name';
                                  }
                                  return null;
                                },
                                decoration:
                                    const InputDecoration(hintText: 'Doe'),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'Birthday',
                                style: TextStyle(
                                    fontSize: 19.h,
                                    color: AppColors.primaryColor1),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: const BirthdayPickerWidget()),

                            // TextFormField(
                            //     style: const TextStyle(color: Colors.black),
                            //     onChanged: (value) {},
                            //     decoration:
                            //         const InputDecoration(hintText: 'MM/DD/YYYY'),
                            //     keyboardType: TextInputType.text,
                            //   ),
                            // ),

                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                'We kindly request customers to provide their birthdays for legal purposes to ensure compliance with age verification regulations and to maintain a secure and trustworthy environment for all users.',
                                style: TextStyle(
                                    fontSize: 17.h, color: Colors.grey[700]),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            InkWell(
                              onTap: () async {
                                _showConfirmationAlert(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(12.h),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor1,
                                      borderRadius:
                                          BorderRadius.circular(10.h)),
                                  child: _isUpdating
                                      ? const Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                            'Next',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 19.h),
                                          ),
                                        )),
                            )
                          ],
                        ),
                      ),
              ))),
        ));
  }

  //refactor and make this reuseable.
  _showConfirmationAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text(
          "Confirm your age",
          style: TextStyle(color: Colors.black, fontSize: 18.h),
        ),
        content: Text(
          "confirm that you are 18 years old?",
          style: TextStyle(color: Colors.black, fontSize: 18.h),
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("No", style: TextStyle(fontSize: 18.h)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          BasicDialogAction(
            title: Text("Yes", style: TextStyle(fontSize: 18.h)),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => const AddressRegistration()));
            },
          ),
        ],
      ),
    );
  }
}
