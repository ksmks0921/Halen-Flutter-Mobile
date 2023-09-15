import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_cart/grocery_confirm_checkout.dart';
import 'package:halen_customer_app/screens/shop_retail/components/checkout/schedule_bottom_popup.dart';
import 'package:halen_customer_app/components/appBar/help_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/models/order_model_generic.dart';
import 'package:halen_customer_app/appstate/grocery_cart_state.dart';
import 'package:halen_customer_app/screens/eat/methods.dart';

class GroceryCheckout extends ConsumerStatefulWidget {
  const GroceryCheckout({super.key});

  @override
  GroceryCheckoutState createState() => GroceryCheckoutState();
}

class GroceryCheckoutState extends ConsumerState<GroceryCheckout> {
  String deliveryTime = "";
  String instructionForDriver = "";
  int selectedTipItemIndex = 0;
  bool isScheduleShow = false;
  List<double> tips = [0.00, 1.00, 2.00, 3.00];
  List<String> pickerItems = [
    "Tomorrow, Jan 11 10 am - 11 am",
    "Tomorrow, Jan 12 10 am - 11 am",
    "Tomorrow, Jan 13 10 am - 11 am",
    // Add more items here as needed
  ];

  void _closeSortFilter() {
    setState(() {
      isScheduleShow = false;
    });
  }

