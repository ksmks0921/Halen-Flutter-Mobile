import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_cart_bar.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_search/filters_stores.dart';
import 'package:halen_customer_app/screens/grocery/grocery.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:logger/logger.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';
import 'package:halen_customer_app/widgets/search_text_input.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class GroceryShops extends StatefulWidget {
  const GroceryShops({super.key});

  @override
  State<GroceryShops> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GroceryShops> {
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
      _searchFocusNode.unfocus();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return MainTabItemSearch(
            products: allGroceryProducts,
            serviceType: ServiceType.grocery,
          );
        },
      ));
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
          const GroceryCartBar(title: "Order Again"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchInputLink(
                  focusNode: _searchFocusNode,
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
                      onTap: () {
                        // Handle the click event
                        // Add your desired action or navigation here
                      },
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
          Expanded(
            child: SingleChildScrollView(
                child: buildMultipleGroceryStores2(
                    context, groceryStoreData.length)),
          )
        ],
      ),
    ));
  }

  Widget buildMultipleGroceryStores2(BuildContext context, int count) {
    return Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: List.generate(count,
              (index) => buildGroceryStore2(context, groceryStoreData[index])),
        ));
  }

  Widget buildGroceryStore2(BuildContext context, GroceryVendor store) {
    return Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Grocery(
                    vendor: store,
                  );
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
                        store.deliveryFee != null
                            ? "Delivery ${twoDecItemPriceString(store.deliveryFee!)}"
                            : "",
                        style: TextStyle(
                            fontSize: 12.sp, color: AppColors.grey400),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // Row(
                      //   children: [
                      //     const Icon(
                      //       Icons.local_shipping,
                      //       color: Colors.black,
                      //       size: 16,
                      //     ),
                      //     SizedBox(width: 5.w),
                      //     Text(
                      //       store.deliveryTimeStr!=null?
                      //       'Within ${store.deliveryTimeStr}':"",
                      //       style: TextStyle(
                      //           color: AppColors.color20A39E, fontSize: 10.sp),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   '2.1 mi',
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 12.sp,
                      //       color: AppColors.grey400),
                      // ),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_shipping,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            store.deliveryTimeStr != null
                                ? 'Within ${store.deliveryTimeStr}'
                                : "",
                            style: TextStyle(
                                color: AppColors.color20A39E, fontSize: 10.sp),
                          ),
                        ],
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
                            color: AppColors
                                .grey400, // Set the border color to red
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
            )));
  }
}
