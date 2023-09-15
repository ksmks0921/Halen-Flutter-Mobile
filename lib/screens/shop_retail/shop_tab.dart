import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/constants.dart';
import 'package:halen_customer_app/screens/homepage/components/offer_banner.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
// import 'package:halen_customer_app/screens/shop_retail/components/retail_appbar/retail_appbar_profile.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_appbar/retail_appbar.dart';
import 'package:halen_customer_app/screens/shop_retail/data.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/screens/shop_retail/retail_shops.dart';
import 'package:halen_customer_app/screens/shop_retail/retail_vendor_detail.dart';
import 'package:halen_customer_app/methods/display_data/delivery_times.dart';
import 'package:halen_customer_app/widgets/search_text_input.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';

class ShopTab extends ConsumerStatefulWidget {
  const ShopTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopTab> createState() => _ShopTabState();
}

class _ShopTabState extends ConsumerState<ShopTab> {
  final FocusNode _searchFocusNode = FocusNode();

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
            products: shopProductsData,
            serviceType: ServiceType.shop,
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          ref.read(navStateProvider.notifier).state = 0;
          return Future.delayed(Duration.zero, () {
            return true;
          });
        },
        child: SafeArea(
            child: Scaffold(
                // resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.baseGreyColor,
                bottomNavigationBar: const CustomNavigationBar(),
                body: Stack(
                  children: [
                    Column(
                      children: [
                        // const RetailProfileAppBar(
                        //   key: Key("custom_app_bar"),
                        //   name: 'Edward',
                        //   // location: 'Add Address',
                        //   image: 'assets/images/illustrations/profile_image.png',
                        // ),
                        const RetailAppBar(title: "Shop"),
                        SearchInputLink(
                          focusNode: _searchFocusNode,
                        ),
                        // const HomeScreenImageCarousel(),
                        // SizedBox(
                        //   height: 24.h,
                        // ),
                        // const Headline(
                        //   headline: 'Shop with Halen',
                        // ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.h, horizontal: 10.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Stores",
                                    style: TextStyle(
                                      color: AppColors.grey500,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      // logger.d('View all clicked!!');
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return const RetailShops();
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
                                          size: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ])),
                        Expanded(
                            child: SingleChildScrollView(
                          child: buildMultipleGroceryStores(context, ref,
                              shoppingStoreData.length, Constants.categoryShop),
                        ))
                      ],
                    ),
                    const Positioned(
                        right: 0,
                        bottom: 0,
                        child: OfferBanner(
                          image: 'assets/images/icons/discount 1.png',
                        ))
                  ],
                ))));
  }
}

Widget buildMultipleGroceryStores(
    BuildContext context, WidgetRef ref, int count, String category) {
  return Column(
    children: List.generate(
        count,
        (index) => buildGroceryStore(
            context, ref, category, shoppingStoreData[index])),
  );
}

Widget buildGroceryStore(
    BuildContext context, WidgetRef ref, String category, ShopVendor store) {
  return WillPopScope(
      onWillPop: () async {
        ref.read(navStateProvider.notifier).state = 0;
        return Future.delayed(Duration.zero, () {
          return true;
        });
      },
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return RetailVendorDetail(vendor: store);
              },
            ));
          },
          child: Container(
            height: 82.h,
            margin: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
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
                    SizedBox(
                        height: 20.h,
                        width: 88.w,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.people_outline,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.sp),
                              Text(
                                store.reviewCountStr ?? "",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: AppColors.grey400),
                              )
                            ])),
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
                          color:
                              AppColors.grey400, // Set the border color to red
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
                                color: AppColors.grey500, fontSize: 12.sp),
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
