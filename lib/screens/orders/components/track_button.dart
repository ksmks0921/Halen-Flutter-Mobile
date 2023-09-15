import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/screens/orders/track_screens/track_delivery_dss.dart';
// import 'package:halen_customer_app/screens/orders/track_screens/track_delivery_ac.dart';
import 'package:halen_customer_app/screens/orders/track_screens/track_shop.dart';
import 'package:halen_customer_app/screens/orders/orders_screen.dart';
import 'package:halen_customer_app/screens/rideshare/ride_tab.dart';

pushTrackRouteForOrder(BuildContext context, Map orderData) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    if (orderData["service_type"] == "Shop") {
      return TrackShopScreen(orderData: orderData);
    } else if (orderData["service_type"] == "Eat") {
      return TrackDeliveryScreen(orderData: orderData);
    } else if (orderData["service_type"] == "Grocery") {
      return TrackDeliveryScreen(orderData: orderData);
    } else if (orderData["service_type"] == "Ride") {
      return const RideTab();
    } else {
      return const OrdersScreen();
    }
  }));
}

class TrackButton extends StatelessWidget {
  const TrackButton({Key? key, required this.orderData}) : super(key: key);
  final Map orderData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          pushTrackRouteForOrder(context, orderData);
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 8.w),
            color: AppColors.primaryColor,
            child: const Center(
                child: Text("Track", style: TextStyle(color: Colors.white)))));
  }
}
