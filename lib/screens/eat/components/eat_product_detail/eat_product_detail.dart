import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_cart.dart';
import 'package:halen_customer_app/screens/eat/components/eat_customize_bottom_sheet/eat_customize_modal_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/constants/utils.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class EatProductDetail extends ConsumerStatefulWidget {
  const EatProductDetail(
      {Key? key, required this.vendor, required this.product})
      : super(key: key);

  final EatVendor vendor;
  final EatProduct product;

  @override
  EatProductDetailState createState() => EatProductDetailState();
}

class EatProductDetailState extends ConsumerState<EatProductDetail> {
  List<Widget> sizesRadioChildren = [];
  int itemQuantity = 1;
  String? sizeGroupValue;

  // update quantity in widget product
  arItemQuantity(String ar) {
    if (ar == "add") {
      setState(() {
        itemQuantity += 1;
        widget.product.quantity = widget.product.quantity! + 1;
      });
    }
    if (ar == "remove" && itemQuantity > 1) {
      setState(() {
        itemQuantity -= 1;
        widget.product.quantity = widget.product.quantity! - 1;
      });
    }
  }

  // update size in widget product
  sizeChangeCB(String newsize) {
    setState(() {
      sizeGroupValue = newsize;
      widget.product.selectedSize =
          widget.product.sizes!.indexWhere((sz) => newsize == sz);
    });
  }

  // send widget product to customize sheet
  addToCartPress() {
    showModalBottomSheetFloatClose(
        context,
        EatCustomizeBottomSheetContent(
            product: widget.product,
            vendor: widget.vendor,
            showItemAddedSnackBarCB: showItemAddedSnackBarCB));
  }

  showItemAddedSnackBarCB() {
    // add small delay to make banner more noticable
    Future.delayed(const Duration(milliseconds: 333), () {
      CartConfirmation.show(context);
    });
  }

