import 'package:flutter/material.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:halen_customer_app/screens/grocery/methods/grocery_product_data_requests.dart';
import 'package:halen_customer_app/screens/shop_retail/methods/shop_product_data_requests.dart';
import 'package:halen_customer_app/screens/eat/methods/eat_product_data_requests.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/screens/shop_retail/components/product_detail/product_detail.dart';
import 'package:halen_customer_app/screens/eat/components/eat_product_detail/eat_product_detail.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_products/grocery_product_detail.dart';

Widget buildMultiplebuildStoreSearchHistory(
    BuildContext context, List<GProduct> products, ServiceType serviceType) {
  return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: List.generate(products.length, (index) {
          GProduct product = products[index];

          return GestureDetector(
              onTap: () {
                if (serviceType == ServiceType.shop) {
                  var vendor = getShopVendorForProduct(product as ShopProduct);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return RetailProductDetail(
                      productId: product.id,
                      product: product,
                      vendor: vendor as ShopVendor,
                    );
                  }));
                }
                if (serviceType == ServiceType.eat) {
                  var vendor = getEatVendorForProduct(product as EatProduct);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return EatProductDetail(
                      product: product,
                      vendor: vendor as EatVendor,
                    );
                  }));
                }
                if (serviceType == ServiceType.grocery) {
                  var vendor =
                      getGroceryVendorForProduct(product as GroceryProduct);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return GroceryProductDetail(
                      product: product,
                      vendor: vendor as GroceryVendor,
                    );
                  }));
                }
              },
              child: Container(
                height: 51.h,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(.02.sw)),
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      products[index].imageUrl, // Replace with your image path
                      width: 34,
                      height: 34,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      products[index].productName,
                      style: TextStyle(
                          color: AppColors.appBarColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ));
        }),
      ));
}
