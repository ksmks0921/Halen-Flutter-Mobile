import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_products.dart';

class GroceryCategoryCard extends StatelessWidget {
  final List<Category> categories;
  final GroceryVendor vendor;

  const GroceryCategoryCard(
      {super.key, required this.categories, required this.vendor});

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
                child: _buildCategoryItem(context, category, vendor),
              );
            }).toList(),
          ),
        ));
  }

  Widget _buildCategoryItem(
      BuildContext context, Category category, GroceryVendor vendor) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return GroceryProducts(
                    categoryId: category.name,
                    vendor: vendor,
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
          style: TextStyle(color: AppColors.defaultDarkModeBg, fontSize: 14.sp),
        ),
      ],
    );
  }
}
