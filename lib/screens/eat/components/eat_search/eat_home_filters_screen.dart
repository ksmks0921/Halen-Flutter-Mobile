import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class EatHomeFiltersScreen extends StatefulWidget {
  const EatHomeFiltersScreen({Key? key}) : super(key: key);

  @override
  State<EatHomeFiltersScreen> createState() => _EatHomeFiltersScreenState();
}

class _EatHomeFiltersScreenState extends State<EatHomeFiltersScreen> {
  double _selectedValue = 0.5;
  final double _minValue = 0;
  final double _maxValue = 1;
  String sortBy = "";
  bool _switchValue = true;

  resetFilters() {
    setState(() {
      _selectedValue = .5;
      sortBy = "";
      _switchValue = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.baseGreyColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.greenColor,
        centerTitle: true,
        leading: IconButton(
          icon: ImageIcon(
            const AssetImage('assets/images/icons/back.png'),
            size: 18.w,
            color: AppColors.bgdDefTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            Text(
              "Filters",
              style:
                  TextStyle(fontSize: 16.sp, color: AppColors.bgdDefTextColor),
            ),
          ],
        ),
        actions: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  resetFilters();
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          fontSize: 12.sp, color: AppColors.bgdDefTextColor),
                    )))
          ])
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(children: [
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Distance",
                          style: TextStyle(
                              fontSize: 16.w,
                              fontWeight: FontWeight.w500,
                              color: AppColors.bglDefTextColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 6, // Adjust the track height as desired
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius:
                                14.r), // Adjust the thumb shape and size
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 18.r),
                      ),
                      child: Slider(
                        value: _selectedValue,
                        min: _minValue,
                        max: _maxValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                        activeColor:
                            AppColors.color20A39E, // Set the color to blue
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      height: 220.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Colors.white),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Sort by",
                              style: TextStyle(
                                  color: AppColors.bglDefTextColor,
                                  fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text("Highest Rated",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.bglDefTextColor)),
                              value: "highest",
                              groupValue: sortBy,
                              activeColor: AppColors.color20A39E,
                              onChanged: (value) {
                                setState(() {
                                  sortBy = value.toString();
                                });
                              },
                              dense: true,
                              visualDensity:
                                  const VisualDensity(vertical: -4.0),
                            ),
                            RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text("Nearest Me",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.bglDefTextColor)),
                              value: "nearest",
                              groupValue: sortBy,
                              activeColor: AppColors.color20A39E,
                              onChanged: (value) {
                                setState(() {
                                  sortBy = value.toString();
                                });
                              },
                              dense: true,
                              visualDensity:
                                  const VisualDensity(vertical: -4.0),
                            ),
                            RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text("Cost: Low to High",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.bglDefTextColor)),
                              value: "low_to_high",
                              groupValue: sortBy,
                              activeColor: AppColors.color20A39E,
                              onChanged: (value) {
                                setState(() {
                                  sortBy = value.toString();
                                });
                              },
                              dense: true,
                              visualDensity:
                                  const VisualDensity(vertical: -4.0),
                            ),
                            RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text("Relevance",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.bglDefTextColor)),
                              value: "relevance",
                              groupValue: sortBy,
                              activeColor: AppColors.color20A39E,
                              onChanged: (value) {
                                setState(() {
                                  sortBy = value.toString();
                                });
                              },
                              dense: true,
                              visualDensity:
                                  const VisualDensity(vertical: -4.0),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 20.w),
                      height: 120.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Colors.white),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open now",
                              style: TextStyle(
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.bglDefTextColor),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            CupertinoSwitch(
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                              activeColor: AppColors
                                  .color20A39E, // Set the color to blue
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ],
          )),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 10.h),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.color20A39E,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                child: Container(
                  height: 48.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            )
          ])
        ]),
      ),
    ));
  }
}
