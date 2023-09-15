import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/eat/components/vendor_detail/eat_vendor_detail.dart';
import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/screens/eat/components/category_detail/eat_category_detail.dart';
import 'package:halen_customer_app/screens/eat/components/eat_home/eat_vendor_card.dart';
import 'package:halen_customer_app/screens/eat/models.dart';

class EatVendorContentCategory extends StatelessWidget {
  final String categoryName;
  final List<EatVendor> vendors;

  const EatVendorContentCategory({
    super.key,
    required this.categoryName,
    required this.vendors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 20.w),
            child: SizedBox(
              height: 40.h, // Replace with the desired height
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.h,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return EatCategoryDetail(
                            vendorProducts: featuredVendorProducts,
                          );
                        },
                      ));
                      // Handle "View All" button click
                    },
                    child: Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            color: AppColors.color20A39E,
                            fontSize: 14.h,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: AppColors.color20A39E,
                          size: 16.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.fromLTRB(10.w, 0, 0, 12.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: vendors
                  .map(
                    (vendor) => Container(
                        margin: EdgeInsets.only(
                            right: 10
                                .w), // Adjust the margin as per your preference
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return EatVendorDetail(
                                  vendor: vendor,
                                );
                              },
                            ));
                          },
                          child: EatVendorCard(vendor: vendor),
                        )),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
