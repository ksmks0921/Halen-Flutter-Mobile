import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/eat/components/eat_product_detail/eat_product_detail.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';

class VendorFeaturedItemsSlider extends StatelessWidget {
  const VendorFeaturedItemsSlider(
      {Key? key, required this.products, required this.vendor})
      : super(key: key);

  final List<EatProduct> products;
  final EatVendor vendor;
  @override
  Widget build(BuildContext context) {
    double imageHeight = .16.sh;
    double cardVerticalPadding = 8.h;
    double cardTitleVerticalPadding = 16.h;
    double cardTitleTextSize = 14.h;
    double cardSubtitlePadding = 12.h;
    double cardAddButtonHeight = 44.h;
    double cardTotalHeight = imageHeight +
        (cardVerticalPadding * 2) +
        (cardTitleVerticalPadding * 2) +
        cardTitleTextSize +
        (cardSubtitlePadding * 2) +
        cardAddButtonHeight;

    // as fraction of screen width
    double calcPageviewWidth =
        (1.sw / 1.sh) < (9 / 16) || (1.sw < 600) ? 0.77 : .44;

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Container(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                    height: 64.h,
                    child: Row(children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, top: 16.h, bottom: 24.h),
                          child: Text(
                            "Featured",
                            style: TextStyle(
                                color: AppColors.primaryColor1,
                                fontSize: 24.h,
                                fontWeight: FontWeight.w500),
                          ))
                    ])),
                Center(
                    child: SizedBox(
                        height: cardTotalHeight,
                        child: PageView.builder(
                            itemCount: products.length,
                            padEnds: false,
                            controller: PageController(
                              viewportFraction: calcPageviewWidth,
                            ),
                            // adjust viewport for tablets
                            // onPageChanged: (int index) { _index = index;},
                            itemBuilder: (_, i) {
                              return Stack(children: [
                                Transform.scale(
                                  // scale: i == _index ? 1 : 0.9,
                                  scale: 1,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return EatProductDetail(
                                              product: products[i],
                                              vendor: vendor,
                                            );
                                          },
                                        ));
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: cardVerticalPadding),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(.03.sw),
                                              child: Material(
                                                  elevation: 8.w,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                          child: Image.asset(
                                                        products[i].imageUrl,
                                                        height: imageHeight,
                                                        width: calcPageviewWidth
                                                            .sw,
                                                        // width: .55.sw,
                                                        fit: BoxFit.cover,
                                                      )),
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      cardTitleVerticalPadding,
                                                                  horizontal:
                                                                      12.h),
                                                          child: Row(children: [
                                                            Text(
                                                              products[i]
                                                                  .productName,
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .bglDefTextColor,
                                                                  fontSize:
                                                                      cardTitleTextSize),
                                                            )
                                                          ])),
                                                      Padding(
                                                          padding: EdgeInsets.all(
                                                              cardSubtitlePadding),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                twoDecItemPriceString(
                                                                    products[i]
                                                                        .price),
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .primaryColor1,
                                                                    fontSize:
                                                                        16.h),
                                                              ),
                                                              Container(
                                                                  width: .2.sw,
                                                                  height:
                                                                      cardAddButtonHeight,
                                                                  decoration: BoxDecoration(
                                                                      color: AppColors
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              .015.sw)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Add",
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.bgdDefTextColor),
                                                                    ),
                                                                  ))
                                                            ],
                                                          ))
                                                    ],
                                                  ))))),
                                ),
                              ]);
                            })))
              ],
            )));
  }
}
