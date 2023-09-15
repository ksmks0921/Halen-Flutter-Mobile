import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_app_bar.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/screens/grocery/methods/grocery_product_data_requests.dart';
import 'package:halen_customer_app/screens/shop_retail/methods/shop_product_data_requests.dart';
import 'package:halen_customer_app/screens/eat/methods/eat_product_data_requests.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/widgets/search_text_input.dart';
import 'package:logger/logger.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/models/vendor_model_generic.dart';
import 'package:halen_customer_app/screens/search/g_product_search_result_card_one.dart';
import 'package:halen_customer_app/screens/search/search_history_item.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class MainTabItemSearch extends StatefulWidget {
  const MainTabItemSearch(
      {super.key, required this.products, required this.serviceType});

  final List<GProduct> products;
  final ServiceType serviceType;

  @override
  State<MainTabItemSearch> createState() => MainTabItemSearchState();
}

class MainTabItemSearchState extends State<MainTabItemSearch> {
  final Logger logger = Logger();
  final TextEditingController _searchController = TextEditingController();
  bool searched = false;

  List<GProduct> productResults = [];

  @override
  void initState() {
    productResults = widget.products;
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String searchTextGet = "";
  void performSearch(String searchText) {
    // Handle the search operation using the searchText
    // Example: Trigger API call or update search results

    logger.d('Search Text: $searchText');

    List<GProduct> newProdResults = [];

    if (searchText != "") {
      for (var prod in widget.products) {
        if (prod.productName.contains(searchText)) {
          if (newProdResults.length < 10) {
            newProdResults.add(prod);
          }
        }
      }

      productResults = newProdResults;

      searched = true;
      searchTextGet = searchText;
    } else {
      searched = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.baseGreyColor,
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(children: [
              const GroceryAppBar(
                title: 'Search',
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchInputBar(
                            textController: _searchController,
                            searchCB: performSearch),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          children: [
                            Text(
                              !searched
                                  ? "Past Searches"
                                  : "Search for $searchTextGet",
                              style: TextStyle(
                                color: AppColors.color20A39E,
                                fontSize: 18.sp,
                              ),
                            ),
                            if (!searched)
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle the clear action here
                                    },
                                    child: Text(
                                      "clear",
                                      style: TextStyle(
                                        color: AppColors.color20A39E,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.grey300,
                        ),
                      ])),
              productResults.isEmpty
                  ? const Center(child: Text("Nothing found"))
                  : Expanded(
                      child: SingleChildScrollView(
                      child: searched
                          ? buildMultipleStoreData(
                              context, productResults, widget.serviceType)
                          : buildMultiplebuildStoreSearchHistory(
                              context, widget.products, widget.serviceType),
                    ))
            ])));
  }
}

Widget buildMultipleStoreData(
    BuildContext context, List<GProduct> products, ServiceType serviceType) {
  return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: List.generate(products.length, (index) {
          GVendor? getVendor;
          if (serviceType == ServiceType.eat) {
            getVendor = getEatVendorForProduct(products[index] as EatProduct);
          } else if (serviceType == ServiceType.shop) {
            getVendor = getShopVendorForProduct(products[index] as ShopProduct);
          } else if (serviceType == ServiceType.grocery) {
            getVendor =
                getGroceryVendorForProduct(products[index] as GroceryProduct);
          }
          return buildStoreData(context, getVendor, products, serviceType);
        }),
      ));
}

Widget buildStoreData(BuildContext context, vendor, products, serviceType) {
  return Container(
      height: 300.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        vendor.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Container(
                        height: 20.h,
                        width: 44.w,
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
                              vendor.rating != null
                                  ? vendor.rating.toString()
                                  : "",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: AppColors.grey500,
                      ),
                      Text(
                        vendor.addressShort ?? "",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.grey500,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Container(
                    height: 20.h,
                    width: 88.w,
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
                        Icon(
                          Icons.access_time_outlined,
                          size: 16.r,
                          color: AppColors.color20A39E,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '15 - 30 mins',
                          style: TextStyle(
                              color: AppColors.grey500, fontSize: 8.sp),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 20.h,
                    width: 88.w,
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
                        Icon(
                          Icons.star,
                          size: 16.r,
                          color: AppColors.color20A39E,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          // '\$0 Delivery Fee',
                          "Delivery ${twoDecItemPriceString(vendor.deliveryFee)}",
                          style: TextStyle(
                              color: AppColors.grey500, fontSize: 8.sp),
                        ),
                      ],
                    )),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 7.h),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (int i = 0; i < products.length; i++)
                  Row(children: [
                    GProductCardSearchOne(
                        product: products[i],
                        vendor: vendor,
                        serviceType: serviceType),
                    if (i < products.length - 1)
                      SizedBox(width: 10.w), // Set the desired gap width here
                  ]),
              ]),
            ),
          ),
        ],
      ));
}
