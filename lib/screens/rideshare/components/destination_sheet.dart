import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/rideshare/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// preDestPageState for pre set destinations
final pdpProv = StateProvider<int>((ref) {
  return 0;
});

class DestinationSheet extends ConsumerStatefulWidget {
  const DestinationSheet(
      {Key? key,
      required this.visible,
      required this.showSheetCB,
      // required this.setDestinationValue,
      this.pickupStr,
      this.destinationStr})
      : super(key: key);

  final bool visible;
  final Function showSheetCB;
  // final Function setDestinationValue;
  final String? pickupStr;
  final String? destinationStr;

  @override
  DestinationSheetState createState() => DestinationSheetState();
}

class DestinationSheetState extends ConsumerState<DestinationSheet> {
  String? setDestStr;
  String? setPickupStr;

  final TextEditingController _pickupTextController = TextEditingController();
  final TextEditingController _destinationTextController =
      TextEditingController();
  ScrollController preDestPageController = ScrollController();

  @override
  dispose() {
    _pickupTextController.dispose();
    _destinationTextController.dispose();
    preDestPageController.dispose();
    super.dispose();
  }

  @override
  initState() {
    setDestStr = widget.destinationStr;
    // setPickupStr = widget.pickupStr;
    super.initState();
  }

  setNewDestinationStr(String newDest) {
    ref.read(rsDestinationLocationProv.notifier).state = newDest;
    setState(() {
      setDestStr = newDest;
      _destinationTextController.text = newDest;
    });
  }

  // setNewPickupStr(String newPickup){
  //   setState(() {
  //     setPickupStr = newPickup;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    int pdp = ref.watch(pdpProv);

    String chosenPickupLocationStr =
        ref.watch(rsPickupLocationProv) ?? "Your Location";

    preDestPageController.addListener(() {
      int preDestPageGet = preDestPageController.offset ~/ 1.sw;
      if (preDestPageGet != pdp) {
        ref.read(pdpProv.notifier).state = preDestPageGet;
      }
    });

    String? pickupLocationString = ref.watch(rsPickupLocationProv);
    if (pickupLocationString != null) {
      _pickupTextController.text = pickupLocationString;
    }

    String? destinationLocationString = ref.watch(rsDestinationLocationProv);
    if (destinationLocationString != null) {
      _destinationTextController.text = destinationLocationString;
    }

    String timePickupStr = "Now";

    String? cd = ref.watch(rsChosenDayProv);
    String? ch = ref.watch(rsChosenHourProv);
    String? cm = ref.watch(rsChosenMinuteProv);
    String? cmd = ref.watch(rsChosenMDProv);
    if (cd != null || ch != null || cm != null) {
      timePickupStr = "${cd ?? ""} ${ch ?? ""}:${cm ?? ""} ${cmd ?? ""}";
    }

    return Visibility(
      visible: widget.visible,
      child: Column(
        children: [
          // Container(
          //   color: Colors.blue,
          // child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Flexible(
                child:
                    // Container(
                    // color: Colors.green,
                    //     child:
                    Padding(
                        padding: EdgeInsets.only(
                            top: 8.h, bottom: 8.h, right: 24.w, left: 24.w),
                        child: InkWell(
                            onTap: () {
                              widget.showSheetCB(confirmPS: true);
                            },
                            child: Container(
                                height: 51.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.w, color: Colors.black45),
                                  borderRadius: BorderRadius.circular(30.h),
                                ),
                                child: Row(children: [
                                  Padding(
                                      padding: EdgeInsets.all(8.w),
                                      child: Icon(
                                        Icons.location_searching,
                                        color: AppColors.greenColor,
                                        size: 24.h,
                                      )),
                                  Flexible(
                                      child: Padding(
                                          padding: EdgeInsets.all(5.w),
                                          child: Text(chosenPickupLocationStr)))
                                ]))))),
            // )),
            // TextField(
            //   controller: _pickupTextController,
            //   maxLines: 6,
            //   minLines: 1,
            //   enabled: false,
            //   style:  TextStyle(color: Colors.black, letterSpacing: .5,),
            //   textAlignVertical: TextAlignVertical.center,
            //   decoration: InputDecoration(
            //       contentPadding: const EdgeInsets.all(5),
            //       prefixIcon: Icon(
            //         Icons.location_searching,
            //         color: AppColors.greenColor,
            //         size: 24.h,
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(30.r),
            //       ),
            //       hintText: "Choose pick up point"),
            // )

