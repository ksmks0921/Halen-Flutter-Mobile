import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_home/category_card.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_home/product_content_category.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_appbar/shop_appbar.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_home/top_search.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/screens/shop_retail/data.dart';
import 'package:halen_customer_app/methods/display_data/delivery_times.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class RetailVendorDetail extends StatefulWidget {
  const RetailVendorDetail({super.key, required this.vendor});
  final ShopVendor vendor;
  @override
  State<RetailVendorDetail> createState() => _RetailVendorDetailState();
}

class _RetailVendorDetailState extends State<RetailVendorDetail> {
  List<List<ShopProduct>> productsCategoriesData = [];
  @override
  void initState() {
    // build test data
    int i = 0;
    while (i < categoriesData.length) {
      shopProductsData.shuffle();
      List<ShopProduct> pc0 = [];
      for (var item in shopProductsData) {
        pc0.add(item.copyWith(id: "${item.id}1"));
      }
      productsCategoriesData.add([...pc0]);
      i++;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.baseGreyColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Column(
        children: [
          ShopAppBar(
            name: widget.vendor.name,
            location: getEstDeliveryTimeByStr(widget.vendor),
            // location: widget.vendor.addressShort??"",
          ),
          RetailTopSearch(
              // avgShippingPrice: '\$6.99',
              deliveryTime: getEstDeliveryTimeByStr(widget.vendor),
              numUsersBought: '5.8k',
              rating: '4.6 (250+)'),
          RetailCategoryCard(categories: categoriesData),
          SizedBox(height: 10.h),
          Flexible(
            child: Container(
              // Replace with your desired background color
              padding: EdgeInsets.zero, // Remove the padding
              child: ListView.separated(
                padding: EdgeInsets.only(top: 10.h),
                itemCount: productsCategoriesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductContentCategory(
                    categoryName: categoriesData[index].name,
                    products: productsCategoriesData[index],
                    categoryId: productsCategoriesData[index][0].categoryId!,
                    vendor: widget.vendor,
                  );
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
