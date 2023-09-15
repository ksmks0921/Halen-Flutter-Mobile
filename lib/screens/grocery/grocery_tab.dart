import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
// import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_appbar_profile.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_cart_bar.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_tab/grocery_tabbar.dart';
import 'package:halen_customer_app/screens/grocery/grocery.dart';
// import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
import 'package:halen_customer_app/screens/homepage/components/offer_banner.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/widgets/search_text_input.dart';
import 'package:logger/logger.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class GroceryTab extends ConsumerStatefulWidget {
  const GroceryTab({Key? key}) : super(key: key);

  @override
  ConsumerState<GroceryTab> createState() => _GroceryTabState();
}

class _GroceryTabState extends ConsumerState<GroceryTab> {
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
            products: allGroceryProducts,
            serviceType: ServiceType.grocery,
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
                        // const GroceryProfileAppBar(
                        //   name: 'Edward',
                        //   location: 'Add Address',
                        //   image: 'assets/images/illustrations/profile_image.png',
                        // ),
                        const GroceryCartBar(title: "Grocery"),
                        SearchInputLink(
                          focusNode: _searchFocusNode,
                        ),
                        const Expanded(
                          child: GroceryTabBar(
                            initialIndex: 0,
                          ),
                        ),
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
    BuildContext context, int count, String category) {
  return Column(
    children: List.generate(
        count,
        (index) =>
            buildGroceryStore(context, category, groceryStoreData[index])),
  );
}

Widget buildGroceryStore(
    BuildContext context, String category, GroceryVendor store) {
  return GestureDetector(
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
              store.image,
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
                      'Within 3 hours',
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
                  '2.1 mi',
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
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the row horizontally
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
