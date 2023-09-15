import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_cart.dart';
import 'package:halen_customer_app/screens/eat/components/vendor_detail/eat_vendor_detail_top_search.dart';
import 'package:halen_customer_app/screens/eat/components/vendor_detail/vendor_featured_items_slider.dart';
import 'package:halen_customer_app/screens/eat/components/vendor_detail/vendor_detail_categories_tabview.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class EatVendorDetail extends ConsumerStatefulWidget {
  const EatVendorDetail({Key? key, required this.vendor}) : super(key: key);

  final EatVendor vendor;
  @override
  EatVendorDetailState createState() => EatVendorDetailState();
}

class EatVendorDetailState extends ConsumerState<EatVendorDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.baseGreyColor,
            bottomNavigationBar: const CustomNavigationBar(),
            body: Column(children: [
              EatCartAppBar(
                title: widget.vendor.name,
                showCartAction: true,
              ),
              const EatVendorDetailTopSearch(
                rating: "4.4 (220+)",
                deliveryFee: "\$5.58",
                distanceMinutes: "25 - 55 mins",
                numUsersBought: "4.4k",
              ),
              Expanded(
                  child: ListView(children: [
                VendorFeaturedItemsSlider(
                  products: featuredVendorProducts
                      .where((el) => el.keys.first == widget.vendor)
                      .toList()[0]
                      .values
                      .toList()[0],
                  vendor: widget.vendor,
                ),
                VendorDetailCategoriesTabView(
                  vendor: widget.vendor,
                )
              ]))
            ])));
  }
}
