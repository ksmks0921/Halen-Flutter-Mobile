import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/rideshare/components/driver_profile_widget.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewDriver extends ConsumerStatefulWidget {
  final bool visible;
  const ReviewDriver({super.key, required this.visible});

  @override
  ReviewDriverState createState() => ReviewDriverState();
}

class ReviewDriverState extends ConsumerState<ReviewDriver> {
  List<Color> ratingBlock = [
    Colors.grey[300]!,
    AppColors.starIconColor,
    AppColors.starIconColor,
    AppColors.starIconColor,
    AppColors.starIconColor,
  ];

  ratingBlockUpdate(xpos) {
    if (xpos < (1.sw) - ((1.sw - (5 * 40)) / 2) - (5 * 40)) {
      setState(() {
        ratingBlock = [
          Colors.grey[300]!,
          Colors.grey[300]!,
          Colors.grey[300]!,
          Colors.grey[300]!,
          Colors.grey[300]!
        ];
      });
    } else if (xpos < (1.sw) - ((1.sw - (5 * 40)) / 2) - (4 * 40)) {
      setState(() {
        ratingBlock = [
          Colors.grey[300]!,
          Colors.grey[300]!,
          Colors.grey[300]!,
          Colors.grey[300]!,
          AppColors.starIconColor
        ];
      });
    } else if (xpos < (1.sw) - ((1.sw - (5 * 40)) / 2) - (3 * 40)) {
      setState(() {
        ratingBlock = [
          Colors.grey[300]!,
          Colors.grey[300]!,
          Colors.grey[300]!,
          AppColors.starIconColor,
          AppColors.starIconColor
        ];
      });
    } else if (xpos < (1.sw) - ((1.sw - (5 * 40)) / 2) - (2 * 40)) {
      setState(() {
        ratingBlock = [
          Colors.grey[300]!,
          Colors.grey[300]!,
          AppColors.starIconColor,
          AppColors.starIconColor,
          AppColors.starIconColor
        ];
      });
    } else if (xpos < (1.sw) - ((1.sw - (5 * 40)) / 2) - (40)) {
      setState(() {
        ratingBlock = [
          Colors.grey[300]!,
          AppColors.starIconColor,
          AppColors.starIconColor,
          AppColors.starIconColor,
          AppColors.starIconColor
        ];
      });
    } else if (xpos > (1.sw) - ((1.sw - (5 * 40)) / 2) - (40)) {
      setState(() {
        ratingBlock = [
          AppColors.starIconColor,
          AppColors.starIconColor,
          AppColors.starIconColor,
          AppColors.starIconColor,
          AppColors.starIconColor
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: SizedBox(
          height: .911.sh,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).pop();
              //   },
              //   child: Container(
              //     padding: EdgeInsets.only(
              //         top: 8.h, left: 12.w, bottom: 8.h, right: 6.w),
              //     margin: EdgeInsets.only(top: 25.r, left: 25.r),
              //     decoration: BoxDecoration(
              //         color: AppColors.greenColor,
              //         borderRadius: BorderRadius.circular(5.r)),
              //     child: Icon(
              //       Icons.arrow_back_ios,
              //       color: AppColors.baseGreyColor,
              //       size: 20,
              //     ),
              //   ),
              // ),
              // const Center(child: DriverProfileWidget()),
              const DriverProfileWidget(),
              SizedBox(
                height: .045.sh,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "How is your trip?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              GestureDetector(
                  onHorizontalDragUpdate: (DragUpdateDetails ded) {
                    // print("dud"+ ded.globalPosition.dx.toString() );
                    ratingBlockUpdate(ded.globalPosition.dx);
                  },
                  onTapDown: (TapDownDetails td) {
                    final tapPosition = td.globalPosition;
                    ratingBlockUpdate(tapPosition.dx);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: ratingBlock[4], size: 40),
                      Icon(Icons.star, color: ratingBlock[3], size: 40),
                      Icon(Icons.star, color: ratingBlock[2], size: 40),
                      Icon(Icons.star, color: ratingBlock[1], size: 40),
                      Icon(Icons.star, color: ratingBlock[0], size: 40),
                    ],
                  )),
              Container(
                height: 100.h,
                margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      hintText: "Write your feedback",
                      hintStyle: TextStyle(color: Colors.grey.shade500)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  shrinkWrap: true,
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: (1.sw / 1.sh) > .6 ? 5 / 2 : 3 / 1.8),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.h),
                      child: MaterialButton(
                        shape: const StadiumBorder(),
                        color: AppColors.greenColor,
                        onPressed: () {},
                        child: Text("\$${index + 1}",
                            style: const TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Choose other amount",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "What do you think about the service?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 20.h),
                child: Wrap(
                  children: [
                    const ReviewAttributeButton(
                      label: "Friendly Driver",
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    const ReviewAttributeButton(
                      label: "Clean car",
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    const ReviewAttributeButton(
                      label: "Good driving",
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    const ReviewAttributeButton(
                      label: "Needs improvement",
                    ),
                  ],
                ),
              ),
              Container(
                height: .1.sh,
              ),
              GestureDetector(
                  onTap: () {
                    ref.read(navStateProvider.notifier).state = 0;
                    ref.read(rsPageStateProv.notifier).state = null;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        homePageRoute, (route) => false);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      margin: EdgeInsets.only(
                          right: 20.w, left: 20.w, bottom: 20.h),
                      constraints:
                          BoxConstraints.tight(Size(double.infinity, 49.h)),
                      decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.bgdDefTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ))),
              Container(
                height: .1.sh,
              )
            ],
          )),
    );
  }
}

class ReviewAttributeButton extends StatefulWidget {
  const ReviewAttributeButton({super.key, required this.label});
  final String label;
  @override
  State<ReviewAttributeButton> createState() => _ReviewAttributeButtonState();
}

class _ReviewAttributeButtonState extends State<ReviewAttributeButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: MaterialButton(
          shape: const StadiumBorder(),
          color: selected ? AppColors.greenColor : Colors.grey[300],
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          onPressed: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Text(
            widget.label,
            style: TextStyle(color: selected ? Colors.white : Colors.black),
          ),
        ));
  }
}
