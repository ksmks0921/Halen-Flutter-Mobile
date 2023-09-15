import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/grocery_cart_state.dart';
import 'package:halen_customer_app/appstate/retail_cart_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/screens/cart_general/quantity_edit_buttons.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/models/vendor_model_generic.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_product_detail.dart';
import 'package:halen_customer_app/screens/shop_retail/data.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/screens/shop_retail/components/product_detail/product_detail.dart';

class CartProduct extends ConsumerStatefulWidget {
  const CartProduct(
      {super.key,
      required this.serviceType,
      required this.product,
      required this.vendor,
      required this.orderIndex,
      required this.orderItemIndex});

  final ServiceType serviceType;
  final GProduct product;
  final GVendor vendor;
  final int orderIndex;
  final int orderItemIndex;

  @override
  CartProductState createState() => CartProductState();
}

class CartProductState extends ConsumerState<CartProduct> {
  @override
  void initState() {
    widget.product.quantity = widget.product.quantity ?? 1;
    super.initState();
  }

  navToProduct(BuildContext context) {
    Navigator.pop(context);
    if (widget.serviceType == ServiceType.grocery) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return GroceryProductDetail(
            product: widget.product as GroceryProduct,
            vendor: widget.vendor as GroceryVendor,
          );
        },
      ));
    }
    if (widget.serviceType == ServiceType.shop) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return RetailProductDetail(
            product: widget.product as ShopProduct,
            productId: widget.product.id,
            vendor: widget.vendor as ShopVendor,
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    AlwaysAliveRefreshable? aar;
    if (widget.serviceType == ServiceType.shop) {
      aar = shopOrderProv.notifier;
    }
    if (widget.serviceType == ServiceType.grocery) {
      aar = grocOrderProv.notifier;
    }

    return Container(
      padding: EdgeInsets.only(
        top: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Column
          GestureDetector(
              onTap: () {
                navToProduct(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  child: Image.asset(widget.product.imageUrl,
                      width: 94.h, height: 94.h, fit: BoxFit.fill),
                ),
              )),
          // Second Column
          SizedBox(
            width: 14.w,
          ),
          Expanded(
              child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: .50.sw,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ListView(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                // children: [
                GestureDetector(
                    onTap: () {
                      navToProduct(context);
                    },
                    child: Text(
                      widget.product.productName,
                      // "awefjalkwejflakwejflkawjeflkawjeflkajweflkjawelfkawekeafjakefjj",
                      style: TextStyle(
                          fontSize: 16.sp, color: AppColors.color333836),
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  widget.serviceType == ServiceType.grocery
                      ? "${widget.product.quantity} ea"
                      : getOrderDetailString(widget.product),
                  style:
                      TextStyle(fontSize: 12.sp, color: AppColors.color8E8E8E),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CartQuantityEditButton(
                      onTap: () {
                        if (widget.product.quantity != null &&
                            widget.product.quantity! > 1) {
                          setState(() {
                            widget.product.quantity =
                                widget.product.quantity! - 1;
                          });
                          ref.read(aar!).updateOrderItemQuantity(
                              widget.orderIndex,
                              widget.orderItemIndex,
                              widget.product.quantity!);
                        }
                      },
                      addOrRemove: AddOrRemove.remove,
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Text(
                      "${widget.product.quantity ?? 1}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.color4D4D4D,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    CartQuantityEditButton(
                      onTap: () {
                        setState(() {
                          widget.product.quantity =
                              widget.product.quantity! + 1;
                        });
                        ref.read(aar!).updateOrderItemQuantity(
                            widget.orderIndex,
                            widget.orderItemIndex,
                            widget.product.quantity!);
                      },
                      addOrRemove: AddOrRemove.add,
                    ),
                  ],
                ),
                SizedBox(height: 5.h)
              ],
            ),
          )),
          // Third Column
          ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: .38.sw,
              ),
              child: Flex(direction: Axis.vertical, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      // "3444333333333333333333333333333333",
                      twoDecItemPriceString(widget.product.price),
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () {
                        ref.read(aar!).removeOrderItem(
                            widget.orderIndex, widget.orderItemIndex);
                      },
                      child: Text(
                        'Remove',
                        style: TextStyle(
                            fontSize: 15.h,
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