  @override
  void initState() {
    sizeGroupValue = widget.product.sizes![0];
    widget.product.selectedSize = 0;
    widget.product.quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // build radio items for sizes
    sizesRadioChildren = [];
    for (var size in widget.product.sizes!) {
      sizesRadioChildren.add(SizeRadioChild(
          sizeGroupValue: sizeGroupValue!,
          sizeLabel: size,
          sizeChangeCB: sizeChangeCB));
    }

    List<Widget> buildSimilarLVIS = [];
    // get similar items and build list items
    for (var sim in widget.product.similars!) {
      List simEatProds = widget.vendor.products
          .where((GProduct aep) => aep.id == sim)
          .toList();
      for (var sep in simEatProds) {
        buildSimilarLVIS.add(
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return EatProductDetail(
                      product: sep,
                      vendor: widget.vendor,
                    );
                  },
                ));
              },
              child: SizedBox(
                  height: .055.sh,
                  child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Row(children: [
                          Container(
                            width: .02.sh,
                            height: .02.sh,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(.01.sh)),
                            child: Center(
                                child: Icon(Icons.add,
                                    color: AppColors.bgdDefTextColor,
                                    size: .015.sh)),
                          ),
                          SizedBox(width: .02.sw),
                          Text(
                            sep.productName,
                            style: TextStyle(color: AppColors.bglDefTextColor),
                          ),
                        ]),
                        Text(
                          twoDecItemPriceString(sep.price),
                          style: TextStyle(color: AppColors.bglDefTextColor),
                        )
                      ])))),
        );
      }
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.baseGreyColor,
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(children: [
              const EatCartAppBar(
                title: "Details",
                // cartItemCount: cil,
                showCartAction: true,
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ListView(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(.015.sh),
                            child: Image.asset(
                              widget.product.imageUrl,
                              width: double.infinity,
                              height: .3.sh,
                              fit: BoxFit.cover,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.w,
                                            color: Colors.black38))),
                                child: Row(
                                  children: [
                                    Text(
                                      widget.vendor.name,
                                      style: TextStyle(
                                          color: AppColors.bglDefTextColor,
                                          fontSize: 24.h,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            child: SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.product.productName,
                                  style: TextStyle(
                                      color: AppColors.bglDefTextColor,
                                      fontSize: 20.h,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    twoDecItemPriceString(widget.product.price),
                                    style: TextStyle(
                                        color: AppColors.primaryColor1,
                                        fontSize: 24.h)),
                              ],
                            ))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                            ),
                            child: SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Ingredients",
                                    style: TextStyle(
                                        color: AppColors.bglDefTextColor,
                                        fontSize: 24.h)),
                              ],
                            ))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            child: SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text(widget.product.ingredients!,
                                        style: TextStyle(
                                            color: AppColors.bglDefTextColor,
                                            fontSize: 16.h))),
                              ],
                            ))),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(.015.sh),
                            child: Container(
                                color: Colors.white,
                                child: Column(children: [
                                  Padding(
                                      padding: EdgeInsets.all(
                                        12.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Size",
                                              style: TextStyle(
                                                  color:
                                                      AppColors.primaryColor1,
                                                  fontSize: 24.h)),
                                          Text("(Required)",
                                              style: TextStyle(
                                                  color:
                                                      AppColors.primaryColor1,
                                                  fontSize: 16.h))
                                        ],
                                      )),
                                  ...sizesRadioChildren
                                ]))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                            ),
                            child: SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Special Instructions",
                                    style: TextStyle(
                                        color: AppColors.bglDefTextColor,
                                        fontSize: 24.h)),
                              ],
                            ))),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(.015.sh),
                              ),
                              child: const TextField(
                                minLines: 2,
                                maxLines: 8,
                                decoration:
                                    InputDecoration(hintText: "Add your note"),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                          ),
                          child: SizedBox(
                              height: .1.sh,
                              child: Row(children: [
                                GestureDetector(
                                    onTap: () {
                                      arItemQuantity("remove");
                                    },
                                    child: Container(
                                        width: .04.sh,
                                        height: .04.sh,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(.01.sh)),
                                        child: Center(
                                            child: Icon(Icons.remove,
                                                color:
                                                    AppColors.bgdDefTextColor,
                                                size: .03.sh)))),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Text(
                                      itemQuantity.toString(),
                                      style: TextStyle(
                                          color: AppColors.bglDefTextColor,
                                          fontSize: .03.sh),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      arItemQuantity("add");
                                    },
                                    child: Container(
                                      width: .04.sh,
                                      height: .04.sh,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(.01.sh)),
                                      child: Center(
                                          child: Icon(Icons.add,
                                              color: AppColors.bgdDefTextColor,
                                              size: .03.sh)),
                                    ))
                              ])),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Size",
                                    style: TextStyle(
                                        color: AppColors.primaryColor1,
                                        fontSize: 24.h)),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.all(
                              12.h,
                            ),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Text(
                                          "People who ordered this also like",
                                          style: TextStyle(
                                              color: AppColors.primaryColor1,
                                              fontSize: 24.h))),
                                ],
                              ),
                              ...buildSimilarLVIS,
                            ]))
                      ]))),
              Container(
                padding: EdgeInsets.all(16.h),
                child: ElevatedButton(
                  onPressed: () {
                    addToCartPress();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.color20A39E,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Container(
                    height: 48.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              )
            ])));
  }
}

class SizeRadioChild extends StatelessWidget {
  const SizeRadioChild(
      {Key? key,
      required this.sizeLabel,
      required this.sizeGroupValue,
      required this.sizeChangeCB})
      : super(key: key);

  final String sizeLabel;
  final String sizeGroupValue;
  final Function sizeChangeCB;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(sizeLabel,
              style:
                  TextStyle(fontSize: 14.sp, color: AppColors.bglDefTextColor)),
          value: sizeLabel,
          groupValue: sizeGroupValue,
          activeColor: AppColors.color20A39E,
          onChanged: (value) {
            sizeChangeCB(value);
          },
          dense: true,
          visualDensity: const VisualDensity(vertical: -4.0),
        ));
  }
}
