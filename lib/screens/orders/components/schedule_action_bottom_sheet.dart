import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<String> pickerItems = [
  "Tomorrow, Jan 11 10 am - 11 am",
  "Tomorrow, Jan 12 10 am - 11 am",
  "Tomorrow, Jan 13 10 am - 11 am",
  // Add more items here as needed
];

class ScheduleActionModalContent extends StatefulWidget {
  const ScheduleActionModalContent(
      {Key? key, this.titleText, this.submitText, this.setCallbackScheduleCB})
      : super(key: key);

  final Function? setCallbackScheduleCB;
  final String? titleText;
  final String? submitText;

  @override
  State<ScheduleActionModalContent> createState() =>
      _ScheduleActionModalContentState();
}

class _ScheduleActionModalContentState
    extends State<ScheduleActionModalContent> {
  @override
  Widget build(BuildContext context) {
    int selectedSchedule = 0;
    return Container(
      height: .42.sh,
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
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.all(24.w),
                child: Center(
                  child: Text(
                    widget.titleText ?? "",
                    style: TextStyle(
                      color: AppColors.color20A39E,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.w,
                    ),
                  ),
                )),
            Expanded(
                child: CupertinoPicker(
                    magnification: 1.2,
                    squeeze: .9,
                    useMagnifier: true,
                    itemExtent: 24.h,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedSchedule,
                    ),
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        selectedSchedule = selectedItem;
                      });
                    },
                    children:
                        List<Widget>.generate(pickerItems.length, (int index) {
                      return Center(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38.w),
                              child: Text(pickerItems[index])));
                    }))),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                                  // widget.setCallbackScheduleCB();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor1,
                                      borderRadius:
                                          BorderRadius.circular(.03.sw),
                                    ),
                                    width: .88.sw,
                                    height: .125.sw,
                                    child: Center(
                                        child: Text(
                                      widget.submitText ?? "Submit",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ))))
                          ],
                        )))
              ])
            ])
          ],
        ),
      ),
    );
  }
}
