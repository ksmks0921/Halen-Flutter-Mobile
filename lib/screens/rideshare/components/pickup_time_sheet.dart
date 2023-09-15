import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/utils/datetime_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';

class PickupTimeSheet extends ConsumerWidget {
  const PickupTimeSheet({
    Key? key,
    required this.visible,
  }) : super(key: key);
  final bool visible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: visible,
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: const ScheduleActionModalContent(
                  submitText: "Accept",
                )),
          ],
        ),
      ),
    );
  }
}

List<String> pickerItems = [
  "Today, Jan 11 10 am - 11 am",
  "Tomorrow, Jan 12 10 am - 11 am",
  "Tomorrow, Jan 13 10 am - 11 am",
  // Add more items here as needed
];

class ScheduleActionModalContent extends ConsumerStatefulWidget {
  const ScheduleActionModalContent(
      {Key? key, this.submitText, this.setCallbackScheduleCB})
      : super(key: key);

  final Function? setCallbackScheduleCB;
  final String? submitText;

  @override
  ScheduleActionModalContentState createState() =>
      ScheduleActionModalContentState();
}

class ScheduleActionModalContentState
    extends ConsumerState<ScheduleActionModalContent> {
  DateTime now = DateTime.now();
  int daysExtent = 30;
  int hoursExtent = 12;
  int minutesExtent = 60;

  List<String> pickerItems0 = [
    "Today",
  ];

  List<String> pickerItems1 = [];

  List<String> pickerItems2 = [];
  List<String> pickerItems3 = [
    "AM",
    "PM",
    // Add more items here as needed
  ];

  @override
  void initState() {
    for (var dei = 1; dei < daysExtent; dei++) {
      pickerItems0.add(
          "${monthsShort[now.add(Duration(days: dei)).month - 1]} ${now.add(Duration(days: dei)).day.toString()}");
    }
    for (var hei = 0; hei < hoursExtent; hei++) {
      int hour12 = now.add(Duration(hours: hei)).hour;
      if (hour12 > 12) {
        hour12 = hour12 - 12;
      }
      if (hour12 == 0) {
        hour12 = 12;
      }
      pickerItems1.add(hour12.toString());
    }
    for (var mei = 0; mei < minutesExtent; mei++) {
      int minute0 = now.add(Duration(minutes: mei)).minute;
      String minute0Str = minute0.toString();
      if (minute0.toString().length == 1) {
        minute0Str = "0$minute0";
      }
      pickerItems2.add(minute0Str);
    }

    Future.delayed(Duration.zero, () {
      ref.read(rsChosenDayProv.notifier).state = pickerItems0[0];
      ref.read(rsChosenHourProv.notifier).state = pickerItems1[0];
      ref.read(rsChosenMinuteProv.notifier).state = pickerItems2[0];
      ref.read(rsChosenMDProv.notifier).state = pickerItems3[0];
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .225.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
          bottomLeft: Radius.zero, // Remove bottom border radius
          bottomRight: Radius.zero, // Remove bottom border radius
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 0, left: 8.w, right: 8.w, bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              Row(
                children: [
                  SizedBox(
                      height: 151.h,
                      width: .25.sw,
                      child: CupertinoPicker(
                          magnification: 1.1,
                          squeeze: .8,
                          diameterRatio: 3,
                          useMagnifier: true,
                          itemExtent: 28.h,
                          // backgroundColor: Colors.white,
                          selectionOverlay:
                              CupertinoPickerDefaultSelectionOverlay(
                            background: CupertinoColors.white.withOpacity(.01),
                            capEndEdge: false,
                            capStartEdge: false,
                          ),
                          // This sets the initial item.
                          scrollController: FixedExtentScrollController(),
                          // This is called when selected item is changed.
                          onSelectedItemChanged: (int selectedItem) {
                            ref.read(rsChosenDayProv.notifier).state =
                                pickerItems0[selectedItem];
                          },
                          children: List<Widget>.generate(pickerItems0.length,
                              (int index) {
                            return Center(
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(
                                      pickerItems0[index],
                                      style: TextStyle(
                                          fontSize: 17.h, color: Colors.black),
                                    )));
                          }))),
                  SizedBox(
                      height: 151.h,
                      width: .17.sw,
                      child: CupertinoPicker(
                          magnification: 1.1,
                          squeeze: .8,
                          diameterRatio: 3,
                          useMagnifier: true,
                          itemExtent: 28.h,
                          selectionOverlay:
                              CupertinoPickerDefaultSelectionOverlay(
                            background: CupertinoColors.white.withOpacity(.01),
                            capEndEdge: false,
                            capStartEdge: false,
                          ),
                          scrollController: FixedExtentScrollController(),
                          onSelectedItemChanged: (int selectedItem) {
                            ref.read(rsChosenHourProv.notifier).state =
                                pickerItems1[selectedItem];
                          },
                          children: List<Widget>.generate(pickerItems1.length,
                              (int index) {
                            return Center(
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(pickerItems1[index])));
                          }))),
                  SizedBox(
                      height: 151.h,
                      width: .17.sw,
                      child: CupertinoPicker(
                          magnification: 1.1,
                          squeeze: .8,
                          diameterRatio: 3,
                          useMagnifier: true,
                          itemExtent: 28.h,
                          selectionOverlay:
                              CupertinoPickerDefaultSelectionOverlay(
                            background: CupertinoColors.white.withOpacity(.01),
                            capEndEdge: false,
                            capStartEdge: false,
                          ),
                          scrollController: FixedExtentScrollController(),
                          // This is called when selected item is changed.
                          onSelectedItemChanged: (int selectedItem) {
                            ref.read(rsChosenMinuteProv.notifier).state =
                                pickerItems2[selectedItem];
                          },
                          children: List<Widget>.generate(pickerItems2.length,
                              (int index) {
                            return Center(
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(pickerItems2[index])));
                          }))),
                  SizedBox(
                      height: 151.h,
                      width: .15.sw,
                      child: CupertinoPicker(
                          magnification: 1.1,
                          squeeze: .8,
                          diameterRatio: 3,
                          useMagnifier: true,
                          itemExtent: 28.h,
                          selectionOverlay:
                              CupertinoPickerDefaultSelectionOverlay(
                            background: CupertinoColors.white.withOpacity(.01),
                            capEndEdge: false,
                            capStartEdge: false,
                          ),
                          scrollController: FixedExtentScrollController(),
                          // This is called when selected item is changed.
                          onSelectedItemChanged: (int selectedItem) {
                            ref.read(rsChosenMDProv.notifier).state =
                                pickerItems3[selectedItem];
                          },
                          children: List<Widget>.generate(pickerItems3.length,
                              (int index) {
                            return Center(
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Text(pickerItems3[index])));
                          }))),
                ],
              ),
              Positioned(
                  top: 61.h,
                  right: 14,
                  left: 14,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(width: 1.h, color: Colors.black45))),
                    height: 30.h,
                  )),
            ])

            // Expanded(
            //     child: CupertinoPicker(
            //         magnification: 1.2,
            //         squeeze: .9,
            //         useMagnifier: true,
            //         itemExtent: 24.h,
            //         // This sets the initial item.
            //         scrollController: FixedExtentScrollController(
            //           initialItem: selectedSchedule,
            //         ),
            //         // This is called when selected item is changed.
            //         onSelectedItemChanged: (int selectedItem) {
            //           setState(() {
            //             selectedSchedule = selectedItem;
            //           });
            //         },
            //         children:
            //             List<Widget>.generate(pickerItems.length, (int index) {
            //           return Center(
            //               child: Padding(
            //                   padding: EdgeInsets.symmetric(horizontal: 38.w),
            //                   child: Text(pickerItems[index])));
            //         }))),

            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //   Container(
            //             padding: EdgeInsets.symmetric(vertical: 12.w),
            //             decoration: const BoxDecoration(
            //               color: Colors.white,
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 GestureDetector(
            //                     onTap: () {
            //                       // widget.setCallbackScheduleCB();
            //                       Navigator.pop(context);
            //                       Navigator.pop(context);
            //                     },
            //                     child: Container(
            //                         decoration: BoxDecoration(
            //                           color: AppColors.primaryColor1,
            //                           borderRadius:
            //                           BorderRadius.circular(.03.sw),
            //                         ),
            //                         width: .51.sw,
            //                         height: .125.sw,
            //                         child: Center(
            //                             child: Text(
            //                               widget.submitText ?? "Submit",
            //                               style:
            //                               const TextStyle(color: Colors.white),
            //                             ))))
            //               ],
            //             ))
            // ])
          ],
        ),
      ),
    );
  }
}
