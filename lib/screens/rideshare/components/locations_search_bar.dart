import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';

class LocationsSearchBar extends StatefulWidget {
  final ScrollPhysics? physics;
  const LocationsSearchBar({Key? key, this.physics}) : super(key: key);

  @override
  State<LocationsSearchBar> createState() => _LocationsSearchBarState();
}

class _LocationsSearchBarState extends State<LocationsSearchBar> {
  @override
  initState() {
    for (int i = 0; i < listOfLocations.length; i++) {
      listOfLocations[i].controller.text = listOfLocations[i].locationText!;
    }
    super.initState();
  }

  List<LocationData> listOfLocations = [
    LocationData(
        hintText: "Pick Up Location",
        locationText: "Current Location",
        controller: TextEditingController()),
    LocationData(
      hintText: "Home",
      locationText: "Home",
      controller: TextEditingController(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.builder(
            physics: widget.physics,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            itemCount: listOfLocations.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        // height: 20,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Divider(
                          thickness: 1,
                          color: AppColors.grey300,
                        ),
                      ),
                    ),
                  TextField(
                    controller: listOfLocations[index].controller,
                    style: TextStyle(
                        color: listOfLocations[index]
                                    .locationText!
                                    .trim()
                                    .toLowerCase() ==
                                "Current Location".toLowerCase()
                            ? AppColors.greenColor
                            : Colors.black,
                        fontSize: 14.sp),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      prefixIcon: Icon(
                        index == 0 ? Icons.my_location : Icons.location_pin,
                        color: index == 0 ? AppColors.greenColor : Colors.red,
                        size: 30,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: listOfLocations[index].hintText,
                      hintStyle: TextStyle(fontSize: 14.sp),
                    ),
                    onChanged: (String locationString) {
                      setState(() {
                        listOfLocations[index].locationText = locationString;
                        listOfLocations[index].controller.text = locationString;
                        listOfLocations[index].controller.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: listOfLocations[index]
                                    .controller
                                    .text
                                    .length));
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 0.0.w,
            right: 12.0.w,
          ),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                listOfLocations.add(LocationData(
                    hintText: "Add Stop",
                    locationText: "",
                    controller: TextEditingController()));
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.baseGreyColor,
              padding: EdgeInsets.only(
                  left: 10.w, top: 5.w, right: 10.w, bottom: 5.w),
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add_circle,
                  size: 25.r,
                  color: AppColors.grey500,
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  "Add",
                  style: TextStyle(
                      color: AppColors.grey700,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LocationData {
  final String hintText;
  String? locationText;
  final TextEditingController controller;
  LocationData(
      {required this.hintText,
      required this.locationText,
      required this.controller});
}
