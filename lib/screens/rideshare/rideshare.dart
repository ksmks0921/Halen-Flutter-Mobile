// import 'package:flutter/material.dart';
// import 'package:halen_customer_app/screens/rideshare/rideshare_home.dart';
// import 'package:halen_customer_app/routes/route_constants.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:halen_customer_app/appstate/home_page_state.dart';
//
// class RideshareWidget extends ConsumerStatefulWidget {
//   const RideshareWidget({Key? rideshareWidget}) : super(key: rideshareWidget);
//
//   @override
//   RideshareWidgetState createState() => RideshareWidgetState();
// //late bool hasLocationPermission = false;
// }
//
// class RideshareWidgetState extends ConsumerState<RideshareWidget> {
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
//                     height: height * .4,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image:
//                             AssetImage('assets/images/ridesharing/Frame 6.png'),
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
//                         Navigator.pop(context);
//                         ref.read(navStateProvider.notifier).state = 0;
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
//                 ],
//               ),
//               Container(
//                 height: height * .6,
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
//                                                     .fromSTEB(0, 15, 0, 0),
//                                                 child: Row(
//                                                   mainAxisSize:
//                                                       MainAxisSize.max,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Text(
//                                                       'Where are you going?',
//                                                       style: TextStyle(
//                                                         color:
//                                                             Color(0xFF444444),
//                                                         fontSize: 15,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                             0, 15, 0, 15),
//                                                     child: ClipRRect(
//                                                       child: Image.asset(
//                                                         'assets/images/ridesharing/Where are you going today.png',
//                                                         width: 300,
//                                                         height: 100,
//                                                         fit: BoxFit.contain,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisSize: MainAxisSize.max,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                             25, 0, 5, 0),
//                                                     child: ElevatedButton.icon(
//                                                       style: ButtonStyle(
//                                                         elevation:
//                                                             MaterialStateProperty
//                                                                 .all<double>(0),
//                                                         foregroundColor:
//                                                             MaterialStateProperty
//                                                                 .all<Color>(
//                                                                     Colors
//                                                                         .white),
//                                                         backgroundColor:
//                                                             MaterialStateProperty
//                                                                 .all<Color>(
//                                                           const Color(
//                                                               0xFF63BCB9),
//                                                         ),
//                                                         shape: MaterialStateProperty
//                                                             .all<
//                                                                 RoundedRectangleBorder>(
//                                                           RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10.0), // Adjust the radius as needed
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       icon: const Icon(
//                                                           Icons.bookmark_sharp),
//                                                       onPressed: () {},
//                                                       label: const Text('Home'),
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                             25, 0, 5, 0),
//                                                     child: ElevatedButton.icon(
//                                                       style: ButtonStyle(
//                                                         elevation:
//                                                             MaterialStateProperty
//                                                                 .all<double>(0),
//                                                         backgroundColor:
//                                                             MaterialStateProperty
//                                                                 .all<Color>(
//                                                                     Colors
//                                                                         .white),
//                                                         shape: MaterialStateProperty
//                                                             .all<
//                                                                 RoundedRectangleBorder>(
//                                                           RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         10.0),
//                                                             side: BorderSide(
//                                                               color: Colors.grey
//                                                                   .shade300,
//                                                               width: 1.0,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       icon: const Icon(
//                                                         Icons.bookmark_sharp,
//                                                         color: Colors.grey,
//                                                       ),
//                                                       onPressed: () {},
//                                                       label: const Text(
//                                                         'Office',
//                                                         style: TextStyle(
//                                                             color: Colors.grey),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsetsDirectional
//                                                                 .fromSTEB(
//                                                             25, 0, 5, 0),
//                                                     child: ElevatedButton.icon(
//                                                       style: ButtonStyle(
//                                                         elevation:
//                                                             MaterialStateProperty
//                                                                 .all<double>(0),
//                                                         backgroundColor:
//                                                             MaterialStateProperty
//                                                                 .all<Color>(
//                                                                     Colors
//                                                                         .white),
//                                                         shape: MaterialStateProperty
//                                                             .all<
//                                                                 RoundedRectangleBorder>(
//                                                           RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         80.0),
//                                                             side: BorderSide(
//                                                               color: Colors.grey
//                                                                   .shade300,
//                                                               width: 1.0,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         padding:
//                                                             MaterialStateProperty
//                                                                 .all<
//                                                                     EdgeInsetsDirectional>(
//                                                           const EdgeInsetsDirectional
//                                                                   .fromSTEB(
//                                                               10, 0, 0, 0),
//                                                         ),
//                                                       ),
//                                                       icon: const Icon(
//                                                         Icons
//                                                             .keyboard_arrow_right,
//                                                         color: Colors.grey,
//                                                       ),
//                                                       onPressed: () {},
//                                                       label: const Text(
//                                                         '',
//                                                         style: TextStyle(
//                                                             color: Colors.grey),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SingleChildScrollView(
//                                                 child: Column(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   10, 0, 0, 0),
//                                                       child: Row(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Column(
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Padding(
//                                                                 padding:
//                                                                     EdgeInsetsDirectional
//                                                                         .fromSTEB(
//                                                                             0,
//                                                                             20,
//                                                                             0,
//                                                                             20),
//                                                                 child: Row(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   children: [
//                                                                     Column(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .max,
//                                                                       children: [
//                                                                         Padding(
//                                                                           padding: EdgeInsetsDirectional.fromSTEB(
//                                                                               0,
//                                                                               0,
//                                                                               10,
//                                                                               0),
//                                                                           child:
//                                                                               Icon(
//                                                                             Icons.access_time,
//                                                                             color:
//                                                                                 Color(0xFFD8D7D7),
//                                                                             size:
//                                                                                 24,
//                                                                           ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                     Column(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .max,
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         Text(
//                                                                           'Steak Restaurant',
//                                                                           style:
//                                                                               TextStyle(
//                                                                             color:
//                                                                                 Colors.grey,
//                                                                           ),
//                                                                         ),
//                                                                         Row(
//                                                                           mainAxisSize:
//                                                                               MainAxisSize.max,
//                                                                           children: [
//                                                                             Text(
//                                                                               '8 Norman St, East Dallas, NSW 2010',
//                                                                               style: TextStyle(
//                                                                                 color: Colors.grey,
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(
//                                                                   10, 0, 0, 0),
//                                                       child: Row(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Column(
//                                                             mainAxisSize:
//                                                                 MainAxisSize
//                                                                     .max,
//                                                             children: [
//                                                               Padding(
//                                                                 padding:
//                                                                     EdgeInsetsDirectional
//                                                                         .fromSTEB(
//                                                                             0,
//                                                                             20,
//                                                                             0,
//                                                                             20),
//                                                                 child: Row(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   children: [
//                                                                     Column(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .max,
//                                                                       children: [
//                                                                         Padding(
//                                                                           padding: EdgeInsetsDirectional.fromSTEB(
//                                                                               0,
//                                                                               0,
//                                                                               10,
//                                                                               0),
//                                                                           child:
//                                                                               Icon(
//                                                                             Icons.access_time,
//                                                                             color:
//                                                                                 Color(0xFFD8D7D7),
//                                                                             size:
//                                                                                 24,
//                                                                           ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                     Column(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .max,
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: [
//                                                                         Text(
//                                                                           'Melbourne Park',
//                                                                           style:
//                                                                               TextStyle(
//                                                                             color:
//                                                                                 Colors.grey,
//                                                                           ),
//                                                                         ),
//                                                                         Row(
//                                                                           mainAxisSize:
//                                                                               MainAxisSize.max,
//                                                                           children: [
//                                                                             Text(
//                                                                               '127 Station St, Dallas, 3207',
//                                                                               style: TextStyle(
//                                                                                 color: Colors.grey,
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsetsDirectional
//                                                                   .fromSTEB(
//                                                               10, 0, 10, 0),
//                                                       child: ElevatedButton(
//                                                         style: ButtonStyle(
//                                                           elevation:
//                                                               MaterialStateProperty
//                                                                   .all<double>(
//                                                                       0),
//                                                           foregroundColor:
//                                                               MaterialStateProperty
//                                                                   .all<Color>(
//                                                                       Colors
//                                                                           .white),
//                                                           backgroundColor:
//                                                               MaterialStateProperty
//                                                                   .all<Color>(
//                                                             const Color(
//                                                                 0xFF63BCB9),
//                                                           ),
//                                                         ),
//                                                         onPressed: () async {},
//                                                         child: const Text(
//                                                           'CONFIRM DESTINATION',
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
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
