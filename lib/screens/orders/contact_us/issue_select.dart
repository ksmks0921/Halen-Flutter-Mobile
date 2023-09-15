import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'package:halen_customer_app/screens/orders/components/select_reason_lvi.dart';
import 'package:halen_customer_app/screens/orders/contact_us/contact_medium_bottom_sheet.dart';
import 'package:halen_customer_app/components/viewport_helpers/ensure_visible_focus.dart';

class ContactUsIssueSelect extends StatefulWidget {
  const ContactUsIssueSelect({Key? key}) : super(key: key);

  @override
  State<ContactUsIssueSelect> createState() => _ContactUsIssueSelectState();
}

class _ContactUsIssueSelectState extends State<ContactUsIssueSelect> {
  int? selectedIndex;

  late FocusNode reasonFocusNode;

  bool showSave = false;

  showSaveButton(bool show) {
    setState(() {
      showSave = show;
    });
  }

  chooseItemCB(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    reasonFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    reasonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.lightBgColor,
            resizeToAvoidBottomInset: true,
            body: Column(children: [
              const AccountAppBar(title: "Order Details"),
              Expanded(
                  child: ListView(children: [
                Material(
                    elevation: 12,
                    child: Container(
                        padding: EdgeInsets.all(24.w),
                        child: Text(
                          "Please tell us the reason",
                          style: TextStyle(
                              color: AppColors.primaryColor1, fontSize: 28.w),
                        ))),
                CancelledReasonLVI(
                    label: "Delivery is delayed",
                    index: 0,
                    selectedIndex: selectedIndex,
                    chooseItemCB: chooseItemCB),
                CancelledReasonLVI(
                    label: "Placed the order by mistake",
                    index: 1,
                    selectedIndex: selectedIndex,
                    chooseItemCB: chooseItemCB),
                CancelledReasonLVI(
                    label: "Ordered the wrong size",
                    index: 2,
                    selectedIndex: selectedIndex,
                    chooseItemCB: chooseItemCB),
                CancelledReasonLVI(
                    label: "Don't need it anymore",
                    index: 3,
                    selectedIndex: selectedIndex,
                    chooseItemCB: chooseItemCB),
                CancelledReasonLVI(
                    label: "Other Issue",
                    index: 4,
                    selectedIndex: selectedIndex,
                    chooseItemCB: chooseItemCB),
                selectedIndex == 4
                    ? EnsureVisibleWhenFocused(
                        focusNode: reasonFocusNode,
                        child: Padding(
                            padding: EdgeInsets.all(24.w),
                            child: Column(children: [
                              Container(
                                  color: Colors.white,
                                  child: TextField(
                                    onTap: () {
                                      showSaveButton(true);
                                    },
                                    style: const TextStyle(color: Colors.black),
                                    minLines: 4,
                                    maxLines: 12,
                                    decoration: const InputDecoration(
                                      hintText: "Please let us know the reason",
                                    ),
                                  )),
                            ])))
                    : Container(),
              ])),
              showSave
                  ? Column(children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  showSaveButton(false);
                                },
                                child: Container(
                                    color: AppColors.primaryColor1,
                                    width: .33.sw,
                                    height: .12.sw,
                                    child: Center(
                                        child: Text(
                                      "Save",
                                      style: TextStyle(
                                          fontSize: .055.sw,
                                          color: Colors.white),
                                    ))))
                          ])
                    ])
                  : Container(),
              !showSave
                  ? Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      SizedBox(
                        height: 64.h,
                      ),
                      Row(children: [
                        Flexible(
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 24.w),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          if (selectedIndex != null) {
                                            showModalBottomSheetFloatClose(
                                                context,
                                                const ContactMediumModalContent());
                                          }
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: selectedIndex != null
                                                  ? AppColors.primaryColor1
                                                  : AppColors.grey700,
                                              borderRadius:
                                                  BorderRadius.circular(.03.sw),
                                            ),
                                            width: .88.sw,
                                            height: .125.sw,
                                            child: const Center(
                                                child: Text(
                                              "Continue",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))))
                                  ],
                                )))
                      ])
                    ])
                  : Container()
            ])));
  }
}
