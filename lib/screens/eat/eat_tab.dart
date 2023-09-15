import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_cart.dart';
// import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_profile.dart';
import 'package:halen_customer_app/screens/eat/components/eat_home/eat_category_card.dart';
import 'package:halen_customer_app/screens/eat/components/eat_home/eat_vendor_content_category.dart';
import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_top_search.dart';
import 'package:halen_customer_app/constants/utils.dart';
import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/homepage/components/offer_banner.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';

class EatTab extends ConsumerWidget {
  const EatTab({
    Key? key,
  }) : super(key: key);

  void showCartConfirmation(BuildContext context) {
    CartConfirmation.show(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String title = "";
    // String address = "";

    List<EatVendorPerCategory> eatCategoriesVendors = eatCategoryVendorsData;
    List<EatCategory> eatCategories = eatCategoriesData;

    return WillPopScope(
        onWillPop: () async {
          ref.read(navStateProvider.notifier).state = 0;
          return Future.delayed(Duration.zero, () {
            return true;
          });
        },
        child: SafeArea(
            child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.baseGreyColor,
          bottomNavigationBar: const CustomNavigationBar(),
          body: Stack(children: [
            Column(children: [
              // const EatProfileAppBar(
              //   key: Key("custom_app_bar"),
              //   name: 'Edward',
              //   location: 'Add Address',
              //   image: 'assets/images/illustrations/profile_image.png',
              // ),
              const EatCartAppBar(
                title: "Eat",
                showCartAction: true,
              ),
              const EatTopSearch(),
              SizedBox(height: 10.h),
              Flexible(
                child: Container(
                  // Replace with your desired background color
                  padding: EdgeInsets.zero, // Remove the padding
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 10.h),
                    // with header and footer
                    itemCount: eatCategoryVendorsData.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      //header
                      if (index == 0) {
                        return EatCategoryCard(categories: eatCategories);
                      }
                      if (index == eatCategoryVendorsData.length + 1) {
                        return SizedBox(
                          height: .15.sh,
                          width: 1.sw,
                        );
                      } else {
                        return EatVendorContentCategory(
                          categoryName:
                              eatCategoriesVendors[index - 1].categoryName,
                          vendors: eatCategoriesVendors[index - 1].vendors,
                        );
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10.h, // Replace with your desired gap height
                      );
                    },
                  ),
                ),
              ),
            ]),
            const Positioned(
                right: 0,
                bottom: 0,
                child: OfferBanner(
                  image: 'assets/images/icons/discount 1.png',
                ))
          ]),
        )));
  }
}
