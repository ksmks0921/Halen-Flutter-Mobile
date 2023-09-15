import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/screens/onboarding/onboarding_screen.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/utils/regex_validator.dart';

class AddressRegistration extends StatefulWidget {
  const AddressRegistration({super.key});

  @override
  State<AddressRegistration> createState() => _AddressRegistrationState();
}

class _AddressRegistrationState extends State<AddressRegistration> {
  TextEditingController streetNameController = TextEditingController();
  TextEditingController stateNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();

  @override
  void dispose() {
    streetNameController.dispose();
    stateNameController.dispose();
    cityNameController.dispose();
    super.dispose();
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
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, onboardingRoute);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.grey[600]),
                      ))
                ],
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
                      padding: EdgeInsets.all(12.h),
                      child: Form(
                        // key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Provide address details',
                                style: TextStyle(
                                    fontSize: 28.h,
                                    color: AppColors.primaryColor1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(
                                'Street Address',
                                style: TextStyle(
                                    fontSize: 19.h,
                                    color: AppColors.primaryColor1),
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.h),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid street address';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: '123, ABC Lane',
                                ),
                              ),
                              SizedBox(height: 24.h),
                              // Text(
                              //   "Verification Code",
                              //   style: TextStyle(fontSize: 16, color: primaryColor),
                              // ),
                              Text(
                                'City',
                                style: TextStyle(
                                    fontSize: 19.h,
                                    color: AppColors.primaryColor1),
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.h),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z\s]')),
                                ],
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid city';
                                  }
                                  return null;
                                },
                                controller: cityNameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration:
                                    const InputDecoration(hintText: 'New York'),
                              ),

                              SizedBox(height: 24.h),
                              Text(
                                'State',
                                style: TextStyle(
                                    fontSize: 19.h,
                                    color: AppColors.primaryColor1),
                              ),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.h),
                                onChanged: (value) {},
                                controller: stateNameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validateState,
                                decoration: const InputDecoration(
                                  hintText: 'NY',
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z]{0,2}$')),
                                ],
                              ),

                              SizedBox(height: 24.h),
                              Text(
                                'Zip Code',
                                style: TextStyle(
                                    fontSize: 19.h,
                                    color: AppColors.primaryColor1),
                              ),
                              SizedBox(height: 12.h),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: validateZip,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.h),
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                  hintText: '11101',
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 5,
                              ),

                              SizedBox(height: 24.h),

                              const Spacer(
                                flex: 1,
                              ),
                              InkWell(
                                onTap: () async {
                                  Navigator.of(context)
                                      .pushNamed(onboardingRoute);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor1,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
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
                      )))),
        ));
  }
}