            // ),
            // ))),

            // Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children:[
            //       Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children:[
            PreDestinationButton(
              optclip: 15,
              fontSize: 15.h,
              icon: Icons.access_time_rounded,
              label: timePickupStr,
              selectedCB: () {
                widget.showSheetCB(pickupTS: true);
              },
              index: -1,
              selectedIndex: -1,
            )
            // ])
            ,
            SizedBox(
              width: .03.sw,
            ),
          ]),
          Padding(
            padding:
                EdgeInsets.only(top: 8.h, bottom: 8.h, right: 24.w, left: 24.w),
            child: InkWell(
                onTap: () {
                  widget.showSheetCB(confirmDS: true);
                },
                child: TextField(
                  controller: _destinationTextController,
                  maxLines: 6,
                  minLines: 1,
                  enabled: false,
                  style: const TextStyle(color: Colors.black),
                  // onChanged: (value){
                  //   ref.read(rsDestinationLocationProv.notifier).state = value;
                  // },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      prefixIcon: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 24.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      hintText: "Choose your destination"),
                )),
          ),
          PreDestinationListView(
            // preDestPage: preDestPage,
            preDestPageController: preDestPageController,
            showSheetCB: widget.showSheetCB,
            setDestinationValue: setNewDestinationStr,
          ),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: AppColors.baseGreyColor,
          //           padding: EdgeInsets.only(
          //               left: 15.w, top: 10.h, right: 15.w, bottom: 10.h),
          //           elevation: 1,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30.r),
          //           ),
          //         ),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.access_time_rounded,
          //               size: 25.r,
          //               color: Colors.black,
          //             ),
          //             SizedBox(
          //               width: 6.w,
          //             ),
          //             Text(
          //               "Now",
          //               style: TextStyle(color: Colors.black, fontSize: 16.sp),
          //             ),
          //           ],
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //
          //           setNewDestinationStr("Home - 1448 Lisbon St.");
          //
          //         },
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: _homeSelected?AppColors.primaryColor: AppColors.baseGreyColor,
          //           padding: EdgeInsets.only(
          //               left: 15.w, top: 10.w, right: 15.w, bottom: 10.w),
          //           elevation: 1,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30.r),
          //           ),
          //         ),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.bookmark,
          //               size: 25.h,
          //               color: Colors.black,
          //             ),
          //             SizedBox(
          //               width: 6.w,
          //             ),
          //             Text(
          //               "Home",
          //               style: TextStyle(color: Colors.black, fontSize: 16.sp),
          //             ),
          //           ],
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: AppColors.baseGreyColor,
          //           padding: EdgeInsets.only(
          //               left: 15.w, top: 10.w, right: 15.w, bottom: 10.w),
          //           elevation: 1,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30.r),
          //           ),
          //         ),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.bookmark,
          //               size: 25.h,
          //               color: Colors.black,
          //             ),
          //             SizedBox(
          //               width: 6.w,
          //             ),
          //             Text(
          //               "Office",
          //               style: TextStyle(color: Colors.black, fontSize: 16.sp),
          //             ),
          //           ],
          //         ),
          //       ),
          //       ElevatedButton(
          //         onPressed: () {
          //
          //         },
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: AppColors.baseGreyColor,
          //           padding: EdgeInsets.only(
          //               left: 10.w, top: 10.w, right: 10.w, bottom: 10.w),
          //           elevation: 1,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(35.r),
          //           ),
          //         ),
          //         child: Icon(
          //           Icons.arrow_forward_ios,
          //           size: 25.r,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          SizedBox(
            height: 164.h,
            child: ListView.separated(
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: rideOptionsTestData.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 0.h); // Adjust the height as needed
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      setNewDestinationStr(
                          rideOptionsTestData[index].addressShort);
                    },
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.h, horizontal: 55.w),
                    leading: Icon(
                      Icons.access_time,
                      size: 22.h,
                    ),
                    title: Text(
                      rideOptionsTestData[index].locationTitle,
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      rideOptionsTestData[index].addressShort,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class PreDestinationListView extends ConsumerStatefulWidget {
  const PreDestinationListView(
      {super.key,
      required this.preDestPageController,
      required this.showSheetCB,
      required this.setDestinationValue
      // required this.preDestPage
      });
  final ScrollController preDestPageController;
  final Function showSheetCB;
  final Function setDestinationValue;
  @override
  PreDestinationListViewState createState() => PreDestinationListViewState();
}

class PreDestinationListViewState
    extends ConsumerState<PreDestinationListView> {
  int selectedPreDestIndex = -1;

  @override
  Widget build(BuildContext context) {
    int preDestPage = ref.watch(pdpProv);

    // String timePickupStr = "Now";
    //
    // String? cd = ref.watch(rsChosenDayProv);
    // String? ch = ref.watch(rsChosenHourProv);
    // String? cm = ref.watch(rsChosenMinuteProv);
    // String? cmd = ref.watch(rsChosenMDProv);
    // if (cd != null || ch != null || cm != null) {
    //   timePickupStr = "${cd ?? ""} ${ch ?? ""}:${cm ?? ""} ${cmd ?? ""}";
    // }

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: SizedBox(
            height: 58.h,
            child: ListView(
              controller: widget.preDestPageController,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                    width: 1.sw,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: .86.sw,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // SizedBox(width: .01.sw),
                                    PreDestinationButton(
                                      // clip: 12,
                                      icon: Icons.bookmark,
                                      label: "Office",
                                      selectedCB: () {
                                        setState(() {
                                          selectedPreDestIndex = 0;
                                        });
                                        ref
                                            .read(rsDestinationLocationProv
                                                .notifier)
                                            .state = null;
                                        widget.setDestinationValue(
                                            "Office - 343 Industry ln.");
                                      },
                                      index: 0,
                                      selectedIndex: selectedPreDestIndex,
                                    ),
                                    PreDestinationButton(
                                      // clip: 12,
                                      icon: Icons.bookmark,
                                      label: "Moulin Rouge Downtown",
                                      selectedCB: () {
                                        setState(() {
                                          selectedPreDestIndex = 1;
                                        });
                                        ref
                                            .read(rsDestinationLocationProv
                                                .notifier)
                                            .state = null;
                                        widget.setDestinationValue(
                                            "Moulin Rouge Downtown - 11 City Center dr");
                                      },
                                      index: 1,
                                      selectedIndex: selectedPreDestIndex,
                                    ),
                                    PreDestinationButton(
                                      // clip: 12,
                                      icon: Icons.bookmark,
                                      label: "LAX",
                                      selectedCB: () {
                                        setState(() {
                                          selectedPreDestIndex = 2;
                                        });
                                        ref
                                            .read(rsDestinationLocationProv
                                                .notifier)
                                            .state = null;
                                        widget.setDestinationValue(
                                            "Los Angeles International Airport - 1 World Way, Los Angeles, CA 90045-5803");
                                      },
                                      index: 2,
                                      selectedIndex: selectedPreDestIndex,
                                    ),
                                  ])),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: .045.sw),
                                    child: Visibility(
                                        visible:
                                            preDestPage == 0 ? true : false,
                                        child: GestureDetector(
                                            onTap: () {
                                              widget.preDestPageController
                                                  .animateTo(1.sw,
                                                      curve:
                                                          Curves.easeOutQuart,
                                                      duration: const Duration(
                                                          milliseconds: 300));
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                            ))))
                              ]),
                        ])),
                SizedBox(
                    width: 1.sw,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: .045.sw),
                                    child: Visibility(
                                        visible:
                                            preDestPage == 1 ? true : false,
                                        child: GestureDetector(
                                            onTap: () {
                                              widget.preDestPageController
                                                  .animateTo(
                                                      0,
                                                      curve:
                                                          Curves.easeOutQuart,
                                                      duration: const Duration(
                                                          milliseconds: 300));
                                            },
                                            child: const Icon(
                                              Icons.arrow_back_ios,
                                            ))))
                              ]),
                          SizedBox(
                              width: .86.sw,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PreDestinationButton(
                                      // clip: 12,
                                      icon: Icons.bookmark,
                                      label: "Marks New House",
                                      selectedCB: () {
                                        setState(() {
                                          selectedPreDestIndex = 3;
                                        });
                                        ref
                                            .read(rsDestinationLocationProv
                                                .notifier)
                                            .state = null;
                                        widget.setDestinationValue(
                                            "Marks New House - 595 Lantern st");
                                      },
                                      index: 3,
                                      selectedIndex: selectedPreDestIndex,
                                    ),
                                    PreDestinationButton(
                                      // clip: 12,
                                      icon: Icons.bookmark,
                                      label: "Old Office Downtown",
                                      selectedCB: () {
                                        setState(() {
                                          selectedPreDestIndex = 4;
                                        });
                                        ref
                                            .read(rsDestinationLocationProv
                                                .notifier)
                                            .state = null;
                                        widget.setDestinationValue(
                                            "Old Office Downtown - 3456 South Peak dr");
                                      },
                                      index: 4,
                                      selectedIndex: selectedPreDestIndex,
                                    ),
                                    PreDestinationButton(
                                      // clip: 12,
                                      icon: Icons.bookmark,
                                      label: "Little Italy Center Square",
                                      selectedCB: () {
                                        setState(() {
                                          selectedPreDestIndex = 5;
                                        });
                                        ref
                                            .read(rsDestinationLocationProv
                                                .notifier)
                                            .state = null;
                                        widget.setDestinationValue(
                                            "Little Italy Center Square - 1558 West Broadway");
                                      },
                                      index: 5,
                                      selectedIndex: selectedPreDestIndex,
                                    ),
                                    // PreDestinationButton(
                                    //   icon: Icons.arrow_forward_ios,
                                    //   label: "",
                                    //   selectedCB: (){
                                    //
                                    //   },
                                    // ),
                                  ]))
                        ])),
              ],
            )));
  }
}

