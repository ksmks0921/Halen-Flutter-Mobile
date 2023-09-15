// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:halen_customer_app/constants/strings.dart';
// import 'package:halen_customer_app/styles/app_colors.dart';
// import 'package:halen_customer_app/styles/font_style_globle.dart';
// import 'package:intl_phone_field/phone_number.dart';
// import 'package:pinput/pinput.dart';
// import '../homepage/homepage_screen.dart';
//
// class SignInOtp extends StatefulWidget {
//   const SignInOtp({super.key});
//
//   @override
//   State<SignInOtp> createState() => _SignInOtpState();
// }
//
// class _SignInOtpState extends State<SignInOtp> {
//   PhoneNumber? phoneNumber;
//
//   late TapGestureRecognizer _tapGestureRecognizer;
//   late TapGestureRecognizer _tapGestureSignupRecognizer;
//   TextEditingController phoneController = TextEditingController();
//   final bool _isLoading = false;
//   String? smsCode;
//
//   final sixPinTheme = PinTheme(
//       width: .125.sw,
//       height: .125.sw + .05.w,
//       padding: EdgeInsets.symmetric(horizontal: .01.sw),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(.015.sw),
//         border: Border.all(color: const Color(0xFF979797)),
//       ),
//       textStyle: TextStyle(
//           color: const Color.fromRGBO(30, 60, 87, 1),
//           fontSize: .07.sw,
//           fontWeight: FontWeight.w600));
//
//   late PinTheme sixFocusedPinTheme;
//   late PinTheme sixSubmittedPinTheme;
//   @override
//   void initState() {
//     super.initState();
//     _tapGestureRecognizer = TapGestureRecognizer();
//     _tapGestureSignupRecognizer = TapGestureRecognizer();
//     _tapGestureRecognizer.onTap = _onResendCalled;
//     _tapGestureSignupRecognizer.onTap = _onSignupCalled;
//
//     sixFocusedPinTheme = sixPinTheme.copyDecorationWith(
//       // border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//       border: Border.all(color: const Color(0xFF8C8A8A)),
//       borderRadius: BorderRadius.circular(10),
//     );
//
//     sixSubmittedPinTheme = sixPinTheme.copyWith(
//       decoration: sixPinTheme.decoration?.copyWith(
//         color: const Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );
//   }
//
//   void _onSignupCalled() {}
//
//   void _onResendCalled() async {}
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         // iconTheme: IconThemeData(
//         //   color: Colors.black, //change your color here
//         // ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: AppColors.primaryColor1,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.white,
//           padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
//           child: ListView(
//             children: [
//               Text(
//                 "Enter verification code",
//                 style: TextStyle(
//                     fontSize: 28.h,
//                     color: AppColors.primaryColor1,
//                     fontWeight: FontWeight.bold),
//               ),
//               Image.asset(
//                 "assets/images/illustrations/illustration_1.png",
//                 width: 306.w,
//                 height: 306.w,
//                 // ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Pinput(
//                 defaultPinTheme: sixPinTheme,
//                 focusedPinTheme: sixFocusedPinTheme,
//                 submittedPinTheme: sixSubmittedPinTheme,
//                 keyboardType: TextInputType.number,
//                 length: 6,
//                 validator: (s) {
//                   return null;
//                   // _pinController.text=s!;
//                   // return s == '222222' ? null : 'Pin is incorrect';
//                 },
//                 inputFormatters: [
//                   FilteringTextInputFormatter.deny(RegExp('[ ]')),
//                 ],
//                 pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                 showCursor: true,
//                 onCompleted: (pin) {
//                   // print(pin);
//                   setState(() {
//                     // smsCode = pin;
//                     // confirmUser(widget.mobile);
//                   });
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) {
//                       return const HomeScreen();
//                     }
//                         // builder: (_) => const ShimmerEffect(),
//                         ),
//                   );
//
//                   // if (smsCode?.length == 6) confirmUser(widget.mobile);
//                   //Navigator.of(context).pushNamed(registerStep1Route);
//                 },
//                 child: Container(
//                     padding: const EdgeInsets.all(12),
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         color: AppColors.primaryColor1,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Center(
//                       child: _isLoading
//                           ? const SizedBox(
//                               width: 20,
//                               height: 20,
//                               child: CircularProgressIndicator(),
//                             )
//                           : const Text(
//                               "Verify",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                     )),
//               ),
//               const SizedBox(height: 20),
//               Text.rich(
//                 TextSpan(
//                   style: TextStyle(
//                       fontSize: 18.h,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold),
//                   text: Strings.didntReceiveOtp,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text('Resend Code',
//                     style: TextStyle(
//                         fontSize: 19.h,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.primaryColor1)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
