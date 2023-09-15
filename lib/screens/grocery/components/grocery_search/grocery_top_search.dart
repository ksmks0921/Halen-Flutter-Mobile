import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/models/service_types.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/search/main_tab_search.dart';

class GroceryTopSearch extends StatefulWidget {
  const GroceryTopSearch(
      {super.key,
      // required this.avgShippingPrice,
      required this.deliveryTime,
      required this.rating,
      required this.numUsersBought});

  // final String avgShippingPrice;
  final String deliveryTime;
  final String rating;
  final String numUsersBought;

  @override
  State<GroceryTopSearch> createState() => _GroceryTopSearchState();
}

class _GroceryTopSearchState extends State<GroceryTopSearch> {
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
            products: allGroceryProducts,
            serviceType: ServiceType.grocery,
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.greenColor,
        child: Column(children: [
          // Section 1: Three items aligned horizontally
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Item 1: Rate item
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Align widgets at the center horizontally
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 17,
                        ),

                        const SizedBox(
                            width:
                                5), // Optional spacing between the Icon and Text
                        Text(
                          widget.rating,
                          style: TextStyle(
                              fontSize: 12.h, color: AppColors.bgdDefTextColor),
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
                              fontSize: 12.h, color: AppColors.bgdDefTextColor),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.av_timer_sharp,
                          size: 13.h,
                          color: Colors.white,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Text(
                              widget.deliveryTime,
                              style: TextStyle(
                                  fontSize: 12.h,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Section 2: Search bar
          Container(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 36.0,
              child: TextField(
                focusNode: _searchFocusNode,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white, // Set the background color to white
                  contentPadding: const EdgeInsets.symmetric(vertical: -2.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
