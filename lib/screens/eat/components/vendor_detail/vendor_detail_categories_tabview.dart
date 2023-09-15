import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/eat/components/vendor_detail/vendor_category_items_tabview_content.dart';
import 'package:halen_customer_app/screens/eat/models.dart';

class VendorDetailCategoriesTabView extends StatefulWidget {
  const VendorDetailCategoriesTabView({super.key, required this.vendor});

  final EatVendor vendor;

  @override
  State<VendorDetailCategoriesTabView> createState() =>
      _VendorDetailCategoriesTabViewState();
}

class _VendorDetailCategoriesTabViewState
    extends State<VendorDetailCategoriesTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> buildVendorCategoryTabs = [];
  List<EatVendorCategoryTabViewContent> buildEatCatTabViewContentItems = [];

  @override
  void initState() {
    super.initState();
    buildEatCatTabViewContentItems = [
      EatVendorCategoryTabViewContent(
        category: "all",
        vendor: widget.vendor,
      ),
    ];

    double tabForCatTextSize = 16.h;
    buildVendorCategoryTabs = [
      Tab(
          child: Text(
        'All',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
    ];
    final Map<String, Tab> tabForCat = {
      "all": Tab(
          child: Text(
        'All',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
      "appetizer": Tab(
          child: Text(
        'Appetizers',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
      "pasta": Tab(
          child: Text(
        'Pasta',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
      "soup_and_salad": Tab(
          child: Text(
        'Salads & Soup',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
      "vegetarian": Tab(
          child: Text(
        'Vegetarian',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
      "snack": Tab(
          child: Text(
        'Snacks',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
      "burger": Tab(
          child: Text(
        'Burger',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
      "entree": Tab(
          child: Text(
        'Entree',
        style: TextStyle(fontSize: tabForCatTextSize),
      )),
    };

    for (var ep in widget.vendor.products) {
      for (String epCat in ep.categories!) {
        if (!buildVendorCategoryTabs.contains(tabForCat[epCat])) {
          if (tabForCat.keys.contains(epCat)) {
            buildVendorCategoryTabs.add(tabForCat[epCat]!);
            buildEatCatTabViewContentItems.add(EatVendorCategoryTabViewContent(
              category: epCat,
              vendor: widget.vendor,
            ));
          }
        }
      }
    }
    _tabController = TabController(
        length: buildVendorCategoryTabs.length, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      _getTabAtIndex(_tabController.index);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _getTabAtIndex(int index) {
    return buildEatCatTabViewContentItems[index];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            height: 36.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent, // Set the default background color
            ),
            child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors
                      .color20A39E, // Set the selected tab background color
                ),
                labelColor: Colors.white, // Set the selected tab text color
                unselectedLabelColor:
                    Colors.grey, // Set the unselected tab text color
                tabs: buildVendorCategoryTabs),
          ),
          // will not conform to vertical height constraints
          // TabBarView(
          //     controller: _tabController,
          //     children: buildEatCatTabViewContentItems)
          GestureDetector(
              onHorizontalDragEnd: (DragEndDetails ded) {
                if (ded.primaryVelocity! > 0 && _tabController.index > 0) {
                  setState(() {
                    _tabController.index -= 1;
                  });
                }
                if (ded.primaryVelocity! < 0 &&
                    _tabController.index < buildVendorCategoryTabs.length - 1) {
                  setState(() {
                    _tabController.index += 1;
                  });
                }
              },
              child: _getTabAtIndex(_tabController.index)),
        ],
      ),
    );
  }
}
