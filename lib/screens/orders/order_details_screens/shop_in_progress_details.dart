import 'package:flutter/material.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/screens/shop_retail/components/separator.dart';
import 'package:halen_customer_app/screens/orders/components/order_lvi_icon.dart';
import 'package:halen_customer_app/screens/orders/components/track_button.dart';
import 'package:halen_customer_app/screens/orders/components/action_splash.dart';
import 'package:halen_customer_app/screens/orders/return_cancel_sheets/return_cancel_reason_bottom_sheet.dart';
import 'package:halen_customer_app/screens/orders/return_cancel_sheets/return_shop_bottom_sheet.dart';
import 'package:halen_customer_app/screens/orders/components/contact_us_button.dart';
import 'package:halen_customer_app/screens/orders/methods/calc_order_total.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class ShopInProgressDetailsScreen extends StatefulWidget {
  const ShopInProgressDetailsScreen({Key? key, required this.orderData})
      : super(key: key);

  final Map orderData;
  @override
  State<ShopInProgressDetailsScreen> createState() =>
      _ShopInProgressDetailsScreenState();
}

class _ShopInProgressDetailsScreenState
    extends State<ShopInProgressDetailsScreen> {
  List<Widget> orderItems = [];

  addRemoveItemCB(index, action) {
    if (action == "quantitySubtract") {
      int newquant = int.parse(orderData["order_items"][index]["quantity"]);
      newquant > 0 ? newquant -= 1 : 0;
      setState(() {
        orderData["order_items"][index]["quantity"] = newquant.toString();
      });
    }
    if (action == "quantityAdd") {
      int newquant = int.parse(orderData["order_items"][index]["quantity"]);
      newquant += 1;
      setState(() {
        orderData["order_items"][index]["quantity"] = newquant.toString();
      });
    }
    if (action == "itemRemove") {
      setState(() {
        orderData["order_items"].removeAt(index);
      });
    }
  }

  late Map orderData;
  @override
  void initState() {
    orderData = widget.orderData;
    // int od_idx = 0;
    // widget.orderData["order_items"].forEach((Map item){
    //   orderItems.add(OrderDetailsOrderItem(orderData: orderData, index: od_idx, addRemoveItemCB: addRemoveItemCB,));
    //   od_idx += 1;
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> odList =
        List.generate(orderData["order_items"].length, (int odIdx) {
      return OrderDetailsOrderItem(
        orderData: orderData,
        index: odIdx,
        addRemoveItemCB: addRemoveItemCB,
      );
    });

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.lightBgColor,
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(
              children: [
                const AccountAppBar(title: "Order Details"),
                Expanded(
                    child: ListView(children: [
                  OrderDetailsOrderHeader(
                    orderData: widget.orderData,
                  ),
                  ...odList,
                  OrderDetailsOrderFooter(orderData: widget.orderData)
                ]))
              ],
            )));
  }
}

class OrderDetailsOrderItem extends StatelessWidget {
  const OrderDetailsOrderItem(
      {Key? key,
      required this.orderData,
      required this.index,
      required this.addRemoveItemCB})
      : super(key: key);

  final Map orderData;
  final int index;
  final Function addRemoveItemCB;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0.w),
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.w, color: Colors.black26))),
            child: Material(
                elevation: 8.w,
                child: Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(.03.sw),
                      color: Colors.white,
                    ),
                    width: .9.sw,
                    height: .4.sw,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: .16.sw,
                              height: .28.sw,
                              padding: EdgeInsets.only(left: 8.w),
                              child: Image.asset(
                                orderData["order_items"][index]["img_path"],
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            orderData["order_items"][index]
                                                ["title"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.w,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Text(
                                            orderData["order_items"][index]
                                                ["subtitle"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.w,
                                                fontWeight: FontWeight.w300)),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        Text(
                                            "\$${orderData["order_items"][index]["price"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.w,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        orderData["is_cancellable"] == true
                                            ? Row(children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      addRemoveItemCB(index,
                                                          "quantitySubtract");
                                                    },
                                                    child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.w),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color: Colors.black,
                                                        ))),
                                                Text(
                                                    orderData["order_items"]
                                                        [index]["quantity"],
                                                    style: w400_16Poppins()),
                                                GestureDetector(
                                                    onTap: () {
                                                      addRemoveItemCB(
                                                          index, "quantityAdd");
                                                    },
                                                    child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.w),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: Colors.black,
                                                        ))),
                                                Flexible(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              addRemoveItemCB(
                                                                  index,
                                                                  "itemRemove");
                                                            },
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          16.w),
                                                              child: Text(
                                                                  "Remove",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16.w,
                                                                    color: Colors
                                                                        .black,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                  )),
                                                            ))
                                                      ]),
                                                )
                                              ])
                                            : Icon(
                                                Icons.info,
                                                size: 18.w,
                                                color: Colors.yellow[800],
                                              )
                                      ]))),
                        ],
                      )
                    ])))));
  }
}

class OrderDetailsOrderFooter extends StatelessWidget {
  const OrderDetailsOrderFooter({Key? key, required this.orderData})
      : super(key: key);

