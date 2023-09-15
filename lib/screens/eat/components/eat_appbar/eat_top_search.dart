import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/eat/components/eat_search/eat_home_filters_screen.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'package:halen_customer_app/screens/eat/components/eat_search/eat_rating_modal_content.dart';
import 'package:halen_customer_app/widgets/search_text_input.dart';
import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';

class EatTopSearch extends StatefulWidget {
  const EatTopSearch({super.key});

  @override
  State<EatTopSearch> createState() => _EatTopSearchState();
}

class _EatTopSearchState extends State<EatTopSearch> {
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
    TextStyle filterButtonTS;
    filterButtonTS =
        TextStyle(color: AppColors.primaryColor1, fontSize: .016.sh);
    return SizedBox(
        child: Column(children: [
      SearchInputLink(
        focusNode: _searchFocusNode,
      ),
      SizedBox(
        height: 12.h,
      ),
      // Adds spacing around buttons
      SizedBox(
          width: 1.sh,
          height: .051.sh,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            EatHomeFilterButton(
                labelItems: [Text("Sort & Filter", style: filterButtonTS)],
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const EatHomeFiltersScreen();
                  }));
                }),
            EatHomeFilterButton(
                labelItems: [
                  Text("Rating", style: filterButtonTS),
                  Icon(Icons.star, color: AppColors.starIconColor),
                  Icon(Icons.arrow_drop_down, color: AppColors.primaryColor1)
                ],
                onTap: () {
                  showModalBottomSheetFloatClose(
                      context, const EatRatingBottomSheetContent());
                }),
            EatHomeFilterButton(labelItems: [
              Text("Vegetarian", style: filterButtonTS),
              Icon(Icons.arrow_drop_down, color: AppColors.primaryColor1)
            ], onTap: () {}),
            EatHomeFilterButton(labelItems: [
              Text("Best Value", style: filterButtonTS),
              Icon(Icons.arrow_drop_down, color: AppColors.primaryColor1)
            ], onTap: () {})
          ])),
    ]));
  }
}

class EatHomeFilterButton extends StatelessWidget {
  const EatHomeFilterButton(
      {Key? key, required this.labelItems, required this.onTap})
      : super(key: key);

  final List<Widget> labelItems;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 24.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(.02.sw)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: labelItems,
              ),
            )));
  }
}
