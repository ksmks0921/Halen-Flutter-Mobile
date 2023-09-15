import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_home/product_card.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/shop_retail/components/product_detail/product_detail.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_products/retail_products.dart';

class ProductContentCategory extends StatelessWidget {
  final String categoryName;
  final List<ShopProduct> products;
  final String categoryId;
  final ShopVendor vendor;

  const ProductContentCategory(
      {super.key,
      required this.categoryName,
      required this.products,
      required this.categoryId,
      required this.vendor});

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
                          return RetailProducts(categoryName: categoryName);
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(.02.sw),
                        ),
                        margin: EdgeInsets.only(
                            right: 10
                                .w), // Adjust the margin as per your preference
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return RetailProductDetail(
                                    productId: product.id,
                                    product: product,
                                    vendor: vendor);
                              },
                            ));
                          },
                          child: SizedBox(
                            height: 231,
                            child: RetailProductCard(
                                product: product, vendor: vendor),
                          ),
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
