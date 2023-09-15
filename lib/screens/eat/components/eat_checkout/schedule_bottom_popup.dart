import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double _kItemExtent = 30.0;

class ScheduleBottomPopUP extends StatefulWidget {
  const ScheduleBottomPopUP(
      {super.key,
      required this.onCloseBottomPopUp,
      required this.pickerItems,
      required this.onItemSelected});
  final VoidCallback onCloseBottomPopUp;
  final Function(String) onItemSelected;
  final List<String> pickerItems;
  void handleItemSelection(String selectedItem) {
    onItemSelected(selectedItem);
  }

  @override
  State<ScheduleBottomPopUP> createState() => _ScheduleBottomPopUPState();
}

class _ScheduleBottomPopUPState extends State<ScheduleBottomPopUP> {
  @override
  Widget build(BuildContext context) {
    int selectedSchedule = 0;
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.7),
            width: double.infinity,
            height: double.infinity,
            // Add your widget content here
          ),
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width - 2) / 2 - 20,
          bottom: 380.sp,
          child: GestureDetector(
            onTap: widget.onCloseBottomPopUp,
            child: Container(
              width: 40.sp,
              height: 40.sp,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          height: 345.sp,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.zero, // Remove bottom border radius
                bottomRight: Radius.zero, // Remove bottom border radius
              ),
            ),
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.sp),
                Center(
                  child: Text(
                    "Schedule",
                    style: TextStyle(
                      color: AppColors.color20A39E,
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                    ),
                  ),
                ),
                SizedBox(height: 15.sp),
                SizedBox(
                  width: double.infinity,
                  height: 158.sp,
                  child: CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      itemExtent: _kItemExtent,
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
                      children: List<Widget>.generate(widget.pickerItems.length,
                          (int index) {
                        return Center(child: Text(widget.pickerItems[index]));
                      })),
                ),
                SizedBox(height: 15.sp),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.handleItemSelection(
                          widget.pickerItems[selectedSchedule]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Container(
                      height: 48.sp,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        "SET DELIVERY TIME",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
