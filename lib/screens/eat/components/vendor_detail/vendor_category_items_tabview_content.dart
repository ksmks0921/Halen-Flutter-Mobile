import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/eat/components/eat_product_detail/eat_product_detail.dart';
import 'package:halen_customer_app/models/product_model_generic.dart';

class EatVendorCategoryTabViewContent extends StatelessWidget {
  const EatVendorCategoryTabViewContent(
      {Key? key, required this.category, required this.vendor})
      : super(key: key);

  final String category;
  final EatVendor vendor;

  @override
  Widget build(BuildContext context) {
    // group products by category e.g.
    // [{"appetizer": [ep1, ep2]}, {"soup_and_salad": [ep3, ep4, ep5]}, ]
    List<Map<String, List<EatProduct>>> groupedSelectedProducts = [];
    List<Map<String, List<EatProduct>>> gspToAdd = [];

    for (GProduct ep in vendor.products) {
      for (String epCat in ep.categories!) {
        if (groupedSelectedProducts.isEmpty) {
          groupedSelectedProducts.add({
            epCat: [ep as EatProduct]
          });
        } else {
          for (Map gp in groupedSelectedProducts) {
            if (gp.containsKey(epCat)) {
              gp[epCat].add(ep);
            } else {
              // avoid concurrent modification create to add list
              bool addedTA = false;
              // check if gspToAdd already has category key
              for (var gspTA in gspToAdd) {
                if (gp.keys.first == gspTA.keys.first) {
                  gp.values.first.addAll(gspTA.values.first);
                  addedTA = true;
                }
              }
              // if doesn't contain category key add whole entry
              if (addedTA == false) {
                gspToAdd.add({
                  epCat: [ep as EatProduct]
                });
              }
            }
          }
        }
      }
    }
    // avoid concurrent modification add items from to add list
    for (var gspTA in gspToAdd) {
      bool addedTa = false;
      for (var gp in groupedSelectedProducts) {
        // find category key if exists and add list of values
        if (gspTA.keys.first == gp.keys.first) {
          gp.values.first.addAll(gspTA.values.first);
          addedTa = true;
        }
      }
      // add whole item if category key dne yet
      if (addedTa == false) {
        groupedSelectedProducts.add(gspTA);
      }
    }

    if (category == "all") {
      // remove duplicates for all category tab
      List<Map<String, List<EatProduct>>> remDupsGsp = [];
      List<EatProduct> allAddedEps = [];
      for (Map<String, List<EatProduct>> gspi in groupedSelectedProducts) {
        String cat = gspi.keys.first;
        Map<String, List<EatProduct>> remDupsGspi = {cat: []};
        List<EatProduct> locAddedEps = [];
        for (EatProduct ep in gspi.values.first) {
          if (!allAddedEps.contains(ep)) {
            allAddedEps.add(ep);
            locAddedEps.add(ep);
          }
        }
        remDupsGspi[cat]!.addAll(locAddedEps);
        if (locAddedEps.isNotEmpty) {
          remDupsGsp.add(remDupsGspi);
        }
      }

      groupedSelectedProducts = remDupsGsp;
    } else {
      groupedSelectedProducts = groupedSelectedProducts
          .where((el) => el.keys.first == category)
          .toList();
    }

    List<Widget> buildGroupedProductsAndHeaders = [];

    for (Map gsp in groupedSelectedProducts) {
      buildGroupedProductsAndHeaders
          .add(EatCatListProductHeader(dataCat: gsp.keys.first));

      for (EatProduct ep in gsp.values.first) {
        buildGroupedProductsAndHeaders.add(EatCatListProductLVI(
          product: ep,
          vendor: vendor,
        ));
      }
    }

    // return IntrinsicHeight(
    //     child:
    return Column(
      children: buildGroupedProductsAndHeaders,
      // )
    );
  }
}

class EatCatListProductHeader extends StatelessWidget {
  const EatCatListProductHeader({Key? key, required this.dataCat})
      : super(key: key);

  final String dataCat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 32.h + 48.h,
        child: Row(children: [
          Padding(
              padding: EdgeInsets.all(24.h),
              child: Text(
                dispDataCat[dataCat] ?? "",
                style:
                    TextStyle(color: AppColors.primaryColor1, fontSize: 24.h),
              ))
        ]));
  }
}

class EatCatListProductLVI extends StatelessWidget {
  const EatCatListProductLVI(
      {Key? key, required this.product, required this.vendor})
      : super(key: key);
  final EatProduct product;
  final EatVendor vendor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return EatProductDetail(
                product: product,
                vendor: vendor,
              );
            },
          ));
        },
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.w, color: Colors.black38))),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(children: [
                  SizedBox(
                      width: .64.sw,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.productName,
                              style: TextStyle(
                                  color: AppColors.bglDefTextColor,
                                  fontSize: 20.h,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: SizedBox(
                                    height: .07.sh,
                                    child: Wrap(children: [
                                      Text(
                                        product.ingredients!,
                                        style: TextStyle(
                                          color: AppColors.bglDefTextColor,
                                          fontSize: 16.h,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ]))),
                            Text(
                              twoDecItemPriceString(product.price),
                              style: TextStyle(
                                  color: AppColors.primaryColor1,
                                  fontSize: 20.h),
                            ),
                          ])),
                  SizedBox(
                      width: .24.sw,
                      height: .26.sw,
                      child: Stack(children: [
                        Positioned(
                            top: 0,
                            left: 0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(.03.sw),
                                child: SizedBox(
                                    child: Image.asset(
                                  product.imageUrl,
                                  width: .24.sw,
                                  height: .24.sw,
                                  fit: BoxFit.cover,
                                )))),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: .07.sw,
                            height: .07.sw,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: AppColors.bgdDefTextColor,
                              size: .045.sw,
                            )),
                          ),
                        )
                      ]))
                ]))));
  }
}
