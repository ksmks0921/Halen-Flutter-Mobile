// import 'package:flutter/material.dart';
// import 'package:halen_customer_app/screens/homepage/homepage_screen.dart';
// import 'package:halen_customer_app/screens/rideshare/rideshare.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:halen_customer_app/appstate/home_page_state.dart';
//
// class RideshareHomeWidget extends ConsumerStatefulWidget {
//   const RideshareHomeWidget({Key? rideshareWidget})
//       : super(key: rideshareWidget);
//
//   @override
//   RideshareHomeWidgetState createState() => RideshareHomeWidgetState();
// }
//
// class RideshareHomeWidgetState extends ConsumerState<RideshareHomeWidget> {
//   late double height, width;
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: height * .45,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(
//                             'assets/images/ridesharing/Frame 6-1.png'),
//                         fit: BoxFit.cover,
//                       ),
//                       color: Colors.black,
//                     ),
//                   ),
//                   Positioned(
//                     top: 40.0,
//                     left: 15.0,
//                     child: SizedBox(
//                       width: 40,
//                       height: 40,
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           ref.read(navStateProvider.notifier).state = 0;
//                         },
//                         backgroundColor: const Color(0xFF63BCB9),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                           child: Icon(Icons.arrow_back_ios),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 0.0,
//                     left: 100.0,
//                     child: Image.asset(
//                       'assets/images/ridesharing/Your Pickup Point & Destination.png',
//                       width: 250,
//                       height: 150,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 height: height * .55,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     const Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [],
//                     ),
//                     Padding(
//                       padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Card(
//                               clipBehavior: Clip.antiAliasWithSaveLayer,
//                               elevation: 0,
//                               shape: const RoundedRectangleBorder(
//                                   //borderRadius: BorderRadius.circular(8),
//                                   ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Column(
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: [
//                                           Column(
//                                             mainAxisSize: MainAxisSize.max,
//                                             children: [
//                                               const Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 15, 0, 5),
//                                                 child: Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Text(
//                                                       'Choose your ride',
//                                                       style: TextStyle(
//                                                         color:
//                                                             Color(0xFF444444),
//                                                         fontSize: 15,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               const Padding(
//                                                 padding: EdgeInsets.fromLTRB(
//                                                     0, 0, 0, 0),
//                                                 child: DefaultTabController(
//                                                   length: 3,
//                                                   initialIndex: 0,
//                                                   child: Column(
//                                                     children: [
//                                                       Align(
//                                                         alignment:
//                                                             Alignment(0, 0),
//                                                         child: TabBar(
//                                                           labelColor:
//                                                               Colors.black,
//                                                           unselectedLabelColor:
//                                                               Colors.grey,
//                                                           indicatorColor:
//                                                               Colors.black,
//                                                           tabs: [
//                                                             Tab(
//                                                               text: 'Economy',
//                                                             ),
//                                                             Tab(
//                                                               text: 'Luxury',
//                                                             ),
//                                                             Tab(
//                                                               text: 'Taxicab',
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(0, 20, 0, 0),
//                                                 child: ClipRRect(
//                                                   child: Image.asset(
//                                                     'assets/images/ridesharing/Economy Car.png',
//                                                     width: 400,
//                                                     height: 150,
//                                                     fit: BoxFit.contain,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(0, 5, 0, 0),
//                                                 child: ClipRRect(
//                                                   child: Image.asset(
//                                                     'assets/images/ridesharing/cardInfo.png',
//                                                     width: 350,
//                                                     height: 45,
//                                                     fit: BoxFit.contain,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsetsDirectional
//                                                         .fromSTEB(0, 0, 0, 0),
//                                                 child: ClipRRect(
//                                                   child: GestureDetector(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                           context,
//                                                           MaterialPageRoute(
//                                                               builder: (context) =>
//                                                                   const RideshareWidget()));
//                                                     },
//                                                     child: Image.asset(
//                                                       'assets/images/ridesharing/Book my ride Button.png',
//                                                       width: 350,
//                                                       height: 50,
//                                                       fit: BoxFit.contain,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
