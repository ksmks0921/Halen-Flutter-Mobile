import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/models/vendor_model_generic.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/shop_retail/components/product_detail/product_detail.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/screens/eat/components/eat_product_detail/eat_product_detail.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_product_detail.dart';

class GProductCardSearchOne extends StatelessWidget {
  const GProductCardSearchOne(
      {super.key,
      required this.product,
      required this.vendor,
      required this.serviceType});

  final GProduct product;
  final GVendor vendor;
  final ServiceType serviceType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (serviceType == ServiceType.shop) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RetailProductDetail(
                productId: product.id,
                product: product as ShopProduct,
                vendor: vendor as ShopVendor,
              );
            }));
          }
          if (serviceType == ServiceType.eat) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EatProductDetail(
                product: product as EatProduct,
                vendor: vendor as EatVendor,
              );
            }));
          }
          if (serviceType == ServiceType.grocery) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return GroceryProductDetail(
                product: product as GroceryProduct,
                vendor: vendor as GroceryVendor,
              );
            }));
          }
        },
        child: Container(
          width: 164.w,
          height: 216.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              width: 0, // Set the border width to 2 pixels
              color: AppColors.grey400, // Set the border color to red
            ),
          ),
          padding: EdgeInsets.all(6.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                width: double.infinity,
                height: 90.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.imageUrl),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text(
                    twoDecItemPriceString(product.price),
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: 13.sp,
                    ),
                  ),
                  const Spacer(), // Add some spacing between the texts
                  // Text(
                  //   twoDecItemPriceString(product.price + (.05*product.price)), // Replace with the actual discount price value
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     decoration: TextDecoration.lineThrough,
                  //     fontSize: 11.sp,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                product.productName,
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                  height: 18.sp,
                  child: Text(
                    product.desc,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey, fontSize: 9.sp),
                  )),
              const Spacer(),
              Row(
                children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         // Handle container click
                  //       },
                  //       child: Container(
                  //         width: 14.w,
                  //         height: 14.h,
                  //         decoration: const BoxDecoration(
                  //           color: Colors.yellow,
                  //           shape: BoxShape.circle,
                  //         ),
                  //         child: Icon(
                  //           Icons.remove,
                  //           color: Colors.white,
                  //           size: 16.sp,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 4.w,
                  //     ),
                  //     Text(
                  //       count.toString(),
                  //       style: TextStyle(
                  //           fontSize: 14.sp, color: AppColors.color20A39E),
                  //     ),
                  //     SizedBox(
                  //       width: 4.w,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         // Handle container click
                  //       },
                  //       child: Container(
                  //         width: 14.w,
                  //         height: 14.h,
                  //         decoration: const BoxDecoration(
                  //           color: Colors.yellow,
                  //           shape: BoxShape.circle,
                  //         ),
                  //         child: Icon(
                  //           Icons.add,
                  //           color: Colors.white,
                  //           size: 12.sp,
                  //         ),
                  //       ),
                  //     ),
                  const Spacer(),
                  SizedBox(
                    height: 32.h,
                    width: 73.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                      },
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
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
