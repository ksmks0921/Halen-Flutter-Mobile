import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:halen_customer_app/components/appBar/title_appbar.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/constants/constants.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';
import 'package:halen_customer_app/screens/rideshare/components/cancel_ride_sheet.dart';
import 'package:halen_customer_app/screens/rideshare/components/choose_your_rideshare.dart';
import 'package:halen_customer_app/screens/rideshare/components/confirm_pickup_spot.dart';
import 'package:halen_customer_app/screens/rideshare/components/destination_sheet.dart';
import 'package:halen_customer_app/screens/rideshare/components/driver_on_the_way_sheet.dart';
import 'package:halen_customer_app/screens/rideshare/components/driver_profile_widget.dart';
import 'package:halen_customer_app/screens/rideshare/components/review_driver.dart';
import 'package:halen_customer_app/screens/rideshare/components/ride_requested_sheet.dart';
import 'package:halen_customer_app/screens/rideshare/components/trip_detail_sheet.dart';
import 'package:halen_customer_app/screens/rideshare/components/confirm_destination.dart';
import 'package:halen_customer_app/screens/rideshare/components/pickup_time_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';
import 'package:halen_customer_app/configuration/flags/feature_flags.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class RideTab extends ConsumerStatefulWidget {
  const RideTab({Key? key}) : super(key: key);

  @override
  RideTabState createState() => RideTabState();
}

class RideTabState extends ConsumerState<RideTab> {
  bool showDestinationSheet = false;
  bool showChooseYourRideSheet = false;
  bool showConfirmDestinationSheet = false;
  bool showConfirmPickUpSpotSheet = false;
  bool showRideRequestedSheet = false;
  bool showDriverOnTheWaySheet = false;
  bool showCancelRideSheet = false;
  bool showTripDetailSheet = false;
  bool showReviewDriver = false;
  bool showPickupTimeSheet = false;

  bool maximizeSheetSize = false;

  String? pickupStr;
  String? destinationStr;

  setShowSheet(
      {destS = false,
      chooseS = false,
      confirmDS = false,
      confirmPS = false,
      pickupTS = false,
      reqS = false,
      dowS = false,
      cancelS = false,
      tripS = false,
      revS = false}) {
    if (reqS) {
      ref.read(rsPageStateProv.notifier).state = "reqS";
    }
    if (dowS) {
      ref.read(rsPageStateProv.notifier).state = "dowS";
    }
    if (cancelS) {
      ref.read(rsPageStateProv.notifier).state = "cancelS";
    }
    if (tripS) {
      ref.read(rsPageStateProv.notifier).state = "tripS";
    }
    if (revS) {
      ref.read(rsPageStateProv.notifier).state = "revS";
    }

    setState(() {
      showDestinationSheet = destS;
      showChooseYourRideSheet = chooseS;
      showPickupTimeSheet = pickupTS;
      showConfirmPickUpSpotSheet = confirmPS;
      showConfirmDestinationSheet = confirmDS;
      showRideRequestedSheet = reqS;
      showDriverOnTheWaySheet = dowS;
      showCancelRideSheet = cancelS;
      showTripDetailSheet = tripS;
      showReviewDriver = revS;
    });
  }

  setShowSheetFromState() {
    String? rsPageState = ref.read(rsPageStateProv);
    if (rsPageState != null) {
      if (rsPageState == "reqS") {
        setShowSheet(reqS: true);
      }
      if (rsPageState == "dowS") {
        setShowSheet(dowS: true);
      }
      if (rsPageState == "cancelS") {
        setShowSheet(cancelS: true);
      }
      if (rsPageState == "tripS") {
        setShowSheet(tripS: true);
      }
      if (rsPageState == "revS") {
        setShowSheet(revS: true);
      }
    }
  }

  priceSetCB(String price) {
    ref.read(rsPriceProv.notifier).state = price;
  }

  maximizeSheetSizeCB(bool maximize) {
    setState(() {
      maximizeSheetSize = maximize;
    });
  }

  // setPickupCB(String pickup){
  //   setState(() {
  //     pickupStr = pickup;
  //   });
  // }

