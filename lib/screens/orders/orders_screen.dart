import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:halen_customer_app/screens/homepage/components/custom_appbar.dart';
// import 'package:halen_customer_app/components/appBar/tab_page_appbar.dart';
import 'package:halen_customer_app/screens/orders/components/rate_widget.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/orders/components/order_filter_dropdown_button.dart';
import 'package:halen_customer_app/screens/orders/components/orders_paged_listview.dart';
import 'package:halen_customer_app/screens/orders/models/order_models.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  OrdersScreenState createState() => OrdersScreenState();
}

class OrdersScreenState extends ConsumerState<OrdersScreen> {
  bool historySelected = false;
  String serviceFilterVal = "All";
  String statusFilterVal = "All";

  historySelectTap() {
    setState(() {
      historySelected = true;
      serviceFilterVal = "All";
      statusFilterVal = "All";
    });
  }

  inProgressSelectTap() {
    setState(() {
      historySelected = false;
      serviceFilterVal = "All";
      statusFilterVal = "All";
    });
  }

  serviceSelectCB(filterval) {
    setState(() {
      serviceFilterVal = filterval;
    });
  }

  statusSelectCB(filterval) {
    setState(() {
      statusFilterVal = filterval;
    });
  }

  rateTapCB() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Container(
                  color: Colors.white,
                  width: .8.sw,
                  height: .6.sh,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rate this vendor",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 24.h),
                        RateWidget(
                          starCount: 0,
                          starSpacing: 24.w,
                          alignment: MainAxisAlignment.center,
                        )
                      ])));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.lightBgColor,
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(children: [
              // for no bottom nav
              // const AccountAppBar(
              //   title: "Orders",
              // ),
              const HomeAppBar(
                name: 'Edward',
                // location: 'Add Address',
                image: 'assets/images/illustrations/profile_image.png',
                cartItemCount: 0,
              ),
              // const TabPageAppBar(name: "Edward"),
              Row(children: [
                GestureDetector(
                    onTap: () {
                      inProgressSelectTap();
                    },
                    child: Container(
                        height: 51.h,
                        width: .5.sw,
                        // padding: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.primaryColor2,
                                    width: historySelected ? 0 : 5.5.h))),
                        child: Center(
                            child: Text(
                          "In Progress",
                          style: TextStyle(
                              fontSize: 24.h, color: AppColors.primaryColor1),
                        )))),
                GestureDetector(
                    onTap: () {
                      historySelectTap();
                    },
                    child: Container(
                        height: 51.h,
                        width: .5.sw,
                        // padding: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.primaryColor2,
                                    width: historySelected ? 5.5.h : 0))),
                        child: Center(
                            child: Text(
                          "History",
                          style: TextStyle(
                              fontSize: 24.h, color: AppColors.primaryColor1),
                        ))))
              ]),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OrderFilterDropDown(
                          key: const ValueKey("Service"),
                          value: serviceFilterVal,
                          items: const [
                            "Ride",
                            "Eat",
                            "Shop",
                            "Grocery",
                            "All"
                          ],
                          label: "Service",
                          selectCB: serviceSelectCB,
                        ),
                        historySelected
                            ? OrderFilterDropDown(
                                key: const ValueKey("StatusHistory"),
                                value: statusFilterVal,
                                items: const ["Complete", "Cancelled", "All"],
                                label: "Status",
                                selectCB: statusSelectCB,
                              )
                            : OrderFilterDropDown(
                                key: const ValueKey("Status"),
                                value: statusFilterVal,
                                items: const [
                                  "Picked Up",
                                  "On the way",
                                  "Placed",
                                  "All"
                                ],
                                label: "Status",
                                selectCB: statusSelectCB,
                              ),
                      ])),
              Expanded(
                  child: Stack(children: [
                Visibility(
                    maintainState: true,
                    visible: historySelected,
                    child: OrderPagedLV(
                      orderStatus: OrderStatus.complete,
                      serviceFilterVal: serviceFilterVal,
                      statusFilterVal: statusFilterVal,
                      rateTapCB: rateTapCB,
                    )),
                Visibility(
                    maintainState: true,
                    visible: !historySelected,
                    child: OrderPagedLV(
                        orderStatus: OrderStatus.inProgress,
                        serviceFilterVal: serviceFilterVal,
                        statusFilterVal: statusFilterVal))
              ]))
            ])));
  }
}
