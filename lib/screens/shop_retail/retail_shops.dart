import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/display_data/delivery_times.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_search/filters_stores.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/shop_retail/retail_vendor_detail.dart';
import 'package:halen_customer_app/screens/shop_retail/data.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:logger/logger.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_cart_bar.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class RetailShops extends StatefulWidget {
  const RetailShops({super.key});

  @override
  State<RetailShops> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RetailShops> {
  final FocusNode _searchFocusNode = FocusNode();
  final Logger logger = Logger();
  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onSearchFocusChange);
  }

  @override
  void dispose() {
    _searchFocusNode.removeListener(_onSearchFocusChange);
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchFocusChange() {
    if (_searchFocusNode.hasFocus) {
      // TextField search bar is focused
      logger.d('Search bar focused');
      _searchFocusNode.unfocus();
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) {
      //     return const GrocerySearch();
      //   },
      // ));
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          // return const EatSearchScreen();
          return MainTabItemSearch(
            products: shopProductsData,
            serviceType: ServiceType.shop,
          );
        },
      ));
    } else {
      // TextField search bar lost focus
      logger.d('Search bar unfocused');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.baseGreyColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Column(
        children: [
          const GroceryCartBar(title: "Retail Shops"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    height: 40.h,
                    child: TextField(
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor:
                            Colors.white, // Set the background color to white
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const FilterStores();
                          },
                        ));
                      },
                      child: Container(
                        height: 36.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: AppColors.color20A39E,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            'Sort & Filter',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 36.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Center the row horizontally
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Over 4',
                              style: TextStyle(
                                  color: AppColors.color20A39E,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                            Icon(
                              Icons.star,
                              size: 16.sp,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 16,
                              color: AppColors.color20A39E,
                            ),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Shop: Stores Nearby",
                  style: TextStyle(
                      color: AppColors.color20A39E,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child:
          SingleChildScrollView(
              child: buildMultipleGroceryStores2(
                  context, shoppingStoreData.length)),
          // )
        ],
      ),
    ));
  }

  Widget buildMultipleGroceryStores2(BuildContext context, int count) {
    return Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: List.generate(count,
              (index) => buildGroceryStore2(context, shoppingStoreData[index])),
        ));
  }

  Widget buildGroceryStore2(BuildContext context, ShopVendor store) {
    return GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) {
          //     return const RetailHome();
          //   },
          // ));
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return RetailVendorDetail(vendor: store);
            },
          ));
        },
        child: Container(
          height: 81.h,
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                store.image, // Replace with your image path
                width: 51.w,
                height: 28.h,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.name,
                    style: TextStyle(
                      color: AppColors.color20A39E,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Delivery \$ 2.99",
                    style: TextStyle(fontSize: 12.sp, color: AppColors.grey500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_shipping,
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        getEstDeliveryTimeByStr(store),
                        style: TextStyle(
                            color: AppColors.color20A39E, fontSize: 10.sp),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // '2.1 mi',
                    store.reviewCount != null ? "${store.reviewCount}k" : "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: AppColors.grey400),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 20.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        width: 1, // Set the border width to 2 pixels
                        color: AppColors.grey400, // Set the border color to red
                      ),
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Center the row horizontally
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 10,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '4.7(120+)',
                          style: TextStyle(
                              color: AppColors.grey400, fontSize: 10.sp),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
