import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/orders/components/select_reason_lvi.dart';
import 'package:halen_customer_app/components/viewport_helpers/ensure_visible_focus.dart';

class ReturnCancelReasonBottomSheetContent extends StatefulWidget {
  const ReturnCancelReasonBottomSheetContent(
      {Key? key, required this.reasonContinueCB})
      : super(key: key);

  final Function reasonContinueCB;

  @override
  State<ReturnCancelReasonBottomSheetContent> createState() =>
      _ReturnCancelReasonBottomSheetContentState();
}

class _ReturnCancelReasonBottomSheetContentState
    extends State<ReturnCancelReasonBottomSheetContent> {
  int? selectedIndex;

  late FocusNode reasonFocusNode;

  double minVisibleEntryHeight = .3.sh;
  double visibleEntryHeight = .3.sh;
  double minSheetHeight = .67.sh;
  double maxSheetHeight = .88.sh;
  double sheetSize = .67.sh;
  double submitButtonSize = 64.w;
  double submitPaddingHeight = 24.w;
  double submitSeparatorSize = 6.w;

  late double vib;

  bool showSave = false;

  showSaveButton(bool show) {
    setState(() {
      showSave = show;
    });
  }

  adaptSheetHeightForVisible() {
    vib = MediaQuery.of(context).viewInsets.bottom;
    if (vib > 0) {
      if ((sheetSize + vib) < maxSheetHeight) {
        sheetSize = sheetSize + vib;
      } else {
        sheetSize = maxSheetHeight;
      }
      if (visibleEntryHeight < (vib + minVisibleEntryHeight)) {
        visibleEntryHeight = vib + minVisibleEntryHeight;
      }
    }
    if (vib == 0) {
      sheetSize = minSheetHeight;
      visibleEntryHeight = minVisibleEntryHeight;
    }
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
    vib = MediaQuery.of(context).viewInsets.bottom;
    adaptSheetHeightForVisible();

    return Container(
        height: sheetSize,
        color: Colors.white,
        child: Column(children: [
          Container(
              height: sheetSize -
                  submitButtonSize -
                  (2 * submitPaddingHeight) -
                  submitSeparatorSize,
              color: Colors.white,
              child: ListView(children: [
                Container(
                    padding: EdgeInsets.all(24.w),
                    child: Text(
                      "Please tell us the reason",
                      style: TextStyle(
                          color: AppColors.primaryColor1, fontSize: 28.w),
                    )),
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
                    label: "Other",
                    index: 4,
                    selectedIndex: selectedIndex,
                    chooseItemCB: chooseItemCB),
                selectedIndex != null
                    ? Column(
                        // mainAxisAlignment: vib > 0?
                        // MainAxisAlignment.start:MainAxisAlignment.end,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                            selectedIndex == 4
                                ? Padding(
                                    padding: EdgeInsets.only(top: 16.w),
                                    child: SizedBox(
                                        height: visibleEntryHeight,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                  color: Colors.white,
                                                  padding: EdgeInsets.all(24.w),
                                                  child:
                                                      EnsureVisibleWhenFocused(
                                                          focusNode:
                                                              reasonFocusNode,
                                                          child: TextField(
                                                            onTap: () {
                                                              showSaveButton(
                                                                  true);
                                                            },
                                                            focusNode:
                                                                reasonFocusNode,
                                                            minLines: 4,
                                                            maxLines: 12,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  "Please let us know the reason",
                                                            ),
                                                          ))),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              showSave
                                                  ? SizedBox(
                                                      height: .16.sw,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          FocusNode());
                                                                  showSaveButton(
                                                                      false);
                                                                },
                                                                child: Container(
                                                                    color: AppColors.primaryColor1,
                                                                    width: .33.sw,
                                                                    height: .14.sw,
                                                                    child: Center(
                                                                        child: Text(
                                                                      "Save",
                                                                      style: TextStyle(
                                                                          fontSize: .06
                                                                              .sw,
                                                                          color:
                                                                              Colors.white),
                                                                    ))))
                                                          ]))
                                                  : Container()
                                            ])))
                                : Container(),
                            SizedBox(
                              height: 64.h,
                            ),
                          ])
                    : Container(),
              ])),
          SizedBox(
            height: submitSeparatorSize,
          ),
          selectedIndex != null && vib == 0
              ? Material(
                  elevation: 8.w,
                  child: SizedBox(
                      height: submitButtonSize + (2 * submitPaddingHeight),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.all(
                                              submitPaddingHeight),
                                          child: GestureDetector(
                                              onTap: () {
                                                widget.reasonContinueCB();
                                              },
                                              child: Container(
                                                  height: submitButtonSize,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryColor1,
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
                          ])))
              : Container()
        ]));
  }
}
