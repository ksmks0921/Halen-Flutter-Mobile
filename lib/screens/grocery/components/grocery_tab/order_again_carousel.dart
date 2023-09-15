import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/grocery/grocery.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';

class OrderAgain extends StatelessWidget {
  const OrderAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: groceryStoreData.map((store) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: _buildOrderAgainItem(context, store),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOrderAgainItem(BuildContext context, GroceryVendor store) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return Grocery(
                vendor: store,
              );
            },
          ));
        },
        child: Container(
          height: 82.h,
          width: 254.w,
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                store.image,
                width: 51.w,
                height: 28.h,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.name,
                    style: TextStyle(
                      color: AppColors.color20A39E,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.local_shipping,
                  //       color: Colors.black,
                  //       size: 16,
                  //     ),
                  //     SizedBox(width: 5.w),
                  //     Text(
                  //       'Within 3 hours',
                  //       style: TextStyle(
                  //           color: AppColors.color20A39E, fontSize: 10.sp),
                  //     ),
                  //   ],
                  // )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   store.distanceStr??"",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 12.sp,
                  //       color: AppColors.grey400),
                  // ),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_shipping,
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        store.deliveryTimeStr != null
                            ? "Within ${store.deliveryTimeStr}"
                            : "",
                        style: TextStyle(
                            color: AppColors.color20A39E, fontSize: 10.sp),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
