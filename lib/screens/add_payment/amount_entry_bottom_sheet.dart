import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/numkey_pad.dart';
import 'package:halen_customer_app/styles/app_colors.dart';

class AddFundsBottomSheetContent extends StatefulWidget {
  const AddFundsBottomSheetContent({Key? key, required this.addCustomFundsCB})
      : super(key: key);

  final Function addCustomFundsCB;
  @override
  State<AddFundsBottomSheetContent> createState() =>
      _AddFundsBottomSheetContentState();
}

class _AddFundsBottomSheetContentState
    extends State<AddFundsBottomSheetContent> {
  addCustomFundsSubmitCB() {
    widget.addCustomFundsCB(displayNum);
  }

  int displayNum = 0;

  keyEntryCB(int val) {
    if (displayNum.toString().length == 5) {
      displayNum = displayNum;
    } else {
      setState(() {
        displayNum = int.parse(displayNum.toString() + val.toString());
      });
    }
  }

  backspaceCB() {
    if (displayNum.toString().isNotEmpty) {
      setState(() {
        displayNum = int.parse(displayNum
            .toString()
            .substring(0, displayNum.toString().length - 1));
      });
    }
    if (displayNum.toString().length == 1) {
      setState(() {
        displayNum = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: .67.sh,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(children: [
          Material(
              elevation: 8,
              child: SizedBox(
                  height: 88.h,
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.all(20.h),
                        child: SizedBox(
                            // height: 88.h,
                            child: Text("Add custom funds",
                                style: TextStyle(
                                    fontSize: 18.h,
                                    color: AppColors.primaryColor2,
                                    fontWeight: FontWeight.w500))))
                  ]))),
          Padding(
              padding: EdgeInsets.all(.06.sw),
              child: Column(children: [
                SizedBox(
                    height: 88.h,
                    child: Row(children: [
                      SizedBox(
                          height: 88.h,
                          child: Text("\$ ${displayNum.toString()} .00",
                              style: const TextStyle(
                                  fontSize: 56, color: Colors.black)))
                    ])),
                OnScreenNumericKeypad(
                    keyEntryCB: keyEntryCB,
                    backspace: backspaceCB,
                    matButElevation: 100,
                    keyWidth: .33.sw - (.12.sw / 3) - 8.w,
                    keyHeight: 56.w,
                    keyRadius: 12.w,
                    keySpacing: 4.w,
                    keyColor: Colors.blueGrey[200]!,
                    keyStyle: TextStyle(color: Colors.white, fontSize: 22.h)),
                Padding(
                    padding: EdgeInsets.all(
                      .06.sw,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                addCustomFundsSubmitCB();
                              },
                              child: Container(
                                width: .7.sw,
                                height: 60.h,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius:
                                        BorderRadius.circular(.01.sw)),
                                child: const Center(
                                    child: Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ))
                        ])),
              ]))
        ]));
  }
}
