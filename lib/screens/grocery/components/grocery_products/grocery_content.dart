import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_product_card.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_product_detail.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/constants/colors.dart';

class GroceryContent extends StatelessWidget {
  // final List<String> tabTitles;
  final List<GroceryProductPerCategory> products;
  final GroceryVendor vendor;

  const GroceryContent({Key? key, required this.products, required this.vendor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: products.length,
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              tabBarTheme: TabBarTheme(
                labelColor: AppColors
                    .navyButton, // Change the color of the selected tab's text
                unselectedLabelColor: AppColors
                    .grey500, // Change the color of the unselected tabs' text
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppColors
                        .greenColor, // Set the color of the selected line here
                    width: 2.w, // Set the width of the selected line
                  ),
                ),
              ),
            ),
            child: TabBar(
              isScrollable: true,
              tabs:
                  products.map((item) => Tab(text: item.categoryName)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: products.map((productPerSubCategory) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: productPerSubCategory.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final product = productPerSubCategory.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return GroceryProductDetail(
                              // productId:
                              //     productPerSubCategory.products[index].id,
                              product: product,
                              vendor: vendor,
                            );
                          },
                        ));
                      },
                      child: SizedBox(
                        height: 231.h,
                        child: GroceryProductCard(
                          product: product,
                          vendor: vendor,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
