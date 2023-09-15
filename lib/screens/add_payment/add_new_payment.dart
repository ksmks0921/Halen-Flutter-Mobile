import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/add_payments_state.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';

class AddPaymentsPage extends ConsumerStatefulWidget {
  const AddPaymentsPage({Key? key}) : super(key: key);

  @override
  AddPaymentsPageState createState() => AddPaymentsPageState();
}

class AddPaymentsPageState extends ConsumerState<AddPaymentsPage> {
  bool payMethodSubmitted = false;
  bool pmVerify = false;
  bool submitButtonEnabled = true;

  late TextEditingController cardNumberController0;
  late TextEditingController cardNumberController1;
  late TextEditingController cardNumberController2;
  late TextEditingController cardNumberController3;
  late TextEditingController expiryController;

  late FocusNode numFocus0;
  late FocusNode numFocus1;
  late FocusNode numFocus2;
  late FocusNode numFocus3;
  late FocusNode expFocus;
  late FocusNode cvvFocus;
  late FocusNode zipFocus;

  addCardSubmit() async {
    setState(() {
      submitButtonEnabled = false;
      payMethodSubmitted = true;
    });

    ref.read(pmProv.notifier).addPM({
      "type": "visa",
      "icon": "assets/images/icons/visa@2x (2).png",
      "display_number": "**** **** **** ${cardNumberController3.text}"
    });

    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        pmVerify = true;
      });
    });

    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    cardNumberController0 = TextEditingController();
    cardNumberController1 = TextEditingController();
    cardNumberController2 = TextEditingController();
    cardNumberController3 = TextEditingController();
    expiryController = TextEditingController();
    numFocus0 = FocusNode();
    numFocus1 = FocusNode();
    numFocus2 = FocusNode();
    numFocus3 = FocusNode();
    expFocus = FocusNode();
    cvvFocus = FocusNode();
    zipFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    cardNumberController0.dispose();
    cardNumberController1.dispose();
    cardNumberController2.dispose();
    cardNumberController3.dispose();
    expiryController.dispose();
    numFocus0.dispose();
    numFocus1.dispose();
    numFocus2.dispose();
    numFocus3.dispose();
    expFocus.dispose();
    cvvFocus.dispose();
    zipFocus.dispose();
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Column(children: [
        const AccountAppBar(title: "Payment Methods"),
        // Padding(
        //     padding: EdgeInsets.all(16.w),
        //     child: Row(
        //       children: [
        //         GestureDetector(
        //             onTap: () {
        //               submitButtonEnabled ? Navigator.pop(context) : null;
        //             },
        //             child: const Icon(Icons.arrow_back_ios)),
        //         Padding(
        //           padding: EdgeInsets.only(left: 12.w),
        //           child: Text(
        //             "Add new payment",
        //             style: w400_20Avenir(),
        //           ),
        //         )
        //       ],
        //     )),
        Expanded(
            child: ListView(children: [
          Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      Text(
                        "Card number",
                        style: w600_18Avenir(),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: .15.sw,
                              child: TextField(
                                controller: cardNumberController0,
                                keyboardType: TextInputType.number,
                                focusNode: numFocus0,
                                maxLength: 4,
                                onChanged: (val) {
                                  if (val.length == 4) {
                                    FocusScope.of(context)
                                        .requestFocus(numFocus1);
                                  }
                                },
                                decoration:
                                    const InputDecoration(counterText: ""),
                                style: w400_14Avenir(),
                              )),
                          SizedBox(
                              width: .15.sw,
                              child: TextField(
                                controller: cardNumberController1,
                                keyboardType: TextInputType.number,
                                focusNode: numFocus1,
                                maxLength: 4,
                                onChanged: (val) {
                                  if (val.length == 4) {
                                    FocusScope.of(context)
                                        .requestFocus(numFocus2);
                                  }
                                },
                                decoration:
                                    const InputDecoration(counterText: ""),
                                style: w400_14Avenir(),
                              )),
                          SizedBox(
                              width: .15.sw,
                              child: TextField(
                                controller: cardNumberController2,
                                keyboardType: TextInputType.number,
                                focusNode: numFocus2,
                                maxLength: 4,
                                onChanged: (val) {
                                  if (val.length == 4) {
                                    FocusScope.of(context)
                                        .requestFocus(numFocus3);
                                  }
                                },
                                decoration:
                                    const InputDecoration(counterText: ""),
                                style: w400_14Avenir(),
                              )),
                          SizedBox(
                              width: .15.sw,
                              child: TextField(
                                controller: cardNumberController3,
                                keyboardType: TextInputType.number,
                                focusNode: numFocus3,
                                maxLength: 4,
                                onChanged: (val) {
                                  if (val.length == 4) {
                                    FocusScope.of(context)
                                        .requestFocus(expFocus);
                                  }
                                },
                                decoration:
                                    const InputDecoration(counterText: ""),
                                style: w400_14Avenir(),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Row(
                      children: [
                        SizedBox(
                            width: .38.sw,
                            child: Column(
                              children: [
                                Text(
                                  "Expiry date",
                                  style: w600_18Avenir(),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                    width: .33.sw,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: expiryController,
                                      focusNode: expFocus,
                                      maxLength: 5,
                                      onChanged: (val) {
                                        if (val.length == 2) {
                                          setState(() {
                                            expiryController.text = "$val/";
                                          });
                                        }
                                        if (val.length == 5) {
                                          FocusScope.of(context)
                                              .requestFocus(cvvFocus);
                                        }
                                      },
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      style: w400_14Avenir(),
                                    ))
                              ],
                            )),
                        SizedBox(
                            width: .5.sw,
                            child: Column(
                              children: [
                                Text(
                                  "CVV code",
                                  style: w600_18Avenir(),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                    width: .33.sw,
                                    child: TextField(
                                      maxLength: 3,
                                      focusNode: cvvFocus,
                                      keyboardType: TextInputType.number,
                                      onChanged: (val) {
                                        if (val.length == 3) {
                                          FocusScope.of(context)
                                              .requestFocus(zipFocus);
                                        }
                                      },
                                      decoration: const InputDecoration(
                                          counterText: ""),
                                      style: w400_14Avenir(),
                                    ))
                              ],
                            )),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Row(children: [
                      SizedBox(
                          width: .38.sw,
                          child: Column(
                            children: [
                              Text(
                                "Zip Code",
                                style: w600_18Avenir(),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              SizedBox(
                                  width: .33.sw,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    maxLength: 5,
                                    focusNode: zipFocus,
                                    onChanged: (val) {
                                      if (val.length == 5) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      }
                                    },
                                    decoration:
                                        const InputDecoration(counterText: ""),
                                    style: w400_14Avenir(),
                                  ))
                            ],
                          )),
                      Container(
                        width: .5.sw,
                      )
                    ])),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                if (submitButtonEnabled) {
                                  addCardSubmit();
                                }
                              },
                              child: Container(
                                width: .7.sw,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius:
                                        BorderRadius.circular(.01.sw)),
                                child: Center(
                                    child: pmVerify
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : Text(
                                            submitButtonEnabled
                                                ? "Add Card"
                                                : "...",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )),
                              ))
                        ]))
              ]))
        ]))
      ]),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
              color: AppColors.primaryColor,
              width: 1.sw,
              height: payMethodSubmitted ? 80.h : 0,
              duration: const Duration(milliseconds: 400),
              child: Center(
                  child: pmVerify
                      ? const Text(
                          "Payment Added Successfully",
                          style: TextStyle(color: Colors.white),
                        )
                      : const CircularProgressIndicator()))
        ],
      )
    ])));
  }
}
