import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/retail_cart_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/utils.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/screens/shop_retail/components/product_detail/product_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/shop_retail/methods/shop_product_data_requests.dart';

class RetailProductCard extends ConsumerStatefulWidget {
  const RetailProductCard(
      {super.key, required this.product, required this.vendor});

  final ShopProduct product;
  final ShopVendor vendor;

  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends ConsumerState<RetailProductCard> {
  void addToCart() {
    widget.product.quantity = 1;
    ref.read(shopOrderProv.notifier).addItemToOrder(
        widget.product.copyWith(), getShopVendorForProduct(widget.product));
    CartConfirmation.show(context);
  }

  @override
  Widget build(BuildContext context) {
    List<ShopOrder> lso = ref.watch(shopOrderProv);

    // bool addedToCart = ref.watch(shopOrderProv.notifier).itemIsAddedToCart(widget.product.id);
    bool addedToCart = false;
    for (ShopOrder order in lso) {
      List<ShopProduct> prodList = order.items.cast<ShopProduct>();
      for (ShopProduct item in prodList) {
        if (item.id == widget.product.id) {
          addedToCart = true;
        }
      }
    }

    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return RetailProductDetail(
                productId: widget.product.id,
                product: widget.product,
                vendor: widget.vendor,
              );
            },
          ));
          // Handle the click event
          // Navigate to product details or perform any other action
        },
        child: Container(
            width: .38.sw,
            // height: 421.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(.02.sw),
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(top: 0),
                          width: double.infinity,
                          height: 88.h,
                          child: Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.product.imageUrl),
                                  fit: BoxFit.fitHeight,
                                ),
                              )),
                              Positioned(
                                  top: 5.h,
                                  right: 3.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(2.r),
                                    child: Container(
                                      width: 44.w,
                                      height: 14.h,
                                      color: AppColors.greenColor,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 10.h,
                                          ),
                                          SizedBox(width: 2.w),
                                          Text(
                                            widget.product.rating.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ))),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Text(
                              twoDecItemPriceString(widget.product.price),
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              widget.product.markPrice != null
                                  ? '\$${widget.product.markPrice}'
                                  : "", // discount value
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        // const Spacer(),
                        GestureDetector(
                            onTap: () {
                              // card on tap was overflowing geting called here for some reason this seems to help
                            },
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                      child: Column(children: [
                                    Text(
                                      widget.product.productName,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.sp),
                                    ),
                                    // const Spacer(),

                                    // Row(
                                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //     children:[
                                    !addedToCart
                                        ? Text(
                                            widget.product.desc,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 9.sp,
                                                overflow: TextOverflow.clip),
                                          )
                                        : Container(),
                                  ])),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Flex(direction: Axis.vertical, children: [
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          addedToCart
                                              ? Container()
                                              : GestureDetector(
                                                  onTap: () {
                                                    addToCart();
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.r),
                                                    child: Container(
                                                        width: 1.sw > 700
                                                            ? 51.h
                                                            : 40.h,
                                                        height: 1.sw > 700
                                                            ? 36.h
                                                            : 28.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            1.sw > 700
                                                                ? 51.h / 2
                                                                : 40.h / 2,
                                                          ),
                                                          // shape: BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons
                                                              .add_shopping_cart_outlined,
                                                          size: 14.h,
                                                          color: Colors.white,
                                                        )),
                                                  )),
                                        ])
                                  ])
                                ])),

                        Visibility(
                            visible: addedToCart,
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text("Added to cart")])))

                        /// issue with adding size/ color
                        // Visibility(
                        //     visible: addedToCart,
                        //     child: Container(
                        //       margin: EdgeInsets.symmetric(vertical: 10.h),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           GestureDetector(
                        //             onTap: () {
                        //               if (widget.product.quantity != null &&
                        //                   widget.product.quantity! > 1) {
                        //                 ref
                        //                     .watch(shopOrderProv.notifier)
                        //                     .updateOrderItemQuantityById(
                        //                         widget.product.id,
                        //                         widget.product.quantity! - 1);
                        //               } else {
                        //                 widget.product.quantity = 0;
                        //                 ref
                        //                     .watch(shopOrderProv.notifier)
                        //                     .updateOrderItemQuantityById(
                        //                         widget.product.id, 0);
                        //                 setState(() {
                        //                   addedToCart = false;
                        //                 });
                        //               }
                        //             },
                        //             child: Container(
                        //               width: 22.h,
                        //               height: 22.h,
                        //               decoration: const BoxDecoration(
                        //                 color: Colors.yellow,
                        //                 shape: BoxShape.circle,
                        //               ),
                        //               child: Icon(
                        //                 Icons.remove,
                        //                 color: Colors.white,
                        //                 size: 16.h,
                        //               ),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 10.h,
                        //           ),
                        //           Text(
                        //             widget.product.quantity.toString(),
                        //             style: TextStyle(
                        //               fontSize: 14.sp,
                        //               color: AppColors.color20A39E,
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             width: 10.w,
                        //           ),
                        //           GestureDetector(
                        //             onTap: () {
                        //               ref
                        //                   .watch(shopOrderProv.notifier)
                        //                   .updateOrderItemQuantityById(
                        //                       widget.product.id,
                        //                       widget.product.quantity! + 1);
                        //             },
                        //             child: Container(
                        //               width: 22.h,
                        //               height: 22.h,
                        //               decoration: const BoxDecoration(
                        //                 color: Colors.yellow,
                        //                 shape: BoxShape.circle,
                        //               ),
                        //               child: Icon(
                        //                 Icons.add,
                        //                 color: Colors.white,
                        //                 size: 16.h,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     )),
                        //           Visibility(
                        //             visible: !addedToCart,
                        //             child: SizedBox(
                        //               height: 32.h,
                        //               width: double.infinity,
                        //               child:
                        //               Row(children: [
                        //               ElevatedButton(
                        //                 onPressed: addToCart,
                        //                 style: ElevatedButton.styleFrom(
                        //                   backgroundColor: AppColors.greenColor,
                        //                   shape: RoundedRectangleBorder(
                        //                     borderRadius: BorderRadius.circular(6.r),
                        //                   ),
                        //                   minimumSize: Size.fromHeight(18.h),
                        //                 ),
                        //                 child: Text(
                        //                   'Add',
                        //                   style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontSize: 14.sp,
                        //                   ),
                        //                 ),
                        //               ),
                        //
                        //           ]),
                        // ))
                      ])
                ])));
  }
}
