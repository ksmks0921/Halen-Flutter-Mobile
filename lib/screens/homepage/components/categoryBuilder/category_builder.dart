import 'package:flutter/material.dart';
import 'package:halen_customer_app/components/button_tabbar.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/homepage/data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({super.key, required this.items});
  final List<String> items;

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.w),
          child: DefaultTabController(
            length: 4,
            child: ButtonsTabBar(
              unselectedLabelStyle: TextStyle(color: Colors.grey.shade600),
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 8.h),
              buttonMargin: EdgeInsets.symmetric(horizontal: 7.w),
              height: 42.h,
              tabs: const [
                Tab(
                  text: "Ride",
                ),
                Tab(
                  text: "Eat",
                ),
                Tab(
                  text: "Grocery",
                ),
                Tab(
                  text: "Shop",
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              constraints: BoxConstraints(maxHeight: 42.h),
              filled: true,
              fillColor: AppColors.greyColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Image.asset('assets/images/icons/Search.png'),
              hintText: 'Where to?',
              hintStyle: TextStyle(
                color: Colors.black87,
                fontSize: 14.sp,
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/icons/Time Square.png'),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'Now',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      Icons.expand_more,
                      size: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 285.h,
          child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Card(
                  elevation: 2.0,
                  clipBehavior: Clip.hardEdge,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Container(
                        color: AppColors.greenColor,
                        width: 7.w,
                        height: 90.h,
                      ),
                      SizedBox(
                        width: 235.w,
                        height: 55.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categoryList[index].name,
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Colors.black87),
                              ),
                              Flexible(
                                child: Text(
                                  categoryList[index].description,
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.w),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 100.w),
                              child: Image.asset(
                                'assets/images/icons/Arrow - Right.png',
                                color: AppColors.greenColor,
                                width: 12.w,
                                height: 14.h,
                              ),
                            ),
                            Container(
                              width: 102.w,
                              height: 45.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: ClipRRect(
                                // borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  categoryList[index].imagePath,
                                  width: 50.w,
                                  height: 70.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
