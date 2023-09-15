import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/utils.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/shop_retail/components/product_detail/review_content.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_appbar/retail_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'accordion.dart';
import 'package:halen_customer_app/screens/shop_retail/data.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_home/product_content_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/shop_retail/methods/shop_product_data_requests.dart';
import 'package:halen_customer_app/appstate/retail_cart_state.dart';
import 'package:halen_customer_app/screens/shop_retail/models.dart';
import 'package:halen_customer_app/methods/display_data/delivery_times.dart';
import 'package:halen_customer_app/widgets/photo_view_page.dart';
// import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class RetailProductDetail extends ConsumerStatefulWidget {
  const RetailProductDetail({
    Key? key,
    required this.productId,
    required this.product,
    required this.vendor,
  }) : super(key: key);
  final String productId;
  final ShopProduct product;
  final ShopVendor vendor;

  @override
  RetailProductDetailState createState() => RetailProductDetailState();
}

class RetailProductDetailState extends ConsumerState<RetailProductDetail> {
  int count = 1;

  addToCartPress(BuildContext context, WidgetRef ref) {
    ref.read(shopOrderProv.notifier).addItemToOrder(
        widget.product.copyWith(quantity: count),
        getShopVendorForProduct(widget.product));

    CartConfirmation.show(context);
  }

  int? selectedSizeIndex;
  int? selectedColorIndex;

  // List<Color> colors = [
  //   const Color(0xFF6FD0D7),
  //   const Color(0xFFAEDB8A),
  //   const Color(0xFFFF8974),
  //   const Color(0xFFEB91E8),
  //   const Color(0xFFFA9124),
  // ];