  final Map orderData;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 18.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.w),
                decoration:
                    orderData["is_returnable"] || orderData["is_cancellable"]
                        ? BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(.03.sw),
                          )
                        : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(.03.sw),
                                topLeft: Radius.circular(.03.sw)),
                          ),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 12.w, 8.w, 0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.grey[600]),
                            ),
                            Text(
                              '\$${orderData["subtotal"]}',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Fee',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.grey[600]),
                            ),
                            Text(
                              '\$${orderData["delivery_fee"]}',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.grey[600]),
                            ),
                            Text(
                              '\$${orderData["tax"]}',
                              style: TextStyle(
                                  fontSize: 16.w, color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        const MySeparator(color: Colors.grey),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 17.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "\$${calcOrderTotalFromSlis([
                                    orderData["subtotal"],
                                    orderData["delivery_fee"],
                                    orderData["tax"]
                                  ])}",
                              style: TextStyle(
                                fontSize: 16.w,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    )),
              )),
          !orderData["is_returnable"] && !orderData["is_cancellable"]
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(.03.sw),
                            bottomLeft: Radius.circular(.03.sw)),
                      ),
                      height: 56.w,
                      child: Center(
                          child: Text(
                        "This order cannot be returned as it has passed the due date",
                        style: TextStyle(color: Colors.black, fontSize: 11.w),
                      ))))
              : Container(),
          // Container(
          //   height: .18.sw,
          //     decoration:BoxDecoration(
          //         color: Colors.blueGrey[100],
          //         borderRadius: BorderRadius.only(
          //             bottomLeft: Radius.circular(.03.sw),
          //             bottomRight: Radius.circular(.03.sw))),
          //
          //     child:Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         orderData["order_status_value"] == "Placed"?
          //         GestureDetector(
          //             onTap:(){
          //               showModalBottomSheetFloatClose(context,CancelReasonBottomSheetContent());
          //             },
          //             child:Container(
          //               color: Colors.red,
          //                 width: .28.sw,
          //                 height: 24.w,
          //                 child: Center(child:Text("Cancel",style: TextStyle(color: Colors.white),)))):
          //         Container(),
          //
          //       ],)
          // ),
          Padding(
              padding: EdgeInsets.all(16.w),
              child: Container(
                  color: AppColors.lightBgColor,
                  height: .3.sh,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(24.w),
                          child: Row(children: [
                            Text(
                              "Have an issue?",
                              style: TextStyle(
                                  fontSize: 18.w, color: Colors.black),
                            ),
                            SizedBox(width: 12.w),
                            const ContactButton()
                          ]))
                    ],
                  ))),

          Container(
              child: orderData["is_cancellable"] == true ||
                      orderData["is_returnable"] == true
                  ? Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Row(children: [
                        Flexible(
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 24.w),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          cancelConfirmSubmit() {
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ActionWaitingSplash(
                                                          message:
                                                              "Cancelling Order...",
                                                        )));
                                          }

                                          orderData["is_cancellable"] == true
                                              ? showModalBottomSheetFloatClose(
                                                  context,
                                                  ReturnCancelReasonBottomSheetContent(
                                                    reasonContinueCB:
                                                        cancelConfirmSubmit,
                                                  ))
                                              : orderData["is_returnable"] ==
                                                      true
                                                  ? showModalBottomSheetFloatClose(
                                                      context,
                                                      const ReturnShopBottomSheet())
                                                  : Container();
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor1,
                                              borderRadius:
                                                  BorderRadius.circular(.03.sw),
                                            ),
                                            width: .88.sw,
                                            height: .125.sw,
                                            child: Center(
                                                child: Text(
                                              orderData["is_cancellable"] ==
                                                      true
                                                  ? "Cancel"
                                                  : orderData["is_returnable"] ==
                                                          true
                                                      ? "Return"
                                                      : "",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ))))
                                  ],
                                )))
                      ])
                    ])
                  : Container()),
        ]);
  }
}

class OrderDetailsOrderHeader extends StatelessWidget {
  const OrderDetailsOrderHeader({
    Key? key,
    required this.orderData,
  }) : super(key: key);

  final Map orderData;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(8.w, 12.w, 8.w, 0.w),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(.03.sw),
                topRight: Radius.circular(.03.sw)),
            child: Material(
                elevation: 8.w,
                child: Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom:
                              BorderSide(width: 1.w, color: Colors.black26)),
                    ),
                    width: .9.sw,
                    height: .4.sw,
                    child: Column(children: [
                      Row(
                        children: [
                          OrderLVIIcon(orderData: orderData, size: 28.w),
                          Expanded(
                              child: Center(
                                  child: Text(orderData["service_date"],
                                      style: w400_16Avenir()))),
                          SizedBox(
                            width: .15.sw,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: .08.sw,
                              child: Image.asset(
                                orderData["service_img_primary"],
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                Text(
                                  orderData["service_storefront_name"],
                                  style: w400_17Avenir(),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 13,
                                      ),
                                      Text(orderData["service_address"],
                                          style: w300_13Poppins())
                                    ]),
                              ])),
                          Column(
                            children: [
                              Text(orderData["order_status_type"],
                                  style:
                                      TextStyle(color: AppColors.primaryColor)),
                              Text(orderData["order_status_value"],
                                  style:
                                      TextStyle(color: AppColors.primaryColor)),
                              SizedBox(height: 16.w),
                              TrackButton(orderData: orderData)
                            ],
                          ),
                        ],
                      )
                    ])))));
  }
}
