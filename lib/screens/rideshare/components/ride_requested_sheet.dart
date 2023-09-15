import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/rideshare/components/choose_your_rideshare.dart';
import 'package:halen_customer_app/screens/rideshare/components/rideshare_card.dart';

class RideRequestedSheet extends StatefulWidget {
  final bool visible;
  const RideRequestedSheet({Key? key, required this.visible}) : super(key: key);

  @override
  State<RideRequestedSheet> createState() => _RideRequestedSheetState();
}

class _RideRequestedSheetState extends State<RideRequestedSheet> {
  bool timerOff = false;
  RideshareCardData rideData = RideshareCardData(
      imagePath: 'assets/images/ridesharing/economy.png',
      rideSize: "Small",
      cost: "35.50",
      timeAway: '4 min away',
      rideIndex: 0);
  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.visible) {
      Future.delayed(const Duration(milliseconds: 3000)).then((value) {
        setState(() {
          timerOff = true;
        });
      });
    }

    return Visibility(
      visible: widget.visible,
      child: SizedBox(
        height: timerOff ? 200.h : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  timerOff
                      ? "Get there at 9:45 PM"
                      : "Confirming your ride and looking for driver",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                timerOff
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text(
                          //   "----------",
                          //   style: TextStyle(
                          //       color: AppColors.grey500, fontSize: 24.sp),
                          // ),

                          Icon(
                            Icons.location_pin,
                            size: 66.w,
                            color: Colors.red,
                          ),
                        ],
                      )
                    : RideShareCard(
                        imagePath: rideData.imagePath,
                        rideSize: rideData.rideSize,
                        cost: rideData.cost,
                        timeAway: rideData.timeAway,
                        selected: true,
                        selectCB: () {},
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
