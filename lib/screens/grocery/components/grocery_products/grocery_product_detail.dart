import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/utils.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_app_bar.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/grocery_cart_state.dart';
import 'package:halen_customer_app/screens/grocery/methods/grocery_product_data_requests.dart';
// import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class GroceryProductDetail extends ConsumerStatefulWidget {
  const GroceryProductDetail(
      {Key? key,
      // required this.productId,
      required this.product,
      required this.vendor})
      : super(key: key);
  // final String productId;
  final GroceryProduct product;
  final GroceryVendor vendor;
  @override
  GroceryProductDetailState createState() => GroceryProductDetailState();
}

class GroceryProductDetailState extends ConsumerState<GroceryProductDetail> {
  int count = 1;

  addToCartPress(BuildContext context, WidgetRef ref) {
    widget.product.quantity = count;
    ref.read(grocOrderProv.notifier).addItemToOrder(
        widget.product.copyWith(), getGroceryVendorForProduct(widget.product));

    CartConfirmation.show(context);
  }

  @override
  Widget build(BuildContext context) {
    // var gstate = ref.watch(grocOrderProv);

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.baseGreyColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const GroceryAppBar(
            key: Key("custom_app_bar_detail"),
            title: "Details",
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(
                  16.r), // Replace with your desired padding values
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white, // Set the desired background color
                    child: SizedBox(
                      width: double.infinity,
                      height: 210.h,
                      child: Image.asset(
                        widget.product.imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment:
                        Alignment.centerLeft, // Align the text to the right
                    child: Text(
                      widget.product.productName,
                      style: TextStyle(
                        color: AppColors.bglDefTextColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 15.sp,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Deliver within  ${widget.vendor.deliveryTimeStr ?? "2 hours"}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
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
                                  widget.product.weightOrDiscreteStr ?? "1 ea",
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
                        dispStrForCat[widget.product.categoryId],
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 15.h),
                  Align(
                      alignment:
                          Alignment.centerLeft, // Align the text to the right
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.grey700,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 15.h),
                  Align(
                      alignment:
                          Alignment.centerLeft, // Align the text to the right
                      child: Text(
                        widget.product.desc,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.grey500,
                        ),
                      )),
                  SizedBox(height: 15.h),
                  Align(
                      alignment:
                          Alignment.centerLeft, // Align the text to the right
                      child: Text(
                        "Special Instructions",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.grey700,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 15.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 73.h,
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          8.r), // Set the desired border radius
                    ),
                    child: TextField(
                      maxLines: 8,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                      decoration: const InputDecoration.collapsed(
                        hintText: "Add your note",
                      ),
                    ),
                  ),
                  SizedBox(height: 35.h),
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
                                widget.product.quantity = count;
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
                              widget.product.quantity = count;
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
                          twoDecItemPriceString(widget.product.price * count),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.color4D4D4D,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Container(
            margin: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 10.h),
            child: ElevatedButton(
              onPressed: () {
                addToCartPress(context, ref);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color20A39E,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: Container(
                height: 48.h,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "ADD TO CART",
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
    ));
  }
}