  @override
  Widget build(BuildContext context) {
    ImageProvider imageMain = AssetImage(
      widget.product.imageUrl,
      // fit: BoxFit.cover,
    );

    return SafeArea(
        child: Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.baseGreyColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Column(
        children: [
          const RetailAppBar(
            title: "Detail",
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(
                  16.r), // Replace with your desired padding values
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return PhotoViewPage(
                              imageProvider: imageMain,
                            );
                          },
                        ));
                      },
                      child: SizedBox(
                          width: double.infinity, // Full width
                          height: 210.h, // Desired height
                          child: Image(image: imageMain))),
                  SizedBox(height: 20.h),
                  Align(
                    alignment:
                        Alignment.centerLeft, // Align the text to the right
                    child: Text(
                      widget.product.productName,
                      style: TextStyle(
                        color: AppColors.color7D7871,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_shipping_outlined,
                          size: 15.sp,
                          color: Colors.grey[500],
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          getEstDeliveryTimeByStr(widget.vendor),
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.product.desc,
                                  style: TextStyle(
                                    color: AppColors.color333836,
                                    fontSize: 20.sp,
                                  ),
                                  maxLines: null,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  twoDecItemPriceString(widget.product.price),
                                  style: TextStyle(
                                    color: AppColors.color20A39E,
                                    fontSize: 22.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                      alignment:
                          Alignment.centerLeft, // Align the text to the right
                      child: Text(
                        widget.product.brand ?? "",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.colorB8BBC6,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 15.h),
                  widget.product.colors != null
                      ? Container(
                          // height: 113.h,
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 15.w),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(children: [
                                Text(
                                  "Color",
                                  style: TextStyle(
                                      color: AppColors.color20A39E,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                                SizedBox(width: 18.w),
                                Align(
                                    alignment: Alignment
                                        .centerLeft, // Align the text to the right
                                    child: selectedColorIndex != null
                                        ? Text(
                                            widget.product
                                                .colors![selectedColorIndex!],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          )
                                        : Container())
                              ]),
                              SizedBox(height: 20.h),
                              widget.product.colors != null
                                  ? Wrap(
                                      children: List.generate(
                                          widget.product.colors!.length,
                                          (index) {
                                        // final Color color = colors[index];
                                        final String color =
                                            widget.product.colors![index];
                                        return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w, vertical: 8.w),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedColorIndex = index;
                                                    widget.product
                                                        .selectedColor = index;
                                                  });
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8.h,
                                                            horizontal: 24.h),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.h),
                                                      // shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: index ==
                                                                selectedColorIndex
                                                            ? AppColors
                                                                .color20A39E
                                                            : Colors.grey[700]!,
                                                        width: 2.w,
                                                      ),
                                                    ),
                                                    child:
                                                        // CircleAvatar(
                                                        //   radius: 19.r,
                                                        // backgroundColor: Colors.transparent,
                                                        // foregroundColor: color,
                                                        Text(
                                                      color,
                                                      style: TextStyle(
                                                        color: index ==
                                                                selectedColorIndex
                                                            ? AppColors
                                                                .color20A39E
                                                            : Colors.grey[700]!,
                                                      ),
                                                    )
                                                    // CircleAvatar(
                                                    //   radius: 14.r,
                                                    //   backgroundColor: color,
                                                    // ),
                                                    // ),
                                                    )));
                                      }),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            "Size",
                            style: TextStyle(
                                color: AppColors.color20A39E,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          SizedBox(width: 18.h),
                          selectedSizeIndex != null
                              ? Align(
                                  alignment: Alignment
                                      .centerLeft, // Align the text to the right
                                  child: Text(
                                    widget.product
                                        .sizes![widget.product.selectedSize!],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ))
                              : Container(),
                        ]),
                        SizedBox(height: 20.h),
                        widget.product.sizes != null
                            ? Wrap(
                                children: List.generate(
                                    widget.product.sizes!.length, (index) {
                                  return Padding(
                                      padding: EdgeInsets.only(top: 4.w),
                                      child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSizeIndex = index;
                                              widget.product.selectedSize =
                                                  index;
                                            });
                                          },
                                          child: Container(
                                            width: 34.w,
                                            height: 34.h,
                                            margin:
                                                EdgeInsets.only(right: 15.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              border: Border.all(
                                                color:
                                                    index == selectedSizeIndex
                                                        ? AppColors.color20A39E
                                                        : AppColors.colorADADAD,
                                                width: 2.w,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                widget.product.sizes![index],
                                                style: TextStyle(
                                                  color: index ==
                                                          selectedSizeIndex
                                                      ? AppColors.color20A39E
                                                      : AppColors.colorADADAD,
                                                ),
                                              ),
                                            ),
                                          )));
                                }),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 15.w),
                      color: Colors.white,
                      child: Column(children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                              color: AppColors.color20A39E,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 73.h,
                          padding: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                8.r), // Set the desired border radius
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (count > 1) {
                                      count--;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorF4F4F3,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              Text(
                                "$count",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.color4D4D4D,
                                ),
                              ),
                              SizedBox(
                                width: 14.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Container(
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorF4F4F3,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                twoDecItemPriceString(
                                    widget.product.price * count),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.color4D4D4D,
                                ),
                              ),
                            ],
                          ),
                        )
                      ])),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment
                                .centerLeft, // Align the text to the right
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: AppColors.color20A39E,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            )),
                        SizedBox(height: 10.h),
                        const Accordion(
                          title: 'Product Details',
                          content:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
                        ),
                        SizedBox(height: 4.h),
                        const Accordion(
                          title: 'Size and Fit',
                          content:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
                        ),
                        SizedBox(height: 4.h),
                        const Accordion(
                          title: 'Return Policy',
                          content:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam bibendum ornare vulputate. Curabitur faucibus condimentum purus quis tristique.',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment
                                .centerLeft, // Align the text to the right
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                  color: AppColors.color20A39E,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            )),
                        SizedBox(height: 10.h),
                        const ReviewContent(
                          title: 'Great Product!',
                          content:
                              'This product exceeded my expectations. Highly recommended.',
                          reviewerName: 'John Doe',
                          reviewDate: 'July 15, 2023',
                          starCount: 5,
                        ),
                        const ReviewContent(
                          title: 'Lovely dress!',
                          content:
                              'This product exceeded my expectations. Highly recommended.',
                          reviewerName: 'John Doe',
                          reviewDate: 'July 15, 2023',
                          starCount: 4,
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              // Handle the click event
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.color20A39E,
                                    width: 2.w,
                                  ),
                                ),
                              ),
                              child: Text(
                                "View More Reviews",
                                style: TextStyle(
                                  color: AppColors.color20A39E,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0),
                    color: Colors.white,
                    child: Column(
                      children: [
                        ProductContentCategory(
                          categoryName: relatedProduct.categoryName,
                          products: relatedProduct.products,
                          categoryId: relatedProduct.categoryId,
                          vendor: widget.vendor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Container(
            height: 92.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.w),
            color: Colors.white,
            child: ElevatedButton(
              onPressed: () {
                addToCartPress(context, ref);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color20A39E,
                foregroundColor: Colors.white,
              ),
              child: Text(
                "ADD TO CART",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
