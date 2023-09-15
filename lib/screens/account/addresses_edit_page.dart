import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'components/account_page_appbar.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'components/add_address_bottom_sheet.dart';
import 'data.dart';

List<IconData> addressIcons = [
  Icons.home_outlined,
  Icons.home_work_outlined,
  Icons.location_on_outlined
];

class AddressesEditPage extends StatefulWidget {
  const AddressesEditPage({Key? key}) : super(key: key);

  @override
  State<AddressesEditPage> createState() => _AddressesEditPageState();
}

class _AddressesEditPageState extends State<AddressesEditPage> {
  showAddAddressBottomSheet() {
    showModalBottomSheetFloatClose(
        context, AddAddressBottomSheetContent(height: .55.sh));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        const AccountAppBar(title: "Addresses"),
        Expanded(
            child: ListView.builder(
                itemCount: addressDatas.length + 1,
                itemBuilder: (context, index) {
                  IconData icond = Icons.location_on_outlined;
                  if (index < 2) {
                    icond = addressIcons[index];
                    return EditAddressLVI(
                      addressType: submittedAddressTypes[index],
                      icon: icond,
                      addressValue: addressDatas[index],
                    );
                  }
                  return AddAddressLVI(
                    showAddAddressBottomSheet: showAddAddressBottomSheet,
                  );
                }))
      ]),
    ));
  }
}

class AddAddressLVI extends StatelessWidget {
  const AddAddressLVI({Key? key, required this.showAddAddressBottomSheet})
      : super(key: key);

  final Function showAddAddressBottomSheet;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
          onTap: () {
            showAddAddressBottomSheet();
          },
          child: Container(
            width: .94.sw,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.w),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 0, 8.w, 0),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primaryColor2,
                    )),
                Text(
                  "Add Addresses",
                  style: TextStyle(
                    color: AppColors.primaryColor2,
                    fontSize: 18.sp,
                  ),
                )
              ]),
            ),
          ))
    ]);
  }
}

class EditAddressLVI extends StatefulWidget {
  const EditAddressLVI({
    Key? key,
    required this.addressType,
    required this.icon,
    required this.addressValue,
  }) : super(key: key);

  final String addressType;
  final IconData icon;
  final String addressValue;
  @override
  State<EditAddressLVI> createState() => _EditAddressLVIState();
}

class _EditAddressLVIState extends State<EditAddressLVI> {
  bool editAddressSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.w),
        child: Container(
            color: Colors.white,
            width: .94.sw,
            height: .35.sw,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            widget.icon,
                            color: AppColors.primaryColor3,
                          )
                        ])),
                Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Text(
                              widget.addressType,
                              style: TextStyle(
                                  color: AppColors.primaryColor2,
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          editAddressSelected
                              ? SizedBox(
                                  width: 180.w,
                                  child: const TextField(
                                    style: TextStyle(color: Colors.black),
                                  ))
                              : SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    widget.addressValue,
                                    softWrap: true,
                                    style: w400_19Avenir(),
                                  ))
                        ])),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
                            child: editAddressSelected
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        editAddressSelected = false;
                                      });
                                    },
                                    child: Text(
                                      "Save",
                                      style: w600_14Avenir(),
                                    ))
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        editAddressSelected = true;
                                      });
                                    },
                                    child: Text(
                                      "Edit",
                                      style: w600_14Avenir(),
                                    ))),
                        editAddressSelected
                            ? SizedBox(
                                height: 32.h,
                              )
                            : const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 16, 24),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ))
                      ],
                    )
                  ],
                ))
              ]),
            )),
      )
    ]);
  }
}
