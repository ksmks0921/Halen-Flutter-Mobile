import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/shop_retail/components/separator.dart';
import 'package:halen_customer_app/screens/orders/components/action_splash.dart';
import 'package:halen_customer_app/screens/orders/methods/calc_order_total.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class OrderHistoryDetailsScreen extends StatefulWidget {
  const OrderHistoryDetailsScreen({Key? key, required this.orderData})
      : super(key: key);

  final Map orderData;
  @override
  State<OrderHistoryDetailsScreen> createState() =>
      _OrderHistoryDetailsScreenState();
}

class _OrderHistoryDetailsScreenState extends State<OrderHistoryDetailsScreen> {
  int? selectedTipItemIndex;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(
              children: [
                const AccountAppBar(
                  title: "Order Details",
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(18.w, 0, 16.w, 0),
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Order #${widget.orderData["order_number"]}",
                                  style: TextStyle(
                                      fontSize: 18.w,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4.w,
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: Text(
                                  widget.orderData["service_storefront_name"],
                                  style: TextStyle(
                                      fontSize: 24.w,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 12.w,
                            ),
                            CompleteOrCanceledItemsRow(
                              orderData: widget.orderData,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: const MySeparator(),
                            ),
                            Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 12.w,
                            ),
                            Text(
                              widget.orderData["service_address"],
                              style: TextStyle(
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Text(
                                "To",
                                style: TextStyle(
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              widget.orderData["delivery_address"],
                              style: TextStyle(
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: const MySeparator()),
                            Text(
                              "Order Details",
                              style: TextStyle(
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                            OrderHistoryDetailsOrderItems(
                              orderData: widget.orderData,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: const MySeparator(),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal",
                                    style: TextStyle(
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "\$${widget.orderData["subtotal"]}",
                                    style: TextStyle(
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ]),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Delivery Fee",
                                        style: TextStyle(
                                            fontSize: 16.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "\$${widget.orderData["delivery_fee"]}",
                                        style: TextStyle(
                                            fontSize: 16.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ])),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tax",
                                    style: TextStyle(
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "\$${widget.orderData["tax"]}",
                                    style: TextStyle(
                                        fontSize: 16.w,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ]),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(children: [
                                Text(
                                  "Tip",
                                  style: TextStyle(
                                      fontSize: 18.w,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ]),
                            ),
                            Container(
                              height: 47,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: const MySeparator(),
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 12.h, bottom: 24.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                            fontSize: 16.w,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "\$${calcOrderTotalFromSlis([
                                              widget.orderData["subtotal"],
                                              widget.orderData["delivery_fee"],
                                              widget.orderData["tax"]
                                            ])}",
                                        style: TextStyle(
                                            fontSize: 16.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ])),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child:
                                  DriverDetailsLVI(orderData: widget.orderData),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: StarRatingRow(
                                  orderData: widget.orderData,
                                )),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: QualitiesRatingRow(
                                  orderData: widget.orderData,
                                )),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: const SubmitRatingButton()),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 24.h),
                                child: const BackToPreviousLink()),
                            SizedBox(
                              height: 64.h,
                            ),
                          ],
                        )))
              ],
            )));
  }
}

class BackToPreviousLink extends StatelessWidget {
  const BackToPreviousLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 28.w,
                child: Center(
                    child: Text(
                  "Back to previous page",
                  style: TextStyle(color: AppColors.primaryColor1),
                )))
          ],
        ));
  }
}

class SubmitRatingButton extends StatelessWidget {
  const SubmitRatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ActionWaitingSplash(
                            message: "Submitting review...",
                          )));
            },
            child: Container(
                height: 42.w,
                width: 88.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    border:
                        Border.all(width: 2.w, color: AppColors.primaryColor1)),
                child: Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(color: AppColors.primaryColor1),
                ))))
      ],
    );
  }
}

class QualitiesRatingRow extends StatefulWidget {
  const QualitiesRatingRow({Key? key, required this.orderData})
      : super(key: key);
  final Map orderData;
  @override
  State<QualitiesRatingRow> createState() => _QualitiesRatingRowState();
}

class _QualitiesRatingRowState extends State<QualitiesRatingRow> {
  List qualitiesLabelsList = [
    "Above & beyond",
    "Friendly",
    "Respectful",
    "On time",
    "Followed Instructions",
    "Delivered with Care",
    "Cares for Others"
  ];

  List selectedQualities = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> qualitiesWrapChildren = [];

