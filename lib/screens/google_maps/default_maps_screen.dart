// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapView extends StatefulWidget {
//   const MapView({super.key});

//   @override
//   _MapViewState createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   late GoogleMapController mapController;
//   final LatLng _center = const LatLng(45.521563, -122.677433);
//   // static const CameraPosition _kGooglePlex = CameraPosition(
//   //   target: LatLng(37.42796133580664, -122.085749655962),
//   //   zoom: 14.4746,
//   // );
//   // final Location _location = Location();
//   // // LatLng? _currentPosition;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _getLocation();
//   // }

//   // void _getLocation() async {
//   //   var locationPermission = await _location.requestPermission();
//   //   if (locationPermission == PermissionStatus.granted) {
//   //     LocationData? locationData = await _location.getLocation();
//   //     setState(() {
//   //       _currentPosition =
//   //           LatLng(locationData.latitude!, locationData.longitude!);
//   //     });
//   //   }
//   // }

//   // static const CameraPosition _kLake = CameraPosition(
//   //     bearing: 192.8334901395799,
//   //     target: LatLng(37.43296265331129, -122.08832357078792),
//   //     tilt: 59.440717697143555,
//   //     zoom: 19.151926040649414);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//         myLocationButtonEnabled: false,
//         mapType: MapType.satellite,
//         initialCameraPosition: CameraPosition(target: _center, zoom: 11),
//         zoomGesturesEnabled: true,
//         onMapCreated: _onMapCreated);
//   }
// }
