// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:halen_customer_app/constants/colors.dart';
// import 'package:halen_customer_app/screens/grocery/components/grocery_appbar/grocery_app_bar.dart';
// import 'package:halen_customer_app/screens/grocery/data.dart';
// import 'package:halen_customer_app/screens/grocery/models.dart';
// import 'package:halen_customer_app/screens/grocery/components/grocery_search/product_card_grocery_one.dart';
// import 'package:halen_customer_app/widgets/search_text_input.dart';
// import 'package:logger/logger.dart';
//
// class GrocerySearch extends StatefulWidget {
//   const GrocerySearch({super.key});
//
//   @override
//   State<GrocerySearch> createState() => _GrocerySearchState();
// }
//
// class _GrocerySearchState extends State<GrocerySearch> {
//   final Logger logger = Logger();
//   final TextEditingController _searchController = TextEditingController();
//   bool searched = false;
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void performSearch(String searchText) {
//     // Handle the search operation using the searchText
//     // Example: Trigger API call or update search results
//
//     logger.d('Search Text: $searchText');
//     setState(() {
//       if (searchText != "") {
//         searched = true;
//       } else {
//         searched = false;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.baseGreyColor,
//         body: Column(children: [
//           const GroceryAppBar(
//             title: 'Search',
//           ),
//           Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SearchInputBar(
//                       textController:_searchController,
//                       searchCB: performSearch
//                     ),
//                     SizedBox(
//                       height: 40.h,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           !searched
//                               ? "Past Searches"
//                               : "Stores delivering Banana",
//                           style: TextStyle(
//                             color: AppColors.color20A39E,
//                             fontSize: 18.sp,
//                           ),
//                         ),
//                         if (!searched)
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.centerRight,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   // Handle the clear action here
//                                 },
//                                 child: Text(
//                                   "clear",
//                                   style: TextStyle(
//                                     color: AppColors.color20A39E,
//                                     fontSize: 12.sp,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10.h,
//                     ),
//                     Container(
//                       height: 1,
//                       width: MediaQuery.of(context).size.width,
//                       color: AppColors.grey300,
//                     ),
//                   ])),
//           Expanded(
//               child: SingleChildScrollView(
//             child: searched
//                 ? buildMultipleStoreData(context, 5)
//                 : buildMultiplebuildStoreSearchHistory(context, 5),
//           ))
//         ]));
//   }
// }
//
// Widget buildMultiplebuildStoreSearchHistory(BuildContext context, int count) {
//   return Padding(
//       padding: EdgeInsets.only(left: 20.w, right: 20.w),
//       child: Column(
//         children:
//             List.generate(count, (index) => buildStoreSearchHistoryItem()),
//       ));
// }
//
// Widget buildStoreSearchHistoryItem() {
//   return Container(
//     height: 50.h,
//     margin: EdgeInsets.only(bottom: 10.h),
//     padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Image.asset(
//           'assets/images/grocery/banana.png', // Replace with your image path
//           width: 34,
//           height: 34,
//         ),
//         SizedBox(
//           width: 10.w,
//         ),
//         Text(
//           "Banana",
//           style: TextStyle(
//               color: AppColors.appBarColor,
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w600),
//         )
//       ],
//     ),
//   );
// }
//
// Widget buildMultipleStoreData(BuildContext context, int count) {
//   return Padding(
//       padding: EdgeInsets.only(left: 20.w, right: 20.w),
//       child: Column(
//         children: List.generate(
//             count,
//             (index) =>
//                 buildStoreData(context, multipleGroceryProductsData[count])),
//       ));
// }
//
// Widget buildStoreData(BuildContext context, List<GroceryProduct> products) {
//   return Container(
//       height: 300.h,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.r),
//       ),
//       margin: EdgeInsets.only(bottom: 20.h),
//       padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Ristorente Grill & More",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       SizedBox(
//                         width: 16.w,
//                       ),
//                       Container(
//                         height: 20.h,
//                         width: 44.w,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(6.r),
//                           border: Border.all(
//                             width: 1, // Set the border width to 2 pixels
//                             color: AppColors
//                                 .grey400, // Set the border color to red
//                           ),
//                         ),
//                         child: Center(
//                             child: Row(
//                           mainAxisAlignment: MainAxisAlignment
//                               .center, // Center the row horizontally
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               Icons.star,
//                               size: 10,
//                               color: Colors.yellow,
//                             ),
//                             SizedBox(width: 5.w),
//                             Text(
//                               '4.7',
//                               style: TextStyle(
//                                   color: AppColors.grey400, fontSize: 10.sp),
//                             ),
//                           ],
//                         )),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 4.h,
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.location_on_outlined,
//                         size: 20,
//                         color: AppColors.grey500,
//                       ),
//                       Text(
//                         "856 Esta Underpass",
//                         style: TextStyle(
//                             fontSize: 12.sp,
//                             color: AppColors.grey500,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Column(
//                 children: [
//                   Container(
//                     height: 20.h,
//                     width: 88.w,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6.r),
//                       border: Border.all(
//                         width: 1, // Set the border width to 2 pixels
//                         color: AppColors.grey400, // Set the border color to red
//                       ),
//                     ),
//                     child: Center(
//                         child: Row(
//                       mainAxisAlignment: MainAxisAlignment
//                           .center, // Center the row horizontally
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.access_time_outlined,
//                           size: 16.r,
//                           color: AppColors.color20A39E,
//                         ),
//                         SizedBox(width: 3.w),
//                         Text(
//                           '15 - 30 mins',
//                           style: TextStyle(
//                               color: AppColors.grey500, fontSize: 8.sp),
//                         ),
//                       ],
//                     )),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Container(
//                     height: 20.h,
//                     width: 88.w,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6.r),
//                       border: Border.all(
//                         width: 1, // Set the border width to 2 pixels
//                         color: AppColors.grey400, // Set the border color to red
//                       ),
//                     ),
//                     child: Center(
//                         child: Row(
//                       mainAxisAlignment: MainAxisAlignment
//                           .center, // Center the row horizontally
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.star,
//                           size: 16.r,
//                           color: AppColors.color20A39E,
//                         ),
//                         SizedBox(width: 3.w),
//                         Text(
//                           '\$0 Delivery Fee',
//                           style: TextStyle(
//                               color: AppColors.grey500, fontSize: 8.sp),
//                         ),
//                       ],
//                     )),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           SizedBox(height: 7.h),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   for (int i = 0; i < products.length; i++)
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.of(context).push(MaterialPageRoute(
//                         //   builder: (context) {
//                         //     return RetailProductDetail(
//                         //       productId: products[i].id,
//                         //       product: products[i],
//                         //       vendor:
//                         //     );
//                         //   },
//                         // ));
//                       },
//                       child: Row(
//                         children: [
//                           ProductCardSearchOne(product: products[i]),
//                           if (i < products.length - 1)
//                             SizedBox(
//                                 width: 10.w), // Set the desired gap width here
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ));
// }
