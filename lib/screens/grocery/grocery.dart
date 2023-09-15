import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_cart_bar.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_home/grocery_products_category.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_home/category_card.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_search/grocery_top_search.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/methods/display_data/delivery_times.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class Grocery extends StatelessWidget {
  const Grocery({
    Key? key,
    required this.vendor,
  }) : super(key: key);
  final GroceryVendor vendor;

  @override
  Widget build(BuildContext context) {
    List<Category> categories = [];
    categories = groceryCategoriesData;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.baseGreyColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Column(
        children: [
          GroceryCartBar(
            // deliveryTime: getEstDeliveryTimeByStr(vendor),
            title: vendor.name,
          ),
          GroceryTopSearch(
              // avgShippingPrice: '\$6.99',
              deliveryTime: getEstDeliveryTimeByStr(vendor),
              numUsersBought: '4.5k',
              rating: '4.6 (450+)'),
          GroceryCategoryCard(
            categories: categories,
            vendor: vendor,
          ),
          SizedBox(height: 10.h),
          Flexible(
            child: Container(
              // Replace with your desired background color
              padding: EdgeInsets.zero, // Remove the padding
              child: ListView.separated(
                padding: EdgeInsets.only(top: 10.h),
                itemCount: groceryProductsCategoriesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GroceryProductsCategory(
                      categoryName:
                          groceryProductsCategoriesData[index].categoryName,
                      products: groceryProductsCategoriesData[index].products,
                      categoryId:
                          groceryProductsCategoriesData[index].categoryId,
                      vendor: vendor);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.h, // Replace with your desired gap height
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
