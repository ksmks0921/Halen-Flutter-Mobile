// import 'package:flutter/material.dart';
// import 'package:halen_customer_app/constants/colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:halen_customer_app/screens/eat/components/eat_appbar/eat_appbar_cart.dart';
// import 'package:halen_customer_app/widgets/search_text_input.dart';
//
// class EatSearchScreen extends StatefulWidget {
//   const EatSearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<EatSearchScreen> createState() => _EatSearchScreenState();
// }
//
// class _EatSearchScreenState extends State<EatSearchScreen> {
//   List<Map> pastSearches = [
//     {"search_name": "Ceaser Salad"},
//     {"search_name": "Chicken"},
//     {"search_name": "Soup"},
//     {"search_name": "Snacks"},
//     {"search_name": "French"},
//     {"search_name": "Pasta"},
//     {"search_name": "Fast"},
//     {"search_name": "Sushi"},
//     {"search_name": "Shrimp"},
//     {"search_name": "Cheapest"},
//     {"search_name": "Grill"},
//     {"search_name": "Vegetarian"}
//   ];
//
//   clearCB() {
//     setState(() {
//       pastSearches = [];
//     });
//   }
//
//   final TextEditingController _searchController = TextEditingController();
//   bool searched = false;
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void performSearch(String searchText) {
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
//         // color: AppColors.greenColor,
//         body: Column(children: [
//       const EatCartAppBar(
//         title: "Search",
//         showCartAction: false,
//       ),
//       SearchInputBar(
//         textController: _searchController,
//         searchCB: performSearch,
//       ),
//       Expanded(
//           child: ListView.builder(
//               itemCount: pastSearches.length + 1,
//               itemBuilder: (BuildContext context, int index) {
//                 if (pastSearches.isEmpty) {
//                   return const SearchesNothingHere();
//                 } else {
//                   if (index == 0) {
//                     return SearchesHeader(
//                       clearCB: clearCB,
//                     );
//                   }
//                   return EatSearchesLVI(searchData: pastSearches[index - 1]);
//                 }
//               }))
//     ]));
//   }
// }
//
// class EatSearchesLVI extends StatelessWidget {
//   const EatSearchesLVI({Key? key, required this.searchData}) : super(key: key);
//
//   final Map searchData;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.all(20.w),
//         child: Row(
//           children: [
//             Text(
//               searchData["search_name"],
//               style:
//                   TextStyle(color: AppColors.bglDefTextColor, fontSize: 20.h),
//             )
//           ],
//         ));
//   }
// }
//
// class SearchesHeader extends StatelessWidget {
//   const SearchesHeader({Key? key, required this.clearCB}) : super(key: key);
//
//   final Function clearCB;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.all(20.0.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Past Searches",
//               style: TextStyle(color: AppColors.primaryColor1, fontSize: 24.h),
//             ),
//             InkWell(
//                 onTap: () {
//                   clearCB();
//                 },
//                 child: Text(
//                   "Clear",
//                   style:
//                       TextStyle(color: AppColors.primaryColor1, fontSize: 18.h),
//                 ))
//           ],
//         ));
//   }
// }
//
// class SearchesNothingHere extends StatelessWidget {
//   const SearchesNothingHere({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Nothing here yet",
//           style: TextStyle(color: Colors.black),
//         )
//       ],
//     );
//   }
// }
