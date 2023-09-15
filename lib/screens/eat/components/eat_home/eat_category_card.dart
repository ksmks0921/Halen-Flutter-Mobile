import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/eat/components/category_detail/eat_category_detail.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/eat/data.dart';

class EatCategoryCard extends StatelessWidget {
  final List<EatCategory> categories;

  const EatCategoryCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.w, top: 16.w),
        child: SizedBox(
          height: 104.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((category) {
              return Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: _buildCategoryItem(context, category),
              );
            }).toList(),
          ),
        ));
  }

  Widget _buildCategoryItem(BuildContext context, EatCategory category) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return EatCategoryDetail(
                    vendorProducts: featuredVendorProducts,
                  );
                },
              ));
            },
            child: Container(
              width: 70.h,
              height: 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Image.asset(
                category.icon,
                width: 70.h,
                height: 70.h,
                // alignment: Alignment.bottomRight,
              ),
            )),
        SizedBox(height: 8.h),
        Text(
          category.name,
          style: TextStyle(color: AppColors.defaultDarkModeBg, fontSize: 16.h),
        ),
      ],
    );
  }
}
