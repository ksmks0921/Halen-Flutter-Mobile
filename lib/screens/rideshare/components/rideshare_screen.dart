// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:halen_customer_app/constants/colors.dart';
// import 'package:halen_customer_app/constants/constants.dart';
// import 'package:halen_customer_app/screens/rideshare/components/cancel_ride_sheet.dart';
// import 'package:halen_customer_app/screens/rideshare/components/choose_your_rideshare.dart';
// import 'package:halen_customer_app/screens/rideshare/components/confirm_pickup_spot.dart';
// import 'package:halen_customer_app/screens/rideshare/components/destination_sheet.dart';
// import 'package:halen_customer_app/screens/rideshare/components/driver_on_the_way_sheet.dart';
// import 'package:halen_customer_app/screens/rideshare/components/driver_profile_widget.dart';
// import 'package:halen_customer_app/screens/rideshare/components/review_driver.dart';
// import 'package:halen_customer_app/screens/rideshare/components/ride_requested_sheet.dart';
// import 'package:halen_customer_app/screens/rideshare/components/trip_detail_sheet.dart';
// import 'package:halen_customer_app/screens/rideshare/components/locations_search_bar.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
//
// class RideShareScreen extends StatefulWidget {
//   const RideShareScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RideShareScreen> createState() => _RideShareScreenState();
// }
//
// class _RideShareScreenState extends State<RideShareScreen> {
//   bool showDestinationSheet = false;
//   bool showChooseYourRideSheet = false;
//   bool showConfirmPickUpSpotSheet = false;
//   bool showRideRequestedSheet = false;
//   bool showDriverOnTheWaySheet = false;
//   bool showCancelRideSheet = false;
//   bool showTripDetailSheet = false;
//   bool showReviewDriver = false;
//   Position? position;
//   GoogleMapController? mapController;
//
//   @override
//   void initState() {
//     getLocation();
//     showDestinationSheet = true;
//     showChooseYourRideSheet = false;
//     showConfirmPickUpSpotSheet = false;
//     showRideRequestedSheet = false;
//     showDriverOnTheWaySheet = false;
//     showCancelRideSheet = false;
//     showTripDetailSheet = false;
//     showReviewDriver = false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return position == null
//         ? const Scaffold(
//             body: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ],
//             ),
//           )
//         : GestureDetector(
//             onTap: () {
//               FocusScope.of(context).requestFocus(FocusNode());
//             },
//             child: Scaffold(
//               backgroundColor: AppColors.greyShade600,
//               resizeToAvoidBottomInset: false,
//               bottomNavigationBar: const CustomNavigationBar(),
//               body: Stack(
//                 children: [
//                   Positioned(
//                     child: LayoutBuilder(builder:
//                         (BuildContext context, BoxConstraints contraints) {
//                       return SizedBox(
//                           height: contraints.maxHeight,
//                           child: GoogleMap(
//                             myLocationEnabled: true,
//                             initialCameraPosition: CameraPosition(
//                                 target: LatLng(
//                                     position!.latitude, position!.longitude),
//                                 zoom: 11.4746),
//                             mapType: MapType.normal,
//                             onMapCreated: _onMapCreated,
//                           ));
//                     }),
//                   ),
//                   DraggableScrollableSheet(
//                     initialChildSize: showDestinationSheet
//                         ? 0.7
//                         : showChooseYourRideSheet
//                             ? 0.6
//                             : showConfirmPickUpSpotSheet
//                                 ? 0.5
//                                 : showDriverOnTheWaySheet
//                                     ? 0.65
//                                     : showCancelRideSheet
//                                         ? 0.7
//                                         : showRideRequestedSheet
//                                             ? 0.45
//                                             : showTripDetailSheet
//                                                 ? 0.65
//                                                 : showReviewDriver
//                                                     ? 1.0
//                                                     : 0.55,
//                     minChildSize: showDestinationSheet
//                         ? 0.7
//                         : showChooseYourRideSheet
//                             ? 0.6
//                             : showConfirmPickUpSpotSheet
//                                 ? 0.5
//                                 : showDriverOnTheWaySheet
//                                     ? 0.65
//                                     : showCancelRideSheet
//                                         ? 0.7
//                                         : showRideRequestedSheet
//                                             ? 0.45
//                                             : showTripDetailSheet
//                                                 ? 0.65
//                                                 : showReviewDriver
//                                                     ? 1.0
//                                                     : 0.55,
//                     maxChildSize: showDestinationSheet
//                         ? 0.7
//                         : showChooseYourRideSheet
//                             ? 0.6
//                             : showConfirmPickUpSpotSheet
//                                 ? 0.5
//                                 : showDriverOnTheWaySheet
//                                     ? 0.65
//                                     : showCancelRideSheet
//                                         ? 0.7
//                                         : showRideRequestedSheet
//                                             ? 0.45
//                                             : showTripDetailSheet
//                                                 ? 0.65
//                                                 : showReviewDriver
//                                                     ? 1.0
//                                                     : 0.55,
//                     builder: (BuildContext context,
//                         ScrollController scrollController) {
//                       return SingleChildScrollView(
//                           controller: scrollController,
//                           child: Container(
//                             height: showDestinationSheet
//                                 ? 0.7 * MediaQuery.of(context).size.height
//                                 : showChooseYourRideSheet
//                                     ? 0.6 * MediaQuery.of(context).size.height
//                                     : showConfirmPickUpSpotSheet
//                                         ? 0.5 *
//                                             MediaQuery.of(context).size.height
//                                         : showDriverOnTheWaySheet
//                                             ? 0.65 *
//                                                 MediaQuery.of(context)
//                                                     .size
//                                                     .height
//                                             : showCancelRideSheet
//                                                 ? 0.7 *
//                                                     MediaQuery.of(context)
//                                                         .size
//                                                         .height
//                                                 : showRideRequestedSheet
//                                                     ? 0.45 *
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .height
//                                                     : showTripDetailSheet
//                                                         ? 0.65 *
//                                                             MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height
//                                                         : showReviewDriver
//                                                             ? 1.0 *
//                                                                 MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .height
//                                                             : 0.55 *
//                                                                 MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .height,
//                             decoration: BoxDecoration(
//                               color: AppColors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15.r),
//                                 topRight: Radius.circular(15.r),
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: 15.h,
//                                 ),
//                                 Visibility(
//                                   visible: !showTripDetailSheet,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         showDestinationSheet
//                                             ? "Where are you going today?"
//                                             : showChooseYourRideSheet
//                                                 ? "Choose your ride"
//                                                 : showConfirmPickUpSpotSheet
//                                                     ? "Confirm pick up spot"
//                                                     : showRideRequestedSheet
//                                                         ? "Ride Requested"
//                                                         : showDriverOnTheWaySheet
//                                                             ? "Driver on the way"
//                                                             : showCancelRideSheet
//                                                                 ? "Why do you want to cancel"
//                                                                 : "",
//                                         style: TextStyle(
//                                             fontSize: 20.sp,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Visibility(
//                                   visible: showDriverOnTheWaySheet,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Arriving in 2 min",
//                                         style: TextStyle(
//                                           color: AppColors.grey500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Visibility(
//                                   visible:
//                                       !showTripDetailSheet && !showReviewDriver,
//                                   child: SizedBox(
//                                     height: 30.h,
//                                     width: double.infinity,
//                                     child: Divider(
//                                       thickness: 3,
//                                       color: AppColors.grey300,
//                                     ),
//                                   ),
//                                 ),
//                                 DestinationSheet(visible: showDestinationSheet),
//                                 ChooseYourRideshareSheet(
//                                     visible: showChooseYourRideSheet),
//                                 ConfirmPickupSpotSheet(
//                                     visible: showConfirmPickUpSpotSheet),
//                                 RideRequestedSheet(
//                                     visible: showRideRequestedSheet),
//                                 DriverOnTheWaySheet(
//                                     visible: showDriverOnTheWaySheet),
//                                 CancelRideSheet(visible: showCancelRideSheet),
//                                 TripDetailSheet(visible: showTripDetailSheet),
//                                 ReviewDriver(visible: showReviewDriver),
//                                 Visibility(
//                                   visible:
//                                       !showTripDetailSheet && !showReviewDriver,
//                                   child: SizedBox(
//                                     height: 30.h,
//                                     width: double.infinity,
//                                     child: Divider(
//                                       thickness: 3,
//                                       color: AppColors.grey300,
//                                     ),
//                                   ),
//                                 ),
//                                 showRideRequestedSheet
//                                     ? Center(
//                                         child: TextButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 if (showRideRequestedSheet ==
//                                                     true) {
//                                                   showDestinationSheet = false;
//                                                   showChooseYourRideSheet =
//                                                       false;
//                                                   showConfirmPickUpSpotSheet =
//                                                       false;
//                                                   showRideRequestedSheet =
//                                                       false;
//                                                   showDriverOnTheWaySheet =
//                                                       true;
//                                                 }
//                                               });
//                                             },
//                                             style: TextButton.styleFrom(
//                                               iconColor: AppColors.grey500,
//                                             ),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 const Icon(Icons.edit_outlined),
//                                                 Text(
//                                                   "Edit ride or payment",
//                                                   style: TextStyle(
//                                                     color: AppColors.grey500,
//                                                   ),
//                                                 ),
//                                               ],
//                                             )),
//                                       )
//                                     : GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             if (showDestinationSheet == true) {
//                                               showDestinationSheet = false;
//                                               showChooseYourRideSheet = true;
//                                               showConfirmPickUpSpotSheet =
//                                                   false;
//                                               showRideRequestedSheet = false;
//                                               showDriverOnTheWaySheet = false;
//                                               showCancelRideSheet = false;
//                                               showReviewDriver = false;
//                                             } else if (showChooseYourRideSheet ==
//                                                 true) {
//                                               showDestinationSheet = false;
//                                               showChooseYourRideSheet = false;
//                                               showConfirmPickUpSpotSheet = true;
//                                               showRideRequestedSheet = false;
//                                               showDriverOnTheWaySheet = false;
//                                               showCancelRideSheet = false;
//                                               showReviewDriver = false;
//                                             } else if (showConfirmPickUpSpotSheet ==
//                                                 true) {
//                                               showDestinationSheet = false;
//                                               showChooseYourRideSheet = false;
//                                               showConfirmPickUpSpotSheet =
//                                                   false;
//                                               showRideRequestedSheet = true;
//                                               showDriverOnTheWaySheet = false;
//                                               showCancelRideSheet = false;
//                                               showReviewDriver = false;
//                                             } else if (showDriverOnTheWaySheet ==
//                                                 true) {
//                                               showDestinationSheet = false;
//                                               showChooseYourRideSheet = false;
//                                               showConfirmPickUpSpotSheet =
//                                                   false;
//                                               showRideRequestedSheet = false;
//                                               showDriverOnTheWaySheet = false;
//                                               showCancelRideSheet = true;
//                                               showReviewDriver = false;
//                                             } else if (showCancelRideSheet ==
//                                                 true) {
//                                               showDestinationSheet = false;
//                                               showChooseYourRideSheet = false;
//                                               showConfirmPickUpSpotSheet =
//                                                   false;
//                                               showRideRequestedSheet = false;
//                                               showDriverOnTheWaySheet = false;
//                                               showCancelRideSheet = false;
//                                               showTripDetailSheet = true;
//                                               showReviewDriver = false;
//                                             } else if (showTripDetailSheet ==
//                                                 true) {
//                                               showDestinationSheet = false;
//                                               showChooseYourRideSheet = false;
//                                               showConfirmPickUpSpotSheet =
//                                                   false;
//                                               showRideRequestedSheet = false;
//                                               showDriverOnTheWaySheet = false;
//                                               showCancelRideSheet = false;
//                                               showTripDetailSheet = false;
//                                               showReviewDriver = true;
//                                             }
//                                           });
//                                         },
//                                         child: Center(
//                                           child: Container(
//                                             alignment: Alignment.center,
//                                             padding: EdgeInsets.only(
//                                                 left: 20.w, right: 20.w),
//                                             margin: EdgeInsets.only(
//                                                 right: 20.w,
//                                                 left: 20.w,
//                                                 bottom: 20.h),
//                                             constraints: BoxConstraints.tight(
//                                                 Size(double.infinity, 49.h)),
//                                             decoration: BoxDecoration(
//                                                 color: AppColors.greenColor,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5.r)),
//                                             child: showDestinationSheet
//                                                 ? Center(
//                                                     child: Text(
//                                                       "CONFIRM DESTINATION",
//                                                       style: TextStyle(
//                                                           fontSize: 14.sp,
//                                                           fontWeight:
//                                                               FontWeight.w500),
//                                                     ),
//                                                   )
//                                                 : showChooseYourRideSheet
//                                                     ? Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Text(
//                                                             "BOOK THIS CAR",
//                                                             style: TextStyle(
//                                                                 fontSize: 14.sp,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500),
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               Text("\$35.50",
//                                                                   style: Constants
//                                                                       .style16White),
//                                                               SizedBox(
//                                                                 width: 10.w,
//                                                               ),
//                                                               Container(
//                                                                 padding:
//                                                                     EdgeInsets
//                                                                         .all(6
//                                                                             .r),
//                                                                 decoration: BoxDecoration(
//                                                                     color: AppColors
//                                                                         .baseGreyColor,
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             5)),
//                                                                 child: Icon(
//                                                                   Icons
//                                                                       .arrow_forward_ios,
//                                                                   color: AppColors
//                                                                       .greenColor,
//                                                                   size: 18,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     : showConfirmPickUpSpotSheet
//                                                         ? Center(
//                                                             child: Text(
//                                                               "CONFIRM AND REQUEST",
//                                                               style: TextStyle(
//                                                                   fontSize:
//                                                                       14.sp,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w500),
//                                                             ),
//                                                           )
//                                                         : showDriverOnTheWaySheet
//                                                             ? Center(
//                                                                 child: Text(
//                                                                   "CANCEL THIS RIDE",
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           14.sp,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w500),
//                                                                 ),
//                                                               )
//                                                             : showReviewDriver
//                                                                 ? Center(
//                                                                     child: Text(
//                                                                       "DONE",
//                                                                       style: TextStyle(
//                                                                           fontSize: 14
//                                                                               .sp,
//                                                                           fontWeight:
//                                                                               FontWeight.w500),
//                                                                     ),
//                                                                   )
//                                                                 : Center(
//                                                                     child: Text(
//                                                                       "SUBMIT",
//                                                                       style: TextStyle(
//                                                                           fontSize: 14
//                                                                               .sp,
//                                                                           fontWeight:
//                                                                               FontWeight.w500),
//                                                                     ),
//                                                                   ),
//                                           ),
//                                         ),
//                                       ),
//                               ],
//                             ),
//                           ));
//                     },
//                   ),
//                   Visibility(
//                     visible: showTripDetailSheet,
//                     child: const Positioned(
//                       child: DriverProfileWidget(),
//                     ),
//                   ),
//                   Visibility(
//                     visible: !showReviewDriver,
//                     child: Positioned(
//                       top: 70.h,
//                       left: 15.w,
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.only(
//                                   top: 8.r,
//                                   left: 12.r,
//                                   bottom: 8.r,
//                                   right: 6.r),
//                               margin: EdgeInsets.only(top: 4.r),
//                               decoration: BoxDecoration(
//                                   color: AppColors.greenColor,
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Icon(
//                                 Icons.arrow_back_ios,
//                                 color: AppColors.baseGreyColor,
//                                 size: 20,
//                               ),
//                             ),
//                             Visibility(
//                                 visible: showChooseYourRideSheet,
//                                 child: Container(
//                                     margin: EdgeInsets.only(
//                                         top: 0.r,
//                                         left: 20.w,
//                                         bottom: 0.r,
//                                         right: 6.w),
//                                     padding: EdgeInsets.zero,
//                                     // height: MediaQuery.of(context).size.height * 0.15,
//                                     width: MediaQuery.of(context).size.width *
//                                         .775,
//                                     decoration: BoxDecoration(
//                                         color: AppColors.baseGreyColor,
//                                         borderRadius:
//                                             BorderRadius.circular(20.r)),
//                                     child: const LocationsSearchBar()))
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }
//
//   void getLocation() async {
//     LocationPermission permission;
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently');
//     }
//     Position currentLocation = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       position = currentLocation;
//     });
//   }
// }
