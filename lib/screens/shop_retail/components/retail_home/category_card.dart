import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_products/retail_products.dart';

class RetailCategoryCard extends StatelessWidget {
  final List<Category> categories;

  const RetailCategoryCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.w, top: 16.h),
        child: SizedBox(
          height: 114.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: _buildCategoryItem(context, category),
              );
            }).toList(),
          ),
        ));
  }

  Widget _buildCategoryItem(BuildContext context, Category category) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return RetailProducts(categoryName: category.name);
            },
          ));
        },
        child: Column(
          children: [
            Container(
              width: 70.h,
              height: 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Container(
                  width: 60.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                        category.icon,
                        // fit: BoxFit.fitHeight,
                        // width: 60.h,
                        // height: 60.h,
                        // alignment: Alignment.bottomRight,
                      )))),
            ),
            SizedBox(height: 8.h),
            Text(
              category.name,
              style: TextStyle(
                  color: AppColors.defaultDarkModeBg, fontSize: 14.sp),
            ),
          ],
        ));
  }
}
