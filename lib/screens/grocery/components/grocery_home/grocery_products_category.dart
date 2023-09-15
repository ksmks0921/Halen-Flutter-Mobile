import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_product_card.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_products.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';

class GroceryProductsCategory extends StatelessWidget {
  final String categoryName;
  final List<GroceryProduct> products;
  final String categoryId;
  final GroceryVendor vendor;

  const GroceryProductsCategory({
    super.key,
    required this.categoryName,
    required this.products,
    required this.categoryId,
    required this.vendor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                      fontSize: 16.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return GroceryProducts(
                            categoryId: categoryId,
                            vendor: vendor,
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
                            fontSize: 12.sp,
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
          padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products
                  .map(
                    (product) => Container(
                      margin: EdgeInsets.only(
                          right:
                              10.w), // Adjust the margin as per your preference
                      child: SizedBox(
                        height: 231.h,
                        child: GroceryProductCard(
                          product: product,
                          vendor: vendor,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
