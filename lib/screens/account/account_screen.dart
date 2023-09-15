import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/style.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
// import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
// import 'package:halen_customer_app/components/appBar/tab_page_appbar.dart';
import 'package:halen_customer_app/screens/homepage/components/custom_appbar.dart';
import 'package:halen_customer_app/screens/orders/orders_screen.dart';
import 'package:halen_customer_app/methods/logout.dart';
import 'profile_settings_page.dart';
import 'addresses_edit_page.dart';
import 'account_notifications_page.dart';
import '../add_payment/payment_methods_page.dart';
import 'stub_route.dart';
import 'data.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends ConsumerState<AccountScreen> {
  List<String> alviLabels = [
    "Profile Setting",
    "Addresses",
    "Notifications",
    "My Orders",
    "Payment & Wallet",
    "Refer and Earn",
    "Privacy Policy",
    "Terms and Conditions",
    "Help"
  ];

  List<IconData> alviIcons = [
    Icons.person_outline,
    Icons.location_on_outlined,
    Icons.notifications_none,
    Icons.keyboard_hide_sharp,
    Icons.wallet_outlined,
    Icons.attach_money,
    Icons.privacy_tip_outlined,
    Icons.description_outlined,
    Icons.chat_bubble_outline
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // put here for now for hot reload
    List<Widget> alviRoutes = [
      const ProfileSettingsPage(),
      const AddressesEditPage(),
      const AccountNotificationsPage(),
      const OrdersScreen(),
      const PaymentMethodsPage(),
      const AccountStubRoute(title: "Refer and Earn"),
      const AccountStubRoute(title: "Privacy Policy"),
      const AccountStubRoute(title: "Terms and Conditions"),
      const AccountStubRoute(title: "Help")
    ];

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.baseGreyColor,
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(
              children: [
                const HomeAppBar(
                  name: 'Edward',
                  // location: 'Add Address',
                  image: 'assets/images/illustrations/profile_image.png',
                  cartItemCount: 0,
                ),
                // const TabPageAppBar(name: "Edward"),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15.w, 15.h, 0, 0),
                    child: const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'My Account',
                          style: Style.textStyleheade1black,
                        ),
                      ],
                    )),
                Expanded(
                    child: ListView.builder(
                        itemCount: alviRoutes.length + 1,
                        itemBuilder: (context, index) {
                          if (index < alviRoutes.length) {
                            return AccountLVI(
                                iconData: alviIcons[index],
                                label: alviLabels[index],
                                pushRoute: alviRoutes[index],
                                badge: alviBadges[index]);
                          } else {
                            return Container(
                                padding: EdgeInsets.symmetric(vertical: 88.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          logOut(context);
                                        },
                                        child: Text(
                                          "Log Out",
                                          style: TextStyle(
                                              color: AppColors.greenColor,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500),
                                        ))
                                  ],
                                ));
                          }
                        })),
              ],
            )));
  }
}

class AccountLVI extends ConsumerWidget {
  const AccountLVI(
      {Key? key,
      required this.iconData,
      required this.label,
      required this.pushRoute,
      this.badge})
      : super(key: key);

  final IconData iconData;
  final String label;
  final Widget pushRoute;
  final Widget? badge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    createOnPressed(BuildContext context, Widget route) {
      if (label == "My Orders") {
        ref.read(navStateProvider.notifier).state = 2;
        Navigator.of(context)
            .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
        Navigator.of(context).pushNamed(ordersRoute);
      } else {
        MaterialPageRoute<void> materialRoute =
            MaterialPageRoute<void>(builder: (context) => route);
        Navigator.push(context, materialRoute);
      }
    }

    return InkWell(
        onTap: () {
          createOnPressed(context, pushRoute);
        },
        child: SizedBox(
            width: 1.sw,
            height: 72.h,
            child: Center(
                child: SizedBox(
                    width: 350.w,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 12.w, 0, 0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 52.w,
                              height: 52.w,
                              child: Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12.w),
                                    child: Container(
                                        width: 48.w,
                                        height: 48.w,
                                        color: AppColors.greenColor,
                                        child: Icon(
                                          iconData,
                                          color: Colors.white,
                                        ))),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: badge ?? Container())
                              ])),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 16.w),
                                      child: Text(
                                        label,
                                        style: w400_16Avenir(),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(right: 16.w),
                                      child:
                                          const Icon(Icons.arrow_forward_ios))
                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                    )))));
  }
}

class AccountLVIBadge extends StatelessWidget {
  const AccountLVIBadge({Key? key, required this.badgeText}) : super(key: key);
  final String badgeText;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 14.w,
        width: 14.w,
        decoration:
            const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: Center(
            child: Text(badgeText,
                style: TextStyle(color: Colors.white, fontSize: 9.w))));
  }
}
