import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_app_bar.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_products/filter_section.dart';
import 'package:halen_customer_app/screens/shop_retail/components/retail_products/sort_section.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:logger/logger.dart';

import 'grocery_content.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

class GroceryProducts extends StatefulWidget {
  const GroceryProducts(
      {Key? key, required this.categoryId, required this.vendor})
      : super(key: key);

  final String categoryId;
  final GroceryVendor vendor;

  @override
  State<GroceryProducts> createState() => _GroceryProductsState();
}

class _GroceryProductsState extends State<GroceryProducts> {
  bool isSortVisible = false;
  bool isFilterVisible = false;
  double heightFilterSection = 72.h;
  final Logger logger = Logger();

  void _toggleSort() {
    setState(() {
      isSortVisible = !isSortVisible;
      if (isFilterVisible) isFilterVisible = !isFilterVisible;
    });
  }

  void _toggleFilter() {
    setState(() {
      isFilterVisible = !isFilterVisible;
      if (isSortVisible) isSortVisible = !isSortVisible;
    });
  }

  void _closeSortFilter() {
    setState(() {
      isSortVisible = false;
      isFilterVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double topOfCloseButton = 300.h;
    if (isSortVisible) {
      topOfCloseButton = 300.h;
    }
    if (isFilterVisible) {
      topOfCloseButton = 554.h;
    }
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.baseGreyColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                GroceryAppBar(
                  key: const Key("custom_app_bar"),
                  title: widget.categoryId,
                ),
                Expanded(
                  child: GroceryContent(
                    products: groceryProductsCategoriesData,
                    vendor: widget.vendor,
                  ),
                ),
                SizedBox(
                  height: 72.h,
                )
              ],
            ),
          ),
          if (isSortVisible || isFilterVisible)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.7),
                width: double.infinity,
                height: double.infinity,
                // Add your widget content here
              ),
            ),
          if (isSortVisible || isFilterVisible)
            Positioned(
              left: (MediaQuery.of(context).size.width - 2) / 2 - 20,
              bottom: topOfCloseButton,
              child: GestureDetector(
                onTap: _closeSortFilter,
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          if (isSortVisible || isFilterVisible)
            Positioned(
                left: 0,
                right: 0,
                bottom: heightFilterSection,
                child: Container(
                  height: 2.h,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.colorE4E4E4,
                )),
          if (isSortVisible)
            SortSection(
              onCloseSortFilter: _closeSortFilter,
            ),
          if (isFilterVisible)
            FilterSection(
              onCloseSortFilter: _closeSortFilter,
            ),
          SortFilterButtonSection(
            toggleSort: _toggleSort,
            isFilterVisible: isFilterVisible,
            isSortVisible: isSortVisible,
            toggleFilter: _toggleFilter,
          ),
        ],
      ),
    ));
  }
}

class SortFilterButtonSection extends StatelessWidget {
  const SortFilterButtonSection({
    Key? key,
    required this.isSortVisible,
    required this.isFilterVisible,
    required this.toggleSort,
    required this.toggleFilter,
  }) : super(key: key);

  final bool isSortVisible;
  final bool isFilterVisible;
  final VoidCallback toggleSort;
  final VoidCallback toggleFilter;
  @override
  Widget build(BuildContext context) {
    Color selectedColorFilter = Colors.black;
    Color selectedColorSort = Colors.black;
    double heightFilterSection = 72.h;
    if (isSortVisible) {
      selectedColorSort =
          AppColors.color20A39E; // Change the color based on your requirement
    }
    if (isFilterVisible) {
      selectedColorFilter =
          AppColors.color20A39E; // Change the color based on your requirement
    }
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: heightFilterSection,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: toggleSort,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            const AssetImage('assets/images/icons/sort.png'),
                            size: 24.r,
                            color: selectedColorSort,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'SORT',
                            style: TextStyle(
                              color: selectedColorSort,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: toggleFilter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            const AssetImage('assets/images/icons/Filter.png'),
                            size: 24.r,
                            color: selectedColorFilter,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'FILTER',
                            style: TextStyle(
                              color: selectedColorFilter,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.2 * heightFilterSection,
              bottom: 0.2 * heightFilterSection,
              left: (MediaQuery.of(context).size.width - 2) / 2,
              child: Container(
                width: 2,
                height: 0.6 * heightFilterSection,
                color: AppColors.colorE4E4E4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
