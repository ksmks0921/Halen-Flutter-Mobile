import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressBottomSheetContent extends StatefulWidget {
  const AddAddressBottomSheetContent({Key? key, required this.height})
      : super(key: key);

  final double height;

  @override
  State<AddAddressBottomSheetContent> createState() =>
      _AddAddressBottomSheetContentState();
}

class _AddAddressBottomSheetContentState
    extends State<AddAddressBottomSheetContent> {
  late TextStyle inputFieldHeadingTS;

  int addressTypeSelectedVal = -1;

  setAddressTypeSelected(int val) {
    setState(() {
      addressTypeSelectedVal = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    inputFieldHeadingTS =
        TextStyle(color: AppColors.primaryColor2, fontSize: 18.sp);
    return Container(
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.w),
              topLeft: Radius.circular(16.w),
            ),
            color: Theme.of(context).scaffoldBackgroundColor),
        child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
            child: Column(children: [
              Column(children: [
                Row(
                  children: [
                    Text(
                      "Add Address",
                      style: TextStyle(
                          color: AppColors.primaryColor2, fontSize: 24.sp),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  children: [
                    Row(children: [
                      Text("House/Flat/Floor no.", style: inputFieldHeadingTS)
                    ]),
                    const TextField(
                      decoration: InputDecoration(hintText: "ABC"),
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Column(
                  children: [
                    Row(children: [
                      Text("Road/ Area Name", style: inputFieldHeadingTS)
                    ]),
                    const TextField(
                      decoration: InputDecoration(hintText: "ABC"),
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Column(children: [
                  Row(children: [
                    SizedBox(
                        width: .46.sw,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Zip Code", style: inputFieldHeadingTS),
                              SizedBox(
                                  width: .46.sw,
                                  child: const TextField(
                                    decoration:
                                        InputDecoration(hintText: "ABC"),
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ])),
                    SizedBox(
                        width: .46.sw,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("City", style: inputFieldHeadingTS),
                              SizedBox(
                                  width: .46.sw,
                                  child: const TextField(
                                    decoration:
                                        InputDecoration(hintText: "ABC"),
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ])),
                  ])
                ]),
                SizedBox(height: 16.h),
                Column(
                  children: [
                    Row(children: [
                      Text("Save as", style: inputFieldHeadingTS)
                    ]),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: .3.sw,
                            child: Center(
                                child: GestureDetector(
                                    onTap: () {
                                      setAddressTypeSelected(0);
                                    },
                                    child: AddressTypeSelectButton(
                                        setAddressTypeSelected:
                                            setAddressTypeSelected,
                                        icon: Icons.home_outlined,
                                        label: "Home",
                                        selectedIndex: 0,
                                        isSelected: addressTypeSelectedVal == 0
                                            ? true
                                            : false)))),
                        SizedBox(
                            width: .3.sw,
                            child: Center(
                                child: GestureDetector(
                                    onTap: () {
                                      setAddressTypeSelected(1);
                                    },
                                    child: AddressTypeSelectButton(
                                        setAddressTypeSelected:
                                            setAddressTypeSelected,
                                        icon: Icons.home_work_outlined,
                                        label: "Work",
                                        selectedIndex: 1,
                                        isSelected: addressTypeSelectedVal == 1
                                            ? true
                                            : false)))),
                        SizedBox(
                            width: .3.sw,
                            child: Center(
                                child: GestureDetector(
                                    onTap: () {
                                      setAddressTypeSelected(2);
                                    },
                                    child: AddressTypeSelectButton(
                                        setAddressTypeSelected:
                                            setAddressTypeSelected,
                                        icon: Icons.location_on_outlined,
                                        label: "Other",
                                        selectedIndex: 2,
                                        isSelected: addressTypeSelectedVal == 2
                                            ? true
                                            : false))))
                      ],
                    ),
                    SizedBox(height: 16.h),
                    addressTypeSelectedVal == 2
                        ? const TextField(
                            decoration:
                                InputDecoration(hintText: "My brother's home"),
                            style: TextStyle(color: Colors.black),
                          )
                        : Container()
                  ],
                ),
              ])
            ])));
  }
}

class AddressTypeSelectButton extends StatelessWidget {
  const AddressTypeSelectButton(
      {Key? key,
      required this.setAddressTypeSelected,
      required this.label,
      required this.icon,
      required this.isSelected,
      required this.selectedIndex})
      : super(key: key);

  final Function setAddressTypeSelected;
  final String label;
  final IconData icon;
  final bool isSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: .3.sw,
        child: Center(
            child: GestureDetector(
          onTap: () {
            setAddressTypeSelected(selectedIndex);
          },
          child: Container(
              width: .27.sw,
              height: 36.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                color: isSelected ? AppColors.primaryColor2 : Colors.grey[200],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(icon),
                    Text(label, style: w400_14Avenir()),
                  ])),
        )));
  }
}
