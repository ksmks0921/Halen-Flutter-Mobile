import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/payment_card_information.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/rideshare/components/locations_search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';

class DriverOnTheWaySheet extends ConsumerStatefulWidget {
  const DriverOnTheWaySheet({
    Key? key,
    required this.visible,
  }) : super(key: key);
  final bool visible;
  @override
  DriverOnTheWaySheetState createState() => DriverOnTheWaySheetState();
}

class DriverOnTheWaySheetState extends ConsumerState<DriverOnTheWaySheet> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 12.w, top: 12.h, bottom: 12.h),
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/illustrations/profile_image.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ben Stokes",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 20),
                            Text("4.9",
                                style: TextStyle(
                                    color: AppColors.grey500, fontSize: 16.sp)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                MaterialButton(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(14),
                  color: AppColors.greenColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.comment_outlined,
                    color: AppColors.baseGreyColor,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Arrival Time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "10:05 pm",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PLV9803",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "White • Toyota Prius",
                        style: TextStyle(
                            color: AppColors.grey500, fontSize: 14.sp),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 130.h,
              child: const LocationsSearchBar(
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const PaymentCardInformation(
                    showArrow: false,
                  ),
                  SizedBox(
                    height: 45.h,
                    child: VerticalDivider(
                      thickness: 1,
                      width: 3,
                      color: AppColors.grey400,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.w, right: 8.w, bottom: 8.h),
                              child: Text("Distance",
                                  style: TextStyle(
                                      color: AppColors.grey500,
                                      fontSize: 15.h)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.w, right: 8.w, bottom: 8.h),
                              child: Text("Time",
                                  style: TextStyle(
                                      color: AppColors.grey500,
                                      fontSize: 15.w)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16.w, right: 8.w, bottom: 8.h),
                              child: Text("Price",
                                  style: TextStyle(
                                      color: AppColors.grey500,
                                      fontSize: 15.w)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 12.w),
                              child: Text("1.4 mil",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.w)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 12.w),
                              child: Text("6 min",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.w)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 12.w),
                              child: Text("\$${ref.watch(rsPriceProv) ?? ""}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.w)),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