    for (var ql in qualitiesLabelsList) {
      qualitiesWrapChildren.add(GestureDetector(
          onTap: () {
            if (!selectedQualities.contains(ql)) {
              setState(() {
                selectedQualities.add(ql);
              });
            } else {
              setState(() {
                selectedQualities.remove(ql);
              });
            }
          },
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.w, horizontal: 4.w),
                        decoration: BoxDecoration(
                            border: selectedQualities.contains(ql)
                                ? null
                                : Border.all(color: Colors.black38, width: 2.w),
                            borderRadius: BorderRadius.circular(12.w),
                            color: selectedQualities.contains(ql)
                                ? mcgpalette0[200]
                                : Colors.white),
                        child: Center(
                            child: Text(
                          ql,
                          style: TextStyle(
                              color: selectedQualities.contains(ql)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.w),
                        )))
                  ])))));
    }

    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.spaceEvenly,
      children: qualitiesWrapChildren,
    );
  }
}

class StarRatingRow extends StatefulWidget {
  const StarRatingRow({Key? key, required this.orderData}) : super(key: key);

  final Map orderData;
  @override
  State<StarRatingRow> createState() => _StarRatingRowState();
}

class _StarRatingRowState extends State<StarRatingRow> {
  int rating = 0;
  ratingTap(int ratingSelect) {
    setState(() {
      rating = ratingSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    int starsIdx = 0;

    List<Widget> starsChosen = [];

    while (starsIdx < rating) {
      int selectIdx = starsIdx;
      starsChosen.add(GestureDetector(
          onTap: () {
            ratingTap(selectIdx + 1);
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: .02.sw),
              child: Icon(
                Icons.star,
                color: Colors.yellow[800],
                size: .12.sw,
              ))));
      starsIdx += 1;
    }
    while (starsIdx < 5) {
      int selectIdx = starsIdx;
      starsChosen.add(GestureDetector(
          onTap: () {
            ratingTap(selectIdx + 1);
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: .02.sw),
              child: Icon(
                Icons.star_outline,
                color: Colors.yellow[800],
                size: .12.sw,
              ))));
      starsIdx += 1;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: starsChosen);
  }
}

class DriverDetailsLVI extends StatelessWidget {
  const DriverDetailsLVI({Key? key, required this.orderData}) : super(key: key);
  final Map orderData;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 56.w,
        height: 56.w,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Image.asset(
          orderData["driver"]["profile_img"],
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(
        width: 12.w,
      ),
      Flexible(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              orderData["driver"]["name"],
              style: TextStyle(color: Colors.black, fontSize: 20.w),
            ),
            Text(
              orderData["driver"]["car_model"],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.w,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              orderData["driver"]["drivers_license"],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.w,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              orderData["driver"]["car_license_plate"],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w300),
            )
          ],
        )
      ]))
    ]);
  }
}

class OrderHistoryDetailsOrderItems extends StatelessWidget {
  const OrderHistoryDetailsOrderItems({Key? key, required this.orderData})
      : super(key: key);
  final Map orderData;

  @override
  Widget build(BuildContext context) {
    TextStyle oiliTs = TextStyle(fontSize: 16.w, color: Colors.black);

    List<Widget> orderItemsListItems = [];
    orderData["order_items"].forEach((orderitem) {
      orderItemsListItems.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(orderitem["title"], style: oiliTs),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("x${orderitem["quantity"]}", style: oiliTs),
              SizedBox(width: 8.w),
              Text("\$${orderitem["price"]}", style: oiliTs)
            ],
          )
        ],
      ));
    });

    return Column(
      children: orderItemsListItems,
    );
  }
}

class CompleteOrCanceledItemsRow extends StatelessWidget {
  const CompleteOrCanceledItemsRow({Key? key, required this.orderData})
      : super(key: key);
  final Map orderData;

  @override
  Widget build(BuildContext context) {
    Color completeStatusColor = AppColors.defaultIconColor;
    Color cancelledStatusColor = AppColors.colorEF5B5B;

    double statusTextSize = 16.w;
    Widget statusIcon = Icon(
      Icons.check_circle_outline,
      color: completeStatusColor,
      size: statusTextSize,
    );

    Widget statusText = Text(
      "Delivered",
      style: TextStyle(color: completeStatusColor, fontSize: statusTextSize),
    );

    if (orderData["order_status_value"] == "Cancelled") {
      statusIcon = Icon(
        Icons.cancel_outlined,
        color: cancelledStatusColor,
        size: statusTextSize,
      );

      statusText = Text(
        "Cancelled",
        style: TextStyle(color: cancelledStatusColor, fontSize: statusTextSize),
      );
    }

    int orderItemCount = orderData["order_items"].length;
    String orderItemsLabel = orderItemCount > 1 ? "items" : "item";

    Widget itemsCountText = Text(
      "${orderItemCount.toString()} $orderItemsLabel",
      style: TextStyle(color: Colors.grey[600], fontSize: statusTextSize),
    );

    return Row(
      children: [
        statusIcon,
        SizedBox(
          width: 16.w,
        ),
        statusText,
        SizedBox(
          width: 16.w,
        ),
        itemsCountText
      ],
    );
  }
}
