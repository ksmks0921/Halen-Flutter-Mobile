import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/orders/components/action_splash.dart';
import 'package:halen_customer_app/screens/orders/components/select_reason_lvi.dart';
import 'package:halen_customer_app/screens/orders/components/schedule_action_bottom_sheet.dart';
import 'package:halen_customer_app/screens/orders/return_cancel_sheets/return_cancel_reason_bottom_sheet.dart';

class ReturnShopBottomSheet extends StatefulWidget {
  const ReturnShopBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReturnShopBottomSheet> createState() => _ReturnShopBottomSheetState();
}

class _ReturnShopBottomSheetState extends State<ReturnShopBottomSheet> {
  bool showChooseIssue = true;
  bool showPickupLocationTime = false;
  bool showSchedulePickupTime = false;

  reasonContinueCB() {
    setState(() {
      showChooseIssue = false;
      showPickupLocationTime = true;
    });
  }

  pltContinueCB(int pickupTimeType) {
    if (pickupTimeType == 0) {
      cancelConfirmSubmit();
    }
    if (pickupTimeType == 1) {
      setState(() {
        showChooseIssue = false;
        showPickupLocationTime = false;
        showSchedulePickupTime = true;
      });
    }
  }

  cancelConfirmSubmit() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.pop(context);
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ActionWaitingSplash(
                  message: "Verifying Pickup Details...",
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container();
    if (showChooseIssue) {
      content = ReturnCancelReasonBottomSheetContent(
        reasonContinueCB: cancelConfirmSubmit,
      );
    }
    if (showPickupLocationTime) {
      content =
          ReturnPickupLocationTimeSheetContent(pltContinueCB: pltContinueCB);
    }
    if (showSchedulePickupTime) {
      // content = ScheduleReturnModalContent(
      //   setDeliveryScheduleCB: cancelConfirmSubmit,
      // );
      content = ScheduleActionModalContent(
        titleText: "Schedule Pick up",
        submitText: "Submit",
        setCallbackScheduleCB: cancelConfirmSubmit,
      );
    }

    return content;
  }
}

class ReturnPickupLocationTimeSheetContent extends StatefulWidget {
  const ReturnPickupLocationTimeSheetContent(
      {Key? key, required this.pltContinueCB})
      : super(key: key);

  final Function pltContinueCB;
  @override
  State<ReturnPickupLocationTimeSheetContent> createState() =>
      _ReturnPickupLocationTimeSheetContentState();
}

class _ReturnPickupLocationTimeSheetContentState
    extends State<ReturnPickupLocationTimeSheetContent> {
  int? selectedIndex;

  chooseItemCB(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: .67.sh,
        color: Colors.white,
        child: ListView(
          children: [
            Material(
                elevation: 12,
                child: Container(
                    padding: EdgeInsets.all(24.w),
                    child: Text(
                      "Pick up and Time",
                      style: TextStyle(
                          color: AppColors.primaryColor1, fontSize: 22.w),
                    ))),
            SizedBox(
              height: 32.w,
            ),
            Row(children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 42.w,
                    color: AppColors.primaryColor1,
                  )),
              SizedBox(
                  width: .7.sw,
                  child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Expanded(
                            child: Text(
                          "116 Valley Greensboro Dr.",
                          style: TextStyle(
                              fontSize: 24.w, color: AppColors.primaryColor1),
                        )),
                        Flexible(
                            child: Text(
                          "Reston, VA 29091",
                          style: w400_19Avenir(),
                        ))
                      ])),
              Expanded(
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: GestureDetector(
                        onTap: () {
                          // TODO push address edit page
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 24.w,
                        ))),
              ]))
            ]),
            SizedBox(
              height: 32.w,
            ),
            Row(children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Icon(
                    Icons.access_time,
                    size: 42.w,
                    color: AppColors.primaryColor1,
                  )),
              Text(
                "Choose Pickup Time",
                style:
                    TextStyle(fontSize: 24.w, color: AppColors.primaryColor1),
              ),
            ]),
            SizedBox(
              height: 32.w,
            ),
            CancelledReasonLVI(
                label: "ASAP (1-2 Days)",
                index: 0,
                selectedIndex: selectedIndex,
                chooseItemCB: chooseItemCB),
            CancelledReasonLVI(
                label: "Schedule",
                index: 1,
                selectedIndex: selectedIndex,
                chooseItemCB: chooseItemCB),
            SizedBox(
              height: 32.w,
            ),
            selectedIndex != null
                ? SizedBox(
                    height: .2.sh,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          widget.pltContinueCB(selectedIndex);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.all(24.w),
                                            child: Container(
                                                height: 64.h,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.primaryColor1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            .02.sw)),
                                                child: Center(
                                                    child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24.w),
                                                ))))))
                              ])
                        ]))
                : Container()
          ],
        ));
  }
}
