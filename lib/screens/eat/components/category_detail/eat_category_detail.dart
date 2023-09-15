import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_cart.dart';
import 'package:halen_customer_app/screens/eat/components/eat_product_detail/eat_product_detail.dart';
import 'package:halen_customer_app/screens/eat/components/etc/rating_chip.dart';
import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/widgets/search_text_input.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class EatCategoryDetail extends StatefulWidget {
  const EatCategoryDetail({Key? key, required this.vendorProducts})
      : super(key: key);

  final List<Map<EatVendor, List<EatProduct>>> vendorProducts;

  @override
  State<EatCategoryDetail> createState() => _EatCategoryDetailState();
}

class _EatCategoryDetailState extends State<EatCategoryDetail> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_onSearchFocusChange);
  }

  @override
  void dispose() {
    _searchFocusNode.removeListener(_onSearchFocusChange);
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchFocusChange() {
    if (_searchFocusNode.hasFocus) {
      _searchFocusNode.unfocus();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          // return const EatSearchScreen();
          return MainTabItemSearch(
            products: allEatProducts,
            serviceType: ServiceType.eat,
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(children: [
              const EatCartAppBar(
                title: "Search",
                showCartAction: false,
              ),
              SearchInputLink(
                focusNode: _searchFocusNode,
              ),
              Expanded(
                  child: ListView.separated(
                      // add first header in itemBuilder
                      itemCount: widget.vendorProducts.length + 1,
                      separatorBuilder: (BuildContext context, int sepIdx) {
                        if (sepIdx < widget.vendorProducts.length &&
                            sepIdx > 0) {
                          return CategorySearchLVIHeader(
                            vendor: widget.vendorProducts[sepIdx].keys.first,
                          );
                        } else {
                          return Container();
                        }
                      },
                      itemBuilder: (BuildContext context, int vpIdx) {
                        // add first separator
                        if (vpIdx == 0) {
                          return CategorySearchLVIHeader(
                            vendor: widget.vendorProducts[vpIdx].keys.first,
                          );
                        }
                        return SizedBox(
                            height: .4.sh,
                            width: .55.sw,
                            child: PageView.builder(
                                itemCount: widget.vendorProducts[vpIdx - 1]
                                    .values.first.length,
                                padEnds: false,
                                controller: PageController(
                                    viewportFraction:
                                        // adjust viewport for tablets
                                        (1.sw / 1.sh) < (9 / 16) ? 0.69 : .44),
                                // onPageChanged: (int index) { _index = index;},
                                itemBuilder: (_, epIdx) {
                                  return Transform.scale(
                                    // scale: i == _index ? 1 : 0.9,
                                    scale: 1,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) {
                                              return EatProductDetail(
                                                product: widget
                                                    .vendorProducts[vpIdx - 1]
                                                    .values
                                                    .first[epIdx],
                                                vendor: widget
                                                    .vendorProducts[vpIdx - 1]
                                                    .keys
                                                    .first,
                                              );
                                            },
                                          ));
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.h),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        .015.sw),
                                                child: Material(
                                                    elevation: 8.h,
                                                    child: SizedBox(
                                                      height: .4.sh,
                                                      child: Column(children: [
                                                        Image.asset(
                                                          widget
                                                              .vendorProducts[
                                                                  vpIdx - 1]
                                                              .values
                                                              .first[epIdx]
                                                              .imageUrl,
                                                          height: .2.sh,
                                                          width: .55.sw,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        8.h,
                                                                    horizontal:
                                                                        12.h),
                                                            child:
                                                                Row(children: [
                                                              Expanded(
                                                                  child: Text(
                                                                widget
                                                                    .vendorProducts[
                                                                        vpIdx -
                                                                            1]
                                                                    .values
                                                                    .first[
                                                                        epIdx]
                                                                    .productName,
                                                                style: TextStyle(
                                                                    color: AppColors
                                                                        .bglDefTextColor,
                                                                    fontSize:
                                                                        14.h,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                              ))
                                                            ])),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.h),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  twoDecItemPriceString(widget
                                                                      .vendorProducts[
                                                                          vpIdx -
                                                                              1]
                                                                      .values
                                                                      .first[
                                                                          epIdx]
                                                                      .price),
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .primaryColor1,
                                                                      fontSize:
                                                                          16.h),
                                                                ),
                                                                Container(
                                                                    width:
                                                                        .15.sh,
                                                                    height:
                                                                        .04.sh,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(.015
                                                                                .sh)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        "Add",
                                                                        style: TextStyle(
                                                                            color:
                                                                                AppColors.bgdDefTextColor),
                                                                      ),
                                                                    ))
                                                              ],
                                                            ))
                                                      ]),
                                                    ))))),
                                  );
                                }));
                      }))
            ])));
  }
}

class CategorySearchLVIHeader extends StatelessWidget {
  const CategorySearchLVIHeader({Key? key, required this.vendor})
      : super(key: key);

  final EatVendor vendor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vendor.name,
              style:
                  TextStyle(color: AppColors.bglDefTextColor, fontSize: 24.h),
            ),
            RatingChip(vendor: vendor)
          ],
        ));
  }
}