  void selectScheduleTime(String selectedData) {
    _closeSortFilter();
    // setState(() {
    //   isScheduleShow = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    List<GOrder> orders = ref.watch(grocOrderProv);

    double calcDeliveryFeeForOrderRes = calcDeliveryFeeForOrder(orders);
    double calcOrderSubtotalRes = calcOrderSubtotal(orders);

    List<double> calcTips = [
      .15 * calcOrderSubtotalRes,
      .18 * calcOrderSubtotalRes,
      .20 * calcOrderSubtotalRes,
      8.88
    ];

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.baseGreyColor,
            body: Stack(children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      const HelpAppBar(
                        title: 'Checkout',
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    buildItemTopBanner(
                                        Icons.location_on_outlined,
                                        "116 Valley Greensboro Dr.",
                                        true),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 45.w,
                                        ),
                                        Text(
                                          "Reston, VA 29091",
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.color8E8E8E,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1.h,
                                      color: AppColors.grey400,
                                      // other properties and child widgets
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Column(
                                  children: [
                                    buildItemTopBanner(
                                        Icons.access_time_outlined,
                                        "Choose Delivery Time",
                                        false),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    RadioListTile(
                                      title: Text("ASAP (60-90 mins)",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: AppColors.grey500)),
                                      value: "asap",
                                      groupValue: deliveryTime,
                                      activeColor: AppColors.color20A39E,
                                      onChanged: (value) {
                                        setState(() {
                                          deliveryTime = value.toString();
                                        });
                                      },
                                      dense: true,
                                      visualDensity:
                                          const VisualDensity(vertical: -4.0),
                                    ),
                                    RadioListTile(
                                      title: Text("Schedule",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: AppColors.grey500)),
                                      value: "scheduled",
                                      groupValue: deliveryTime,
                                      activeColor: AppColors.color20A39E,
                                      onChanged: (value) {
                                        setState(() {
                                          deliveryTime = value.toString();
                                          isScheduleShow = true;
                                        });
                                      },
                                      dense: true,
                                      visualDensity:
                                          const VisualDensity(vertical: -4.0),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1.h,
                                      color: AppColors.grey400,
                                      // other properties and child widgets
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Column(
                                  children: [
                                    buildItemTopBanner(CupertinoIcons.doc_text,
                                        "Instructions for driver", false),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    RadioListTile(
                                      title: Text("Leave it at the door)",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: AppColors.grey500)),
                                      value: "leave",
                                      groupValue: instructionForDriver,
                                      activeColor: AppColors.color20A39E,
                                      onChanged: (value) {
                                        setState(() {
                                          instructionForDriver =
                                              value.toString();
                                        });
                                      },
                                      dense: true,
                                      visualDensity:
                                          const VisualDensity(vertical: -4.0),
                                    ),
                                    RadioListTile(
                                      title: Text("Hand it to me",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: AppColors.grey500)),
                                      value: "hand",
                                      groupValue: instructionForDriver,
                                      activeColor: AppColors.color20A39E,
                                      onChanged: (value) {
                                        setState(() {
                                          instructionForDriver =
                                              value.toString();
                                        });
                                      },
                                      dense: true,
                                      visualDensity:
                                          const VisualDensity(vertical: -4.0),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 73.h,
                                      padding: EdgeInsets.all(10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8
                                            .r), // Set the desired border radius
                                      ),
                                      child: TextField(
                                        maxLines: 8,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                        decoration:
                                            const InputDecoration.collapsed(
                                          hintText:
                                              "Please add any instructions for the driver.",
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1.h,
                                      color: AppColors.grey400,
                                      // other properties and child widgets
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Column(
                                  children: [
                                    buildItemTopBanner(
                                        Icons.attach_money_outlined,
                                        "Tip",
                                        false),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      height: 47.h, // Set the desired height
                                      decoration: BoxDecoration(
                                        color: Colors
                                            .grey, // Set the desired background color
                                        borderRadius: BorderRadius.circular(10
                                            .r), // Set the desired border radius
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          buildTipSelectableItem(0, "15%"),
                                          buildTipSelectableItem(1, "18%"),
                                          buildTipSelectableItem(2, "20%"),
                                          buildTipSelectableItem(3, "Custom"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Subtotal',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors.grey600),
                                              ),
                                              Text(
                                                twoDecItemPriceString(
                                                    calcOrderSubtotalRes),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 18.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Delivery Fee',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors.grey600),
                                              ),
                                              Text(
                                                twoDecItemPriceString(
                                                    calcDeliveryFeeForOrderRes),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 18.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Tip',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors.grey600),
                                              ),
                                              Text(
                                                twoDecItemPriceString(calcTips[
                                                    selectedTipItemIndex]),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 26.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total',
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors.grey600),
                                              ),
                                              Text(
                                                twoDecItemPriceString(
                                                    calcOrderSubtotalRes +
                                                        calcDeliveryFeeForOrderRes +
                                                        tips[
                                                            selectedTipItemIndex]),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1.h,
                                      color: AppColors.grey400,
                                      // other properties and child widgets
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Column(
                                  children: [
                                    buildItemTopBanner(Icons.payment_outlined,
                                        "Payment Method", true),
                                    Row(children: [
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Image.asset(
                                        'assets/images/icons/visa@2x (2).png',
                                        width: 30.w,
                                        height: 30.h,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        "****5326 (US)",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          color: AppColors.color7D7871,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 5.h, 10.w, 15.h),
                                      child: RichText(
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text:
                                              "By placing this order, you agree to Global Sedan’s ",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "Terms of Use",
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // Handle Terms of Use click here
                                                },
                                            ),
                                            const TextSpan(
                                              text:
                                                  " and acknowledge you have read the ",
                                            ),
                                            TextSpan(
                                              text: "Privacy Policy",
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // Handle Privacy Policy click here
                                                },
                                            ),
                                            const TextSpan(
                                              text:
                                                  ". By choosing “Leave at door” option, you agree to pick up your order within 30 minutes and accept full responsibility for it after it is left at the door.",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) {
                                              return GroceryConfirmCheckout(
                                                orders: orders,
                                                tipAmount: double.parse(calcTips[
                                                        selectedTipItemIndex]
                                                    .toStringAsFixed(2)),
                                              );
                                            },
                                          ));

                                          // Handle button press
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.color20A39E,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: Container(
                                          height: 48,
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "CHECKOUT",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              if (isScheduleShow)
                ScheduleBottomPopUP(
                  onCloseBottomPopUp: _closeSortFilter,
                  pickerItems: pickerItems,
                  onItemSelected: (String selectedData) {
                    selectScheduleTime(selectedData);
                  },
                )
            ])));
  }

  Widget buildTipSelectableItem(int index, String text) {
    final isSelected = index == selectedTipItemIndex;
    final backgroundColor =
        isSelected ? AppColors.color20A39E : AppColors.colorD9D9D9;
    final textColor = isSelected ? Colors.white : AppColors.color20A39E;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedTipItemIndex = index;
          });
        },
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17.sp,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItemTopBanner(IconData icon, String text, bool editable) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24.r,
          weight: 800,
          color: AppColors.color20A39E,
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 21.sp,
            color: AppColors.color20A39E,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (editable) ...[
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              size: 16,
              weight: 800,
              color: AppColors.grey500,
            ),
          ),
        ],
      ],
    );
  }
}
