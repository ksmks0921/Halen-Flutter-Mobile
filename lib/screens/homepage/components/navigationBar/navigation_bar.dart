import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/line_indicator.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  CustomNavigationBarState createState() => CustomNavigationBarState();
}

class CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final navIndex = ref.watch(navStateProvider);
    return CustomLineIndicatorBottomNavbar(
      selectedColor: AppColors.greenColor,
      unSelectedColor: Colors.grey,
      backgroundColor: Colors.white,
      currentIndex: navIndex,
      unselectedImageSize: 20.sp,
      selectedImageSize: 20.sp,
      onTap: (index) {
        ref.read(navStateProvider.notifier).state = index;

        // pushNamedAndRemove for routes with bottom nav access, otherwise just push (rideshare)
        switch (index) {
          case 0:
            Navigator.of(context)
                .pushNamedAndRemoveUntil(homePageRoute, (route) => false);

            break;

          case 1:
            Navigator.of(context).pushNamed(messagesTabRoute);

            break;
          case 2:
            Navigator.of(context).pushNamed(ordersRoute);

            break;
          case 3:
            Navigator.of(context).pushNamed(accountRoute);
            break;
        }
      },
      enableLineIndicator: true,
      lineIndicatorWidth: 5.w,
      indicatorType: IndicatorType.top,
      // gradient: LinearGradient(
      //   colors: [Colors.pink, Colors.yellow],
      // ),
      customBottomBarItems: [
        CustomBottomBarItems(
          label: 'Home',
          useIcon: false,
          selectedImage: 'assets/images/icons/home_selected.png',
          unselectedImage: 'assets/images/icons/home_unselected.png',
        ),

        CustomBottomBarItems(
            label: 'Messages',
            useIcon: true,
            selectedIcon: Icon(
              Icons.message_outlined,
              color: AppColors.primaryColor1,
              size: 20.sp,
            ),
            unselectedIcon:
                Icon(Icons.message_outlined, color: Colors.grey, size: 20.sp)),

        // CustomBottomBarItems(
        //     label: 'Ride',
        //     selectedImage: 'assets/images/icons/ride_selected.png',
        //     unselectedImage: 'assets/images/icons/ride.png'),
        // CustomBottomBarItems(
        //   label: 'Eat',
        //   selectedImage: 'assets/images/icons/eat_selected.png',
        //   unselectedImage: 'assets/images/icons/eat.png',
        // ),
        // CustomBottomBarItems(
        //   label: 'Grocery',
        //   selectedImage: 'assets/images/icons/grocery_selected.png',
        //   unselectedImage: 'assets/images/icons/grocery.png',
        // ),
        // CustomBottomBarItems(
        //   label: 'Shop',
        //   selectedImage: 'assets/images/icons/shop_selected.png',
        //   unselectedImage: 'assets/images/icons/shop.png',
        // ),
        CustomBottomBarItems(
          label: 'Orders',
          useIcon: false,
          selectedImage: 'assets/images/icons/myorders_selected.png',
          unselectedImage: 'assets/images/icons/myorders_unselected.png',
        ),
        CustomBottomBarItems(
            label: 'My Account',
            useIcon: true,
            selectedIcon: Icon(Icons.person_outline,
                color: AppColors.primaryColor1, size: 20.sp),
            unselectedIcon:
                Icon(Icons.person_outline, color: Colors.grey, size: 20.sp)),
      ],
    );
  }
}
