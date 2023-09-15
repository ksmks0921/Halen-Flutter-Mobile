import 'package:flutter/material.dart';
import 'package:halen_customer_app/appstate/ride_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// initialize location and other services
// wraps home screen

class HalenServicesWrap extends ConsumerStatefulWidget {
  const HalenServicesWrap({super.key, required this.child});

  final Widget child;
  @override
  HalenServicesWrapState createState() => HalenServicesWrapState();
}

class HalenServicesWrapState extends ConsumerState<HalenServicesWrap> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      bool locationPermGranted = await checkLocationPermission(ref);
      if (!locationPermGranted) {
        await requestLocationPermission(ref);
        await getLocation(ref);
      }
      if (ref.read(rsPositionProv) == null) {
        await getLocation(ref);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
