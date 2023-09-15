import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/appstate/eat_cart_state.dart';
import 'package:halen_customer_app/components/checkout/go_to_category_buttons.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/screens/eat/components/etc/dashed_separator.dart';
import 'package:halen_customer_app/screens/orders/components/track_button.dart';
// import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_cart.dart';
import 'package:halen_customer_app/components/appBar/help_appbar.dart';
import 'package:halen_customer_app/screens/eat/components/eat_cart/eat_cart_product.dart';
import 'package:halen_customer_app/screens/eat/methods.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/orders/data.dart';

class EatConfirmCheckout extends ConsumerWidget {
  const EatConfirmCheckout({
    Key? key,
    required this.tipAmount,
  }) : super(key: key);

  final double tipAmount;

  navigateAwayPress(BuildContext context, WidgetRef ref, String dest) {
    if (dest == "home") {
      ref.read(navStateProvider.notifier).state = 0;
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
    }
    if (dest == "track") {
      ref.read(navStateProvider.notifier).state = 0;
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
      pushTrackRouteForOrder(context, ordersInProgressData[0]);
    }
    ref.read(eatOrderProv.notifier).clearCart();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<EatOrder> sEatOrder = ref.watch(eatOrderProv);

    double calcDeliveryFeeForOrderRes = calcDeliveryFeeForOrder(sEatOrder);
    double calcOrderSubtotalRes = calcOrderSubtotal(sEatOrder);

    List<Widget> builtConfirmVendorItems = [];
    for (EatOrder eo in sEatOrder) {
      builtConfirmVendorItems.add(CheckoutConfirmVendorItemsList(
        orderData: eo,
      ));
    }

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.baseGreyColor,
            body: Column(
              children: [
                // const EatCartAppBar(
                //   title: "Order Placed",
                //   showCartAction: false,
                // ),
                const HelpAppBar(title: "Order Placed"),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Order Confirmation",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.color3B3551,
                                fontWeight: FontWeight.w700),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 1,
                                margin:
                                    const EdgeInsets.fromLTRB(30, 50, 30, 50),
                                color: AppColors.grey300,
                              ),
                              Positioned(
                                top: 20,
                                left: 0,
                                right: 0,
                                bottom: 20,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_dining_outlined,
                                      size: 24,
                                      color: AppColors.color20A39E,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Order Summary",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.color3B3551),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle the onTap event here
                                        // Add the logic for downloading the receipt
                                      },
                                      child: Text(
                                        'Download Receipt',
                                        style: TextStyle(
                                          color: AppColors.primaryColor1,
                                          fontSize: 11,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      size: 24,
                                      color: AppColors.color20A39E,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      sEatOrder.isNotEmpty
                                          ? sEatOrder[0].orderData.date
                                          : "",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.color3B3551),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Row(children: [
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    sEatOrder.isNotEmpty
                                        ? "ID: ${sEatOrder[0].orderData.id}"
                                        : "",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.color3B3551),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 40,
                                ),
                                ...builtConfirmVendorItems,
                                Container(
                                  height: 222,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(11),
                                  ),
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
                                                fontSize: 14,
                                                color: AppColors.grey600),
                                          ),
                                          Text(
                                            twoDecItemPriceString(
                                                calcOrderSubtotalRes),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Delivery Fee',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.grey600),
                                          ),
                                          Text(
                                            twoDecItemPriceString(
                                                calcDeliveryFeeForOrderRes),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Tip',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.grey600),
                                          ),
                                          Text(
                                            twoDecItemPriceString(tipAmount),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 26),
                                      const DashedSeparator(color: Colors.grey),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.grey600),
                                          ),
                                          Text(
                                            twoDecItemPriceString(
                                                calcOrderSubtotalRes +
                                                    calcDeliveryFeeForOrderRes +
                                                    tipAmount),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.color20A39E,
                                    foregroundColor: Colors.white,
                                    fixedSize: const Size(103, 27),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  onPressed: () {
                                    navigateAwayPress(context, ref, "track");
                                  },
                                  child: const Text(
                                    "TRACK",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Continue Shopping",
                            style: TextStyle(
                                color: AppColors.color20A39E,
                                fontSize: 21,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          CheckoutGoToCategoryButtons(
                            clearCartCB: navigateAwayPress,
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: ElevatedButton(
                    onPressed: () {
                      navigateAwayPress(context, ref, "home");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.color20A39E,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "HOME",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

class CheckoutConfirmVendorItemsList extends StatelessWidget {
  const CheckoutConfirmVendorItemsList({super.key, required this.orderData});

  final EatOrder orderData;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: AppColors.color134B97,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  orderData.vendor.image,
                  width: 23,
                  height: 31,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderData.vendor.name,
                    style:
                        TextStyle(color: AppColors.color7D7871, fontSize: 14.h),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 10,
                        color: AppColors.color7D7871,
                      ),
                      Text(
                        orderData.vendor.addressShort!,
                        style: TextStyle(
                            color: AppColors.color7D7871, fontSize: 13.h),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: AppColors.grey300,
          ),
          buildMultipleProductConfirms(context, orderData),
        ]);
  }

  Widget buildMultipleProductConfirms(BuildContext context, EatOrder eo) {
    return Column(
      children: List.generate(
          eo.items.length,
          (index) =>
              buildProductConfirm(context, eo.items[index] as EatProduct)),
    );
  }

  Widget buildProductConfirm(BuildContext context, EatProduct ep) {
    List<Widget> buildCustomizationsEntryItems = [];
    if (ep.customizations != null) {
      for (EatProductCustomization czn in ep.customizations!) {
        buildCustomizationsEntryItems
            .add(CustomizationCartProductEntry(customization: czn));
      }
    }

    return Padding(
        padding: EdgeInsets.only(left: 10.w, top: 10.w),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    child: Image.asset(
                      ep.imageUrl,
                      width: .2.sw,
                      height: .24.sw,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(
                            ep.productName,
                            style: TextStyle(
                                fontSize: 16.h, color: AppColors.color333836),
                          )),
                          Text(twoDecItemPriceString(ep.price))
                        ]),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      ep.sizes![ep.selectedSize!],
                      style: TextStyle(
                          fontSize: 14.h, color: AppColors.color333836),
                    ),
                    ...buildCustomizationsEntryItems,
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                        width: .5.sw,
                        child: Column(children: [
                          Text(
                            ep.ingredients!,
                            style: TextStyle(
                                fontSize: 12.h, color: AppColors.color8E8E8E),
                          )
                        ])),
                    const SizedBox(height: 6),
                    Text(
                      twoDecItemPriceString(ep.price),
                      style: TextStyle(
                          fontSize: 12.h, color: AppColors.color333836),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: 16.h,
                      height: 16.h,
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor1,
                        radius: 8.h,
                        child: Text(
                          (ep.quantity != null) ? ep.quantity.toString() : "1",
                          style: TextStyle(
                            color: AppColors.bgdDefTextColor,
                            fontSize: 12.h,
                          ),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: AppColors.grey300,
              // other properties and child widgets
            )
          ],
        ));
  }
}
