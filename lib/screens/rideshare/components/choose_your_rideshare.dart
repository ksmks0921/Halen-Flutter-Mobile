import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/components/payment_card_information.dart';
import 'package:halen_customer_app/constants/colors.dart';

import 'package:halen_customer_app/screens/rideshare/components/rideshare_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';

class ChooseYourRideshareSheet extends ConsumerStatefulWidget {
  const ChooseYourRideshareSheet(
      {Key? key, required this.visible, required this.priceSetCB})
      : super(key: key);

  final bool visible;
  final Function priceSetCB;
  @override
  ChooseYourRideshareSheetState createState() =>
      ChooseYourRideshareSheetState();
}

class ChooseYourRideshareSheetState
    extends ConsumerState<ChooseYourRideshareSheet>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  initState() {
    _tabController = TabController(length: 3, vsync: this);
    Future.delayed(Duration.zero, () {
      ref.read(rsPriceProv.notifier).state = economyRideShareCardData[0].cost;
    });
    super.initState();
  }

  int selectedIndex = 0;
  selectCB(int index, String price) {
    setState(() {
      selectedIndex = index;
    });

    widget.priceSetCB(price);
  }

  List<RideshareCardData> economyRideShareCardData = [
    RideshareCardData(
        imagePath: 'assets/images/ridesharing/economy.png',
        rideSize: "Small",
        cost: "35.50",
        timeAway: '4 min away',
        rideIndex: 0),
    RideshareCardData(
        imagePath: 'assets/images/ridesharing/economy.png',
        rideSize: "Medium",
        cost: "50",
        timeAway: '3 min away',
        rideIndex: 1),
    RideshareCardData(
        imagePath: 'assets/images/ridesharing/economy.png',
        rideSize: "Large",
        cost: "93.43",
        timeAway: '5 min away',
        rideIndex: 2),
  ];

  List<RideshareCardData> luxuryRideShareCardData = [
    RideshareCardData(
        imagePath: 'assets/images/ridesharing/Vehicles-03.png',
        rideSize: "Sedan",
        cost: "55.50",
        timeAway: '2 min away',
        rideIndex: 3),
    RideshareCardData(
        imagePath: 'assets/images/ridesharing/Vehicles-03.png',
        rideSize: "SUV",
        cost: "70",
        timeAway: '6 min away',
        rideIndex: 4),
  ];

  List<RideshareCardData> taxicabRideShareCardData = [
    RideshareCardData(
        imagePath: 'assets/images/ridesharing/Vehicles-02.png',
        rideSize: "Small",
        cost: "35.50",
        timeAway: '3 min away',
        rideIndex: 5),
    RideshareCardData(
        imagePath: 'assets/images/ridesharing/Vehicles-02.png',
        rideSize: "Large",
        cost: "50",
        timeAway: '5 min away',
        rideIndex: 6),
  ];

  @override
  Widget build(BuildContext context) {
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
          TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            controller: _tabController,
            tabs: const [
              Tab(text: "Economy"),
              Tab(text: "Luxury"),
              Tab(text: "Taxicab"),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
            height: 224.h,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: economyRideShareCardData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return RideShareCard(
                      imagePath: economyRideShareCardData[index].imagePath,
                      rideSize: economyRideShareCardData[index].rideSize,
                      cost: economyRideShareCardData[index].cost,
                      timeAway: economyRideShareCardData[index].timeAway,
                      selected: selectedIndex ==
                          economyRideShareCardData[index].rideIndex,
                      selectCB: () {
                        selectCB(economyRideShareCardData[index].rideIndex,
                            economyRideShareCardData[index].cost);
                      },
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: luxuryRideShareCardData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return RideShareCard(
                      imagePath: luxuryRideShareCardData[index].imagePath,
                      rideSize: luxuryRideShareCardData[index].rideSize,
                      cost: luxuryRideShareCardData[index].cost,
                      timeAway: luxuryRideShareCardData[index].timeAway,
                      selected: selectedIndex ==
                          luxuryRideShareCardData[index].rideIndex,
                      selectCB: () {
                        selectCB(luxuryRideShareCardData[index].rideIndex,
                            luxuryRideShareCardData[index].cost);
                      },
                    );
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: taxicabRideShareCardData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return RideShareCard(
                      imagePath: taxicabRideShareCardData[index].imagePath,
                      rideSize: taxicabRideShareCardData[index].rideSize,
                      cost: taxicabRideShareCardData[index].cost,
                      timeAway: taxicabRideShareCardData[index].timeAway,
                      selected: selectedIndex ==
                          taxicabRideShareCardData[index].rideIndex,
                      selectCB: () {
                        selectCB(taxicabRideShareCardData[index].rideIndex,
                            taxicabRideShareCardData[index].cost);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 10.h, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PaymentCardInformation(),
                SizedBox(
                  height: 20.h,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 6.w,
                    color: AppColors.grey400,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      timePickupStr,
                      style: const TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: AppColors.greyShade600,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RideshareCardData {
  final String imagePath;
  final String rideSize;
  final String cost;
  final String timeAway;
  final int rideIndex;

  RideshareCardData(
      {required this.imagePath,
      required this.rideSize,
      required this.cost,
      required this.timeAway,
      required this.rideIndex});
}
