import 'package:flutter/material.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/screens/homepage/components/image_carousel.dart';
import 'package:halen_customer_app/screens/homepage/components/home_category_buttons.dart';
import 'package:halen_customer_app/screens/homepage/components/offer_banner.dart';
import 'package:halen_customer_app/screens/homepage/components/custom_appbar.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
import 'package:halen_customer_app/screens/homepage/components/headline.dart';
import 'package:halen_customer_app/screens/homepage/data.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:halen_customer_app/components/appBar/tab_page_appbar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
        onWillPop: () {
          if (ref.read(navStateProvider) != 0) {
            return Future.delayed(Duration.zero, () {
              return true;
            });
          } else {
            return Future.delayed(Duration.zero, () {
              return false;
            });
          }
        },
        child: SafeArea(
            child: Scaffold(
          key: const Key("home_scaffold_key"),
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.baseGreyColor,
          body: const HomeTab(),
          bottomNavigationBar: const CustomNavigationBar(),
        )));
  }
}

class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeTab> createState() => HomeTabState();
}

class HomeTabState extends ConsumerState<HomeTab> {
  @override
  Widget build(BuildContext context) {
    // prevent closing app on back button press but allow sub pages/tabs to pop
    return Column(children: [
      const HomeAppBar(
        key: Key("custom_app_bar"),
        name: 'Edward',
        // location: 'Add Address',
        image: 'assets/images/illustrations/profile_image.png',
        cartItemCount: 0,
      ),
      // const TabPageAppBar(name: "Edward"),
      Expanded(
          child: Stack(
        children: [
          ListView(children: const [
            HomeScreenImageCarousel(),
            Headline(
              headline: homeHeadline,
            ),
            CategoryButtons(items: []),
            // const CategoryBuilder(
            //   items: [],
            // ),
          ]),
          const Positioned(
              right: 0,
              bottom: 0,
              child: OfferBanner(
                image: 'assets/images/icons/discount 1.png',
              ))
        ],
      ))
    ]);
  }
}