class PreDestinationButton extends StatefulWidget {
  const PreDestinationButton(
      {super.key,
      required this.selectedCB,
      required this.icon,
      required this.label,
      required this.index,
      required this.selectedIndex,
      this.optclip,
      // required this.clip,
      //optional for making time chip bigger
      this.fontSize});

  final Function selectedCB;
  final IconData icon;
  final String label;
  final int index;
  final int? selectedIndex;
  // final int clip;
  final int? optclip;
  final double? fontSize;

  @override
  State<PreDestinationButton> createState() => _PreDestinationButtonState();
}

class _PreDestinationButtonState extends State<PreDestinationButton> {
  @override
  Widget build(BuildContext context) {
    // vary padding by label length, slightly wider for smaller labels
    double labelPadding = 8;
    int clip = widget.optclip ?? 14;

    if (widget.label.length < clip) {
      labelPadding = labelPadding + (clip - widget.label.length);
    }

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: ElevatedButton(
          onPressed: () {
            widget.selectedCB();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.index == widget.selectedIndex
                ? AppColors.primaryColor
                : AppColors.baseGreyColor,
            padding: EdgeInsets.only(
                left: labelPadding.w,
                top: 8.w,
                right: labelPadding.w,
                bottom: 8.w),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.w),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 14.w,
                color: widget.index == widget.selectedIndex
                    ? Colors.white
                    : Colors.black,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                widget.label.length > clip
                    ? "${widget.label.substring(0, clip - 2)}.."
                    : widget.label,
                style: TextStyle(
                    color: widget.index == widget.selectedIndex
                        ? Colors.white
                        : Colors.black,
                    fontSize: widget.fontSize ?? 11.w,
                    letterSpacing: .4),
              ),
            ],
          ),
        ));
  }
}
