import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({Key? key, required this.onCloseSortFilter})
      : super(key: key);
  final VoidCallback onCloseSortFilter;
  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  List<String> categories = [
    'Cloths',
    'Bags',
    'Belts',
    'Shoes',
    'Beauty',
  ];
  String selectedCategory = "none";

  RangeValues priceRange = const RangeValues(0, 100);
  double minPrice = 0;
  double maxPrice = 100;

  List<Color> circleColors = [
    const Color(0xFF6FD0D7),
    const Color(0xFFAEDB8A),
    const Color(0xFFFF8974),
    const Color(0xFFEB91E8),
    const Color(0xFFFA9124),
  ];
  double circleRadius = 20.r;
  double circleGap = 15.w;
  double centerCircleRadius = 7.r;
  int selectedCircleIndex = -1;

  @override
  Widget build(BuildContext context) {
    double heightFilterSection = 72.h;
    return Positioned(
      height: 454.h,
      left: 0,
      right: 0,
      bottom: heightFilterSection + 2.h,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  'FILTERS',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: widget.onCloseSortFilter,
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.color20A39E,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              height: 1.h,
              color: Colors.grey[300],
            ),
            SizedBox(height: 10.h),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.w,
              children: categories.map((category) {
                final bool isSelected = category == selectedCategory;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = isSelected ? "" : category;
                    });
                  },
                  child: Container(
                    width: 93.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.color20A39E : Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: isSelected ? AppColors.color20A39E : Colors.grey,
                        width: 1.w,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
            Text(
              'Price Range',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    RangeSlider(
                      values: priceRange,
                      min: minPrice,
                      max: maxPrice,
                      onChanged: (values) {
                        setState(() {
                          priceRange = values;
                        });
                      },
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      labels: RangeLabels(
                        '\$${priceRange.start.toStringAsFixed(0)}',
                        '\$${priceRange.end.toStringAsFixed(0)}',
                      ),
                      divisions: 10,
                    ),
                    Positioned(
                      top: 0,
                      left: priceRange.start / maxPrice * width - 12.w,
                      child: Text(
                        '\$${priceRange.start.toStringAsFixed(0)}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: priceRange.end / maxPrice * width - 12.w,
                      child: Text(
                        '\$${priceRange.end.toStringAsFixed(0)}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20.h),
            Text(
              'Color',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: circleRadius * 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: circleColors.length,
                itemBuilder: (context, index) {
                  final color = circleColors[index];
                  final isSelected = selectedCircleIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCircleIndex = isSelected ? -1 : index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 0 : circleGap,
                        right: index == circleColors.length - 1 ? 0 : circleGap,
                      ),
                      width: circleRadius * 2,
                      height: circleRadius * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: centerCircleRadius * 2,
                                height: centerCircleRadius * 2,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
