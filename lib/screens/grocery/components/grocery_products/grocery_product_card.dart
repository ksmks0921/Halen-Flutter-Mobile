import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/utils.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_product_detail.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/grocery_cart_state.dart';
import 'package:halen_customer_app/screens/grocery/methods/grocery_product_data_requests.dart';

class GroceryProductCard extends ConsumerStatefulWidget {
  const GroceryProductCard(
      {super.key, required this.product, required this.vendor});

  final GroceryProduct product;
  final GroceryVendor vendor;

  @override
  GroceryProductCardState createState() => GroceryProductCardState();
}

class GroceryProductCardState extends ConsumerState<GroceryProductCard> {
  void addToCart() {
    setState(() {
      widget.product.quantity = 1;
    });
    ref.read(grocOrderProv.notifier).addItemToOrder(
        widget.product.copyWith(), getGroceryVendorForProduct(widget.product));
    CartConfirmation.show(context);
  }

  @override
  Widget build(BuildContext context) {
    List<GroceryOrder> gso = ref.watch(grocOrderProv);

    // bool addedToCart = ref.watch(shopOrderProv.notifier).itemIsAddedToCart(widget.product.id);
    bool addedToCart = false;
    for (GroceryOrder order in gso) {
      List<GroceryProduct> prodList = order.items.cast<GroceryProduct>();
      for (GroceryProduct item in prodList) {
        if (item.id == widget.product.id) {
          addedToCart = true;
          widget.product.quantity = item.quantity;
        }
      }
    }

    return Container(
      width: 156.w,
      // height: 2211.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(.02.sw),
      ),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return GroceryProductDetail(
                      // productId: widget.product.id,
                      product: widget.product,
                      vendor: widget.vendor,
                    );
                  },
                ));
              },
              child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 0),
                        width: double.infinity,
                        height: 105.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.product.imageUrl),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 5.h,
                                right: 3.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2.r),
                                  child: Container(
                                    // width: 26.w,
                                    // height: 12.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.w),
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
                                          '4.8',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        )),
                    Row(
                      children: [
                        Text(
                          '\$${widget.product.price}',
                          style: TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(
                            width: 5.w), // Add some spacing between the texts
                        Text(
                          '\$${widget.product.markPrice}', // Replace with the actual discount price value
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 28.h,
                        child: Text(
                          widget.product.productName,
                          style: TextStyle(color: Colors.black, fontSize: 12.h),
                          // overflow: TextOverflow.ellipsis,
                        )),
                  ])),

          // Text(
          //   widget.product.desc,
          //   style: TextStyle(color: Colors.grey, fontSize: 9.sp),
          // ),
          const Spacer(),
          Visibility(
              visible: addedToCart,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.product.quantity != null &&
                            widget.product.quantity! > 1) {
                          ref
                              .read(grocOrderProv.notifier)
                              .updateOrderItemQuantityById(widget.product.id,
                                  widget.product.quantity! - 1);
                          widget.product.quantity =
                              widget.product.quantity! - 1;
                        } else {
                          widget.product.quantity = 0;
                          ref
                              .read(grocOrderProv.notifier)
                              .updateOrderItemQuantityById(
                                  widget.product.id, 0);
                          setState(() {
                            addedToCart = false;
                          });
                        }
                      },
                      child: Container(
                        width: 24.h,
                        height: 24.h,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(4.h)
                            // shape: BoxShape.circle,
                            ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.product.quantity.toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.color20A39E,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(grocOrderProv.notifier)
                            .updateOrderItemQuantityById(widget.product.id,
                                widget.product.quantity! + 1);
                        widget.product.quantity = widget.product.quantity! + 1;
                      },
                      child: Container(
                        width: 24.h,
                        height: 24.h,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(4.h)),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Visibility(
            visible: !addedToCart,
            child: SizedBox(
              height: 32.h,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: addToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  minimumSize: Size.fromHeight(18.h),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
