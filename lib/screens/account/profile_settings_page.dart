import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'data.dart';
import 'components/account_page_appbar.dart';

List<String> pslviTitle = ["Name", "Email", "Phone", "Gender", "Date of birth"];

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool showEditContent = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        AccountAppBar(
            title: "Profile Settings",
            actions: showEditContent
                ? Padding(
                    padding: EdgeInsets.only(bottom: 15.h, right: 15.w),
                    child: GestureDetector(
                        onTap: () {
                          // saveUserData();
                          setState(() {
                            showEditContent = !showEditContent;
                          });
                        },
                        child: Icon(
                          Icons.save_alt,
                          color: AppColors.white,
                          size: 27.h,
                        )))
                : Padding(
                    padding: EdgeInsets.only(bottom: 15.h, right: 15.w),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showEditContent = !showEditContent;
                          });
                        },
                        child: Icon(
                          Icons.edit_note,
                          color: AppColors.white,
                          size: 27.h,
                        )))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32.w),
                child: SizedBox(
                    width: 130.w,
                    height: 130.w,
                    child: Stack(children: [
                      SizedBox(
                          width: 130.w, height: 130.w, child: profileImage),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor1,
                                      shape: BoxShape.circle),
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ))
                    ])))
          ],
        ),
        Expanded(
            child: ListView.builder(
                itemCount: pslviValue.length,
                itemBuilder: (context, index) {
                  return ProfileSettingsLVI(
                      title: pslviTitle[index],
                      value: pslviValue[index],
                      isEditing: showEditContent);
                }))
      ],
    )));
  }
}

class ProfileSettingsLVI extends StatelessWidget {
  const ProfileSettingsLVI(
      {Key? key,
      required this.title,
      required this.value,
      required this.isEditing})
      : super(key: key);

  final String title;
  final String value;
  final bool isEditing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Container(
                  width: 350.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.w, color: Colors.black12))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 44.h,
                                child: Text(
                                  title,
                                  style: w400_19Avenir(),
                                ),
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              !isEditing
                                  ? SizedBox(
                                      height: 44.h,
                                      child: Text(
                                        value,
                                        style: w700_18Avenir(),
                                      ))
                                  : SizedBox(
                                      width: 350.w,
                                      height: 40.h,
                                      child: TextField(
                                        decoration:
                                            InputDecoration(hintText: value),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ))
                            ])
                      ]),
                ))
          ],
        ));
  }
}
