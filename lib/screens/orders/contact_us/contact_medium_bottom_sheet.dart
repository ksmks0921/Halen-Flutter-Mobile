import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'package:halen_customer_app/screens/orders/components/schedule_action_bottom_sheet.dart';

class ContactMediumModalContent extends StatefulWidget {
  const ContactMediumModalContent({Key? key}) : super(key: key);

  @override
  State<ContactMediumModalContent> createState() =>
      _ContactMediumModalContentState();
}

class _ContactMediumModalContentState extends State<ContactMediumModalContent> {
  mediumSelectCB() {
    Navigator.pop(context);
  }

  selectMediumCB(String label) {
    if (label == "Call Us") {
      //TODO calling
      Navigator.pop(context);
      mediumSelectCB();
    } else if (label == "Chat with us") {
      //TODO chatting
      Navigator.pop(context);
      mediumSelectCB();
    } else if (label == "Schedule a callback") {
      // Navigator.pop(context);
      showModalBottomSheetFloatClose(
        context,
        ScheduleActionModalContent(
            titleText: "Schedule Pick up",
            submitText: "Submit",
            setCallbackScheduleCB: mediumSelectCB),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: .42.sh,
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Row(
                    children: [
                      Text(
                        "Select the medium",
                        style: TextStyle(
                          color: AppColors.color20A39E,
                          fontWeight: FontWeight.w500,
                          fontSize: 22.w,
                        ),
                      ),
                    ],
                  )),
              SelectMediumLVI(
                label: "Call Us",
                icon: Icons.phone_callback_outlined,
                selectMediumCB: selectMediumCB,
              ),
              SelectMediumLVI(
                label: "Chat with us",
                icon: Icons.chat_bubble,
                selectMediumCB: selectMediumCB,
              ),
              SelectMediumLVI(
                label: "Schedule a callback",
                icon: Icons.access_time_filled,
                selectMediumCB: selectMediumCB,
              )
            ]));
  }
}

class SelectMediumLVI extends StatelessWidget {
  const SelectMediumLVI({
    Key? key,
    required this.label,
    required this.icon,
    required this.selectMediumCB,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function selectMediumCB;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          selectMediumCB(label);
        },
        child: Material(
            elevation: 8.w,
            child: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 12.w, 12.w, 12.w),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.w, color: AppColors.primaryColor1),
                            shape: BoxShape.circle),
                        child: Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Icon(
                              icon,
                              color: AppColors.primaryColor1,
                              size: 18.w,
                            ))),
                    SizedBox(width: 24.w),
                    Text(
                      label,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.w,
                      ),
                    ),
                  ],
                ))));
  }
}
