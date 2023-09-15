import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RideShareCard extends StatelessWidget {
  const RideShareCard({
    Key? key,
    required this.imagePath,
    required this.rideSize,
    required this.cost,
    required this.timeAway,
    required this.selected,
    required this.selectCB,
  }) : super(key: key);
  final String imagePath;
  final String rideSize;
  final String cost;
  final String timeAway;
  final bool selected;
  final Function selectCB;

  @override
  Widget build(BuildContext context) {
    Color selectedTextColor = selected ? Colors.white : Colors.black;
    Color selectedTextAccentColor =
        selected ? Colors.grey[200]! : Colors.grey[400]!;

    return GestureDetector(
        onTap: () {
          selectCB();
        },
        child: Container(
          width: 0.30.sw,
          height: 155.h,
          margin: EdgeInsets.symmetric(horizontal: .01.sw),
          padding: EdgeInsets.fromLTRB(.4.h, .4.h, .4.h, .4.h),
          decoration: BoxDecoration(
            color: selected ? Colors.blueGrey[700] : Colors.grey[200],
            border: selected
                ? Border.all(width: 3.w, color: Colors.lightBlue[100]!)
                : Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(color: Colors.red, height: 4.w, width: 33.w),
              SizedBox(
                height: 8.h,
              ),
              Image.asset(
                imagePath,
                height: 90.h,
                fit: BoxFit.fitHeight,
              ),
              // const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rideSize,
                        style: TextStyle(color: selectedTextAccentColor)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                          size: 16.h,
                          color: selectedTextAccentColor,
                        ),
                        if (rideSize == "Small")
                          Text("3",
                              style: TextStyle(
                                  color: selectedTextColor, fontSize: 14.sp))
                        else if (rideSize == "Medium" || rideSize == "Sedan")
                          Text("4",
                              style: TextStyle(
                                  color: selectedTextColor, fontSize: 14.sp))
                        else if (rideSize == "Large")
                          Text("5",
                              style: TextStyle(
                                  color: selectedTextColor, fontSize: 14.sp))
                        else if (rideSize == "SUV")
                          Text("6",
                              style: TextStyle(
                                  color: selectedTextColor, fontSize: 14.sp)),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("\$$cost",
                        style: TextStyle(
                            color: selectedTextColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(timeAway,
                        style: TextStyle(
                            color: selectedTextColor, fontSize: 12.sp)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
