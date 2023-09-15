import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

final rsPageStateProv = StateProvider<String?>((ref) {
  return null;
});

final rsPickupLocationProv = StateProvider<String?>((ref) {
  return null;
});

final rsDestinationLocationProv = StateProvider<String?>((ref) {
  return null;
});

final rsPriceProv = StateProvider<String?>((ref) {
  return null;
});

final rsChosenDayProv = StateProvider<String?>((ref) {
  return null;
});

final rsChosenHourProv = StateProvider<String?>((ref) {
  return null;
});

final rsChosenMinuteProv = StateProvider<String?>((ref) {
  return null;
});

final rsChosenMDProv = StateProvider<String?>((ref) {
  return null;
});

final rsPositionProv = StateProvider<Position?>((ref) {
  return null;
});

final rsMapControllerProv = StateProvider<GoogleMapController?>((ref) {
  return null;
});

final locationPermGranted = StateProvider<bool>((ref) {
  return false;
});

final mapPreload = StateProvider<Widget>((ref) {
  if (ref.read(rsPositionProv) == null) {
    return Container();
  }
  return GoogleMap(
    myLocationEnabled: true,
    initialCameraPosition: CameraPosition(
        target: LatLng(
          // position.latitude, position.longitude
          ref.watch(rsPositionProv)!.latitude,
          ref.watch(rsPositionProv)!.longitude,
        ),
        zoom: 11.4746),
    mapType: MapType.normal,
    onMapCreated: (GoogleMapController controller) {
      _onMapCreated(ref, controller);
    },
  );
});

void _onMapCreated(StateProviderRef ref, GoogleMapController controller) {
  ref.read(rsMapControllerProv.notifier).state = controller;
}

checkLocationPermission(WidgetRef ref) async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    ref.read(locationPermGranted.notifier).state = true;
    return true;
  } else {
    ref.read(locationPermGranted.notifier).state = false;
    return false;
  }
}

requestLocationPermission(WidgetRef ref) async {
  bool permGranted = false;
  LocationPermission permission;
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    return Future.error('Location permissions are denied');
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently');
  }
  if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    permGranted = true;
    ref.read(locationPermGranted.notifier).state = true;
  } else {
    ref.read(locationPermGranted.notifier).state = false;
  }

  return permGranted;
}

getLocation(WidgetRef ref) async {
  Position currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  ref.read(rsPositionProv.notifier).state = currentLocation;
  return currentLocation;
}