  // setDestinationCB(String dest){
  //   setState(() {
  //     destinationStr = dest;
  //   });
  // }

  @override
  void initState() {
    // getLocation();
    showDestinationSheet = true;
    showChooseYourRideSheet = false;
    showConfirmPickUpSpotSheet = false;
    showRideRequestedSheet = false;
    showDriverOnTheWaySheet = false;
    showCancelRideSheet = false;
    showTripDetailSheet = false;
    showReviewDriver = false;
    Future.delayed(Duration.zero, () {
      // try load from state
      if (ref.watch(rsPageStateProv) != null) {
        setShowSheetFromState();
      }
      // re initialize
      else {
        ref.read(rsPickupLocationProv.notifier).state = "Your Location";
        ref.read(rsPriceProv.notifier).state = null;
      }
    });
    super.initState();
  }

  bool locationPermission = false;
  @override
  Widget build(BuildContext context) {
    /// Location and map things
    // print("[RT LOG]ride tab build");
    Position? position = ref.watch(rsPositionProv);
    locationPermission = ref.watch(locationPermGranted.notifier).state;
    if (!locationPermission) {
      // print("[RT LOG] not loc permission");
      requestLocationPermission(ref).then((res) {
        if (res) {
          // print("[RT LOG] request perms complete");
          getLocation(ref);
          // print("[RT LOG] get location complete");
        }
      });
    }
    if (position == null && locationPermission == true) {
      // print("[RT LOG]pos null");
      getLocation(ref);
      return const LoadingWidget();
    }

    if (locationPermission == false) {
      return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              bottomNavigationBar: const CustomNavigationBar(),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.location_off_outlined)]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Location Disabled",
                        style: TextStyle(fontSize: 19.h),
                      )
                    ])
                  ])));
    }

    return position == null
        ? const LoadingWidget()
        :
        // GestureDetector(
        //         onTap: () {
        //           FocusScope.of(context).requestFocus(FocusNode());
        //         },
        //         child:
        SafeArea(
            child: Scaffold(
            backgroundColor: AppColors.baseGreyColor,
            // bottomNavigationBar: const CustomNavigationBar(),

            bottomNavigationBar: const CustomNavigationBar(),
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Positioned(
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints contraints) {
                    return SizedBox(
                        height: contraints.maxHeight,
                        child: ref.watch(mapPreload)
                        // GoogleMap(
                        //   myLocationEnabled: true,
                        //   initialCameraPosition: CameraPosition(
                        //       target: LatLng(
                        //           position.latitude, position.longitude),
                        //       zoom: 11.4746),
                        //   mapType: MapType.normal,
                        //   onMapCreated: _onMapCreated,
                        // )

                        );
                  }),
                ),
                const Positioned(
                    top: 0,
                    child: TitleAppBar(
                      title: "Ride",
                    )),

                // Positioned(
                //   top: 40.0,
                //   left: 15.0,
                //   child: SizedBox(
                //     width: 40,
                //     height: 40,
                //     child: FloatingActionButton(
                //       onPressed: () {
                //         Navigator.pop(context);
                //         ref.read(navStateProvider.notifier).state = 0;
                //       },
                //       backgroundColor: const Color(0xFF63BCB9),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //       child: const Padding(
                //         padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                //         child: Icon(Icons.arrow_back_ios),
                //       ),
                //     ),
                //   ),
                // ),

                PointerInterceptor(
                  child: DraggableScrollableSheet(
                    initialChildSize: maximizeSheetSize
                        ? .912
                        : showDestinationSheet
                            ? .7
                            : showPickupTimeSheet
                                ? .51
                                : showChooseYourRideSheet
                                    ? 0.7
                                    : showConfirmPickUpSpotSheet
                                        ? 0.5
                                        : showDriverOnTheWaySheet
                                            ? 0.7
                                            : showCancelRideSheet
                                                ? 0.7
                                                : showRideRequestedSheet
                                                    ? 0.45
                                                    : showTripDetailSheet
                                                        ? 0.65
                                                        : showReviewDriver
                                                            ? .912
                                                            : 0.55,
                    minChildSize: maximizeSheetSize
                        ? .912
                        : showDestinationSheet
                            ? 0.7
                            : showPickupTimeSheet
                                ? .51
                                : showChooseYourRideSheet
                                    ? 0.7
                                    : showConfirmPickUpSpotSheet
                                        ? 0.5
                                        : showDriverOnTheWaySheet
                                            ? 0.7
                                            : showCancelRideSheet
                                                ? 0.7
                                                : showRideRequestedSheet
                                                    ? 0.45
                                                    : showTripDetailSheet
                                                        ? 0.65
                                                        : showReviewDriver
                                                            ? .912
                                                            : 0.55,
                    maxChildSize: maximizeSheetSize
                        ? .912
                        : showDestinationSheet
                            ? .7
                            : showPickupTimeSheet
                                ? .51
                                : showChooseYourRideSheet
                                    ? 0.7
                                    : showConfirmPickUpSpotSheet
                                        ? 0.5
                                        : showDriverOnTheWaySheet
                                            ? 0.7
                                            : showCancelRideSheet
                                                ? 0.7
                                                : showRideRequestedSheet
                                                    ? 0.45
                                                    : showTripDetailSheet
                                                        ? 0.65
                                                        : showReviewDriver
                                                            ? .912
                                                            : 0.55,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
                      return SingleChildScrollView(
                          controller: scrollController,
                          child: Container(
                            height: maximizeSheetSize
                                ? .9.sh
                                : showDestinationSheet
                                    ? 0.7.sh
                                    : showPickupTimeSheet
                                        ? .51.sh
                                        : showChooseYourRideSheet
                                            ? 0.7.sh
                                            : showConfirmPickUpSpotSheet
                                                ? 0.5.sh
                                                : showDriverOnTheWaySheet
                                                    ? 0.7.sh
                                                    : showCancelRideSheet
                                                        ? 0.7.sh
                                                        : showRideRequestedSheet
                                                            ? 0.45.sh
                                                            : showTripDetailSheet
                                                                ? 0.65.sh
                                                                : showReviewDriver
                                                                    ? 1.sh
                                                                    : 0.55.sh,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Visibility(
                                  visible: !showTripDetailSheet,
                                  child: Stack(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          showDestinationSheet
                                              ? "Where are you going today?"
                                              : showPickupTimeSheet
                                                  ? "Choose Pickup Time"
                                                  : showChooseYourRideSheet
                                                      ? "Choose your ride"
                                                      : showConfirmPickUpSpotSheet
                                                          ? "Pick up point"
                                                          : showConfirmDestinationSheet
                                                              ? "Where are you going?"
                                                              : showRideRequestedSheet
                                                                  ? "Ride Requested"
                                                                  : showDriverOnTheWaySheet
                                                                      ? "Driver on the way"
                                                                      : showCancelRideSheet
                                                                          ? "Why do you want to cancel"
                                                                          : "",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    showRideRequestedSheet ||
                                            showDriverOnTheWaySheet ||
                                            showTripDetailSheet
                                        ? FFlagged(
                                            flag: showMoveForwardRideshare,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  showDestinationSheet
                                                      ? Container()
                                                      : Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 15.w),
                                                          child:
                                                              GestureDetector(
                                                                  onTap: () {
                                                                    maximizeSheetSizeCB(
                                                                        false);

                                                                    showRideRequestedSheet
                                                                        ? setShowSheet(
                                                                            dowS:
                                                                                true)
                                                                        : showDriverOnTheWaySheet
                                                                            ? setShowSheet(tripS: true)
                                                                            : showTripDetailSheet
                                                                                ? setShowSheet(revS: true)
                                                                                : () {};
                                                                  },
                                                                  child: const Icon(
                                                                      Icons
                                                                          .arrow_forward_ios)))
                                                ]))
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                                showDestinationSheet ||
                                                        showReviewDriver
                                                    ? Container()
                                                    : Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.w),
                                                        child: GestureDetector(
                                                            onTap: () {
                                                              maximizeSheetSizeCB(
                                                                  false);

                                                              showConfirmPickUpSpotSheet
                                                                  ? setShowSheet(
                                                                      destS:
                                                                          true)
                                                                  : showPickupTimeSheet
                                                                      ? setShowSheet(
                                                                          destS:
                                                                              true)
                                                                      : showConfirmDestinationSheet
                                                                          ? setShowSheet(
                                                                              destS: true)
                                                                          : showChooseYourRideSheet
                                                                              ? setShowSheet(destS: true)
                                                                              : showRideRequestedSheet
                                                                                  ? setShowSheet(chooseS: true)
                                                                                  : showDriverOnTheWaySheet
                                                                                      ? setShowSheet(reqS: true)
                                                                                      : showCancelRideSheet
                                                                                          ? setShowSheet(dowS: true)
                                                                                          : () {};
                                                            },
                                                            child: const Icon(Icons
                                                                .arrow_back_ios)))
                                              ])
                                  ]),
                                ),
                                Visibility(
                                  visible: showDriverOnTheWaySheet,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Arriving in 2 min",
                                        style: TextStyle(
                                          color: AppColors.grey500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible:
                                      !showTripDetailSheet && !showReviewDriver,
                                  child: SizedBox(
                                    height: 30.h,
                                    width: double.infinity,
                                    child: Divider(
                                      thickness: 3,
                                      color: AppColors.grey300,
                                    ),
                                  ),
                                ),
                                DestinationSheet(
                                    visible: showDestinationSheet,
                                    showSheetCB: setShowSheet,
                                    // setDestinationValue: setDestinationCB,
                                    pickupStr: pickupStr,
                                    destinationStr: destinationStr),
                                PickupTimeSheet(
                                  visible: showPickupTimeSheet,
                                ),
                                ChooseYourRideshareSheet(
                                  visible: showChooseYourRideSheet,
                                  priceSetCB: priceSetCB,
                                ),
                                ConfirmDestinationSheet(
                                  visible: showConfirmDestinationSheet,
                                  maximizeSheetCB: maximizeSheetSizeCB,
                                  showSheetCB: setShowSheet,
                                ),
                                ConfirmPickupSpotSheet(
                                  visible: showConfirmPickUpSpotSheet,
                                  maximizeSheetCB: maximizeSheetSizeCB,
                                ),
                                RideRequestedSheet(
                                    visible: showRideRequestedSheet),
                                DriverOnTheWaySheet(
                                    visible: showDriverOnTheWaySheet),
                                CancelRideSheet(visible: showCancelRideSheet),
                                TripDetailSheet(visible: showTripDetailSheet),
                                ReviewDriver(visible: showReviewDriver),
                                Visibility(
                                  visible:
                                      !showTripDetailSheet && !showReviewDriver,
                                  child: SizedBox(
                                    height: 30.h,
                                    width: double.infinity,
                                    child: Divider(
                                      thickness: 3,
                                      color: AppColors.grey300,
                                    ),
                                  ),
                                ),
                                showRideRequestedSheet
                                    ? Center(
                                        child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                if (showRideRequestedSheet ==
                                                    true) {
                                                  showDestinationSheet = false;
                                                  showChooseYourRideSheet =
                                                      false;
                                                  showConfirmPickUpSpotSheet =
                                                      false;
                                                  showRideRequestedSheet =
                                                      false;
                                                  showDriverOnTheWaySheet =
                                                      true;
                                                }
                                              });
                                            },
                                            style: TextButton.styleFrom(
                                              iconColor: AppColors.grey500,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.edit_outlined),
                                                Text(
                                                  "Edit ride or payment",
                                                  style: TextStyle(
                                                    color: AppColors.grey500,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      )
                                    : Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                            (ref.watch(rsDestinationLocationProv) ==
                                                            null &&
                                                        showDestinationSheet) ||
                                                    (showReviewDriver)
                                                ? Container()
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: .05.sh),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (showDestinationSheet ==
                                                              true) {
                                                            // showDestinationSheet = false;
                                                            // showChooseYourRideSheet = true;
                                                            // showConfirmPickUpSpotSheet = false;
                                                            // showRideRequestedSheet = false;
                                                            // showDriverOnTheWaySheet = false;
                                                            // showCancelRideSheet = false;
                                                            // showReviewDriver = false;
                                                            setShowSheet(
                                                                chooseS: true);
                                                          } else if (showChooseYourRideSheet ==
                                                              true) {
                                                            // showDestinationSheet = false;
                                                            // showChooseYourRideSheet = false;
                                                            // showConfirmPickUpSpotSheet = true;
                                                            // showRideRequestedSheet = false;
                                                            // showDriverOnTheWaySheet = false;
                                                            // showCancelRideSheet = false;
                                                            // showReviewDriver = false;
                                                            setShowSheet(
                                                                dowS: true);
                                                          } else if (showConfirmPickUpSpotSheet ==
                                                              true) {
                                                            // showDestinationSheet = false;
                                                            // showChooseYourRideSheet = false;
                                                            // showConfirmPickUpSpotSheet = false;
                                                            // showRideRequestedSheet = true;
                                                            // showDriverOnTheWaySheet = false;
                                                            // showCancelRideSheet = false;
                                                            // showReviewDriver = false;

                                                            maximizeSheetSizeCB(
                                                                false);
                                                            setShowSheet(
                                                                destS: true);
                                                          } else if (showConfirmDestinationSheet ==
                                                              true) {
                                                            // showDestinationSheet = false;
                                                            // showChooseYourRideSheet = false;
                                                            // showConfirmPickUpSpotSheet = false;
                                                            // showRideRequestedSheet = true;
                                                            // showDriverOnTheWaySheet = false;
                                                            // showCancelRideSheet = false;
                                                            // showReviewDriver = false;

                                                            maximizeSheetSizeCB(
                                                                false);
                                                            setShowSheet(
                                                                destS: true);
                                                          } else if (showPickupTimeSheet ==
                                                              true) {
                                                            maximizeSheetSizeCB(
                                                                false);
                                                            setShowSheet(
                                                                destS: true);
                                                          } else if (showDriverOnTheWaySheet ==
                                                              true) {
                                                            // showDestinationSheet = false;
                                                            // showChooseYourRideSheet = false;
                                                            // showConfirmPickUpSpotSheet = false;
                                                            // showRideRequestedSheet = false;
                                                            // showDriverOnTheWaySheet = false;
                                                            // showCancelRideSheet = true;
                                                            // showReviewDriver = false;
                                                            setShowSheet(
                                                                cancelS: true);
                                                          } else if (showCancelRideSheet ==
                                                              true) {
                                                            // showDestinationSheet = false;
                                                            // showChooseYourRideSheet = false;
                                                            // showConfirmPickUpSpotSheet = false;
                                                            // showRideRequestedSheet = false;
                                                            // showDriverOnTheWaySheet = false;
                                                            // showCancelRideSheet = false;
                                                            // showTripDetailSheet = true;
                                                            // showReviewDriver = false;
                                                            setShowSheet(
                                                                tripS: true);
                                                          } else if (showTripDetailSheet ==
                                                              true) {
                                                            // showDestinationSheet = false;
                                                            // showChooseYourRideSheet = false;
                                                            // showConfirmPickUpSpotSheet = false;
                                                            // showRideRequestedSheet = false;
                                                            // showDriverOnTheWaySheet = false;
                                                            // showCancelRideSheet = false;
                                                            // showTripDetailSheet = false;
                                                            // showReviewDriver = true;
                                                            setShowSheet(
                                                                revS: true);
                                                          }
                                                        });
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 20.w,
                                                                  left: 20.w,
                                                                  bottom: 20.h),
                                                          constraints:
                                                              BoxConstraints
                                                                  .tight(Size(
                                                                      double
                                                                          .infinity,
                                                                      49.h)),
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .greenColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.r)),
                                                          child: (showDestinationSheet &&
                                                                  ref.watch(
                                                                          rsDestinationLocationProv) !=
                                                                      null)
                                                              ? Center(
                                                                  child: Text(
                                                                  "CONFIRM AND REQUEST",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      color: AppColors
                                                                          .bgdDefTextColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ))
                                                              : (showDestinationSheet &&
                                                                      ref.watch(
                                                                              rsDestinationLocationProv) ==
                                                                          null)
                                                                  ? Container(
                                                                      color: Colors
                                                                          .grey,
                                                                    )
                                                                  : showChooseYourRideSheet
                                                                      ? Padding(
                                                                          padding:
                                                                              EdgeInsets.symmetric(horizontal: 20.w),
                                                                          child: Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "BOOK THIS CAR",
                                                                                style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text("\$${ref.watch(rsPriceProv) ?? ""}", style: Constants.style16White),
                                                                                  SizedBox(
                                                                                    width: 10.w,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.all(6.r),
                                                                                    decoration: BoxDecoration(color: AppColors.baseGreyColor, borderRadius: BorderRadius.circular(5)),
                                                                                    child: Icon(
                                                                                      Icons.arrow_forward_ios,
                                                                                      color: AppColors.greenColor,
                                                                                      size: 18,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ))
                                                                      : showConfirmPickUpSpotSheet
                                                                          ? Center(
                                                                              child: Text(
                                                                                "SUBMIT",
                                                                                style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            )
                                                                          : showConfirmDestinationSheet
                                                                              ? Center(
                                                                                  child: Text(
                                                                                    "SUBMIT",
                                                                                    style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                )
                                                                              : showPickupTimeSheet
                                                                                  ? Center(
                                                                                      child: Text(
                                                                                        "ACCEPT",
                                                                                        style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                                      ),
                                                                                    )
                                                                                  : showDriverOnTheWaySheet
                                                                                      ? Center(
                                                                                          child: Text(
                                                                                            "CANCEL THIS RIDE",
                                                                                            style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                        )
                                                                                      : showTripDetailSheet
                                                                                          ? Center(
                                                                                              child: Text(
                                                                                                "REVIEW",
                                                                                                style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                                              ),
                                                                                            )
                                                                                          // : showReviewDriver
                                                                                          //     ? Center(
                                                                                          //         child: Text(
                                                                                          //           "DONE",
                                                                                          //           style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                                          //         ),
                                                                                          //       )
                                                                                          : Center(
                                                                                              child: Text(
                                                                                                "CONFIRM",
                                                                                                style: TextStyle(fontSize: 14.sp, color: AppColors.bgdDefTextColor, fontWeight: FontWeight.w500),
                                                                                              ),
                                                                                            ),
                                                        ),
                                                      ),
                                                    )),
                                          ])),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                Visibility(
                  visible: showTripDetailSheet,
                  child: Positioned(
                    top: .044.sh,
                    child: const DriverProfileWidget(),
                  ),
                ),
                // Visibility(
                //   visible: !showReviewDriver,
                //   child: Positioned(
                //     top: 70.h,
                //     left: 15.w,
                //     child: GestureDetector(
                //       onTap: () {
                //         ref.read(navStateProvider.notifier).state = 0;
                //         Navigator.of(context).pushNamedAndRemoveUntil(
                //             homePageRoute, (route) => false);
                //       },
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Container(
                //             padding: EdgeInsets.only(
                //                 top: 8.r,
                //                 left: 12.r,
                //                 bottom: 8.r,
                //                 right: 6.r),
                //             margin: EdgeInsets.only(top: 4.r),
                //             decoration: BoxDecoration(
                //                 color: AppColors.greenColor,
                //                 borderRadius: BorderRadius.circular(5)),
                //             child: Icon(
                //               Icons.arrow_back_ios,
                //               color: AppColors.baseGreyColor,
                //               size: 20,
                //             ),
                //           ),
                //           Visibility(
                //               visible: showChooseYourRideSheet,
                //               child: Container(
                //                   margin: EdgeInsets.only(
                //                       top: 0.r,
                //                       left: 20.w,
                //                       bottom: 0.r,
                //                       right: 6.w),
                //                   padding: EdgeInsets.zero,
                //                   // height: MediaQuery.of(context).size.height * 0.15,
                //                   width: MediaQuery.of(context).size.width *
                //                       .775,
                //                   decoration: BoxDecoration(
                //                       color: AppColors.baseGreyColor,
                //                       borderRadius:
                //                           BorderRadius.circular(20.r)),
                //                   child: const LocationsSearchBar()))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            // ),
          ));
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    ));
  }
}
