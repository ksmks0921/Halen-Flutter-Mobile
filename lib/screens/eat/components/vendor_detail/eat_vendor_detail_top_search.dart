import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/widgets/search_text_input.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';
import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/models/service_types.dart';

class EatVendorDetailTopSearch extends StatefulWidget {
  const EatVendorDetailTopSearch(
      {super.key,
      required this.deliveryFee,
      required this.rating,
      required this.distanceMinutes,
      required this.numUsersBought});

  final String deliveryFee;
  final String rating;
  final String distanceMinutes;
  final String numUsersBought;

  @override
  State<EatVendorDetailTopSearch> createState() =>
      _EatVendorDetailTopSearchState();
}

class _EatVendorDetailTopSearchState extends State<EatVendorDetailTopSearch> {
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
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MainTabItemSearch(
          products: allEatProducts,
          serviceType: ServiceType.eat,
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.greenColor,
        child: Column(children: [
          // Section 1: Three items aligned horizontally
          Container(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Item 1: Rate item
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.starIconColor,
                          size: 17.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          widget.rating,
                          style: TextStyle(
                            color: AppColors.bgdDefTextColor,
                            fontSize: 13.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Item 2: Distance and time item
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_car,
                          color: Colors.white,
                          size: 17.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          widget.distanceMinutes,
                          style: TextStyle(
                            color: AppColors.bgdDefTextColor,
                            fontSize: 13.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Item 3: Save item
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.people_outline,
                          color: Colors
                              .white, // Replace with your desired icon color
                          size: 17,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.numUsersBought,
                          style: TextStyle(
                              fontSize: 13.h, color: AppColors.bgdDefTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Section 2: Search bar
          SearchInputLink(
            focusNode: _searchFocusNode,
          )

          //       Container(
          //         padding: EdgeInsets.all(20.h),
          //         child: SizedBox(
          //           height: 36.h,
          //           child: TextField(
          // onTap:(){
          // Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) {
          // return EatSearchScreen(
          // );
          // },
          // ));
          // },
          //             decoration: InputDecoration(
          //               hintText: 'Search',
          //
          //               prefixIcon: const Icon(Icons.search),
          //               filled: true,
          //               fillColor: Colors.white, // Set the background color to white
          //               contentPadding: const EdgeInsets.symmetric(vertical: -2.0),
          //               enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(6.0),
          //                 borderSide: const BorderSide(width: 2, color: Colors.white),
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
        ]));
  }
}
