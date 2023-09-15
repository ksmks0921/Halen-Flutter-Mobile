import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'dart:math';
import 'account_notifications_page.dart';

// account screen list view item badges
List<Widget?> alviBadges = [
  null,
  null,
  const AccountLVIBadge(badgeText: "2"),
  null,
  null,
  null,
  const AccountLVIBadge(badgeText: "!"),
  null,
  null
];

class UserData {
  String displayName = "Edward Mbeche";
  String email = "abc@gmail.com";
  String phone = "+65 39879 343";
  String gender = "Male";
  String dob = "16/04/1988";
}

Widget profileImage = Image.asset(
  "assets/images/illustrations/profile_image.png",
  fit: BoxFit.contain,
);

List<String> submittedAddressTypes = ["Home", "Work"];

List<String> addressDatas = [
  "1234 Main Street, Reston LA",
  "1234 Main Street, Reston LA"
];

// profile settings list view items values
// values for pslviTitle
List<String> pslviValue = [
  UserData().displayName,
  UserData().email,
  UserData().phone,
  UserData().gender,
  UserData().dob
];

List<Map> todayNotificationsLVI = [
  {
    "message":
        "Your ride is waiting for you at your address. It will be there for 5 minutes.",
    "datetime":
        DateTime.now().subtract(Duration(seconds: Random().nextInt(3600 * 24))),
    "userprofilepic": const NotificationUserProfilePic(
        path: "assets/images/ridesharing/Vehicles-02.png")
  },
  {
    "message":
        "Your ride is waiting for you at your address. It will be there for 5 minutes.",
    "datetime":
        DateTime.now().subtract(Duration(seconds: Random().nextInt(3600 * 24))),
    "userprofilepic": const NotificationUserProfilePic(
        path: "assets/images/ridesharing/Vehicles-03.png")
  }
];

List<Map> yesterdayNotificationsLVI = [
  {
    "message":
        "Your ride is waiting for you at your address. It will be there for 5 minutes.",
    "datetime": DateTime.now()
        .subtract(Duration(seconds: (3600 * 24) + Random().nextInt(3600 * 24))),
    "userprofilepic": const NotificationUserProfilePic(
        path: "assets/images/ridesharing/Vehicles-04.png")
  }
];

List<Map> lastweekNotificationsLVI = [
  {
    "message": "Your payment is pending. Please make the payment now",
    "datetime": DateTime.now().subtract(
        Duration(seconds: (3600 * 24 * 7) + Random().nextInt(3600 * 24 * 7))),
    "userprofilepic": const NotificationUserProfilePic(
        path: "assets/images/ridesharing/Vehicles-02.png")
  },
  {
    "message":
        "Your ride is waiting for you at your address. It will be there for 5 minutes. This is a very long string for test This is a very long string for test This is a very long string for test This is a very long string for test",
    "datetime": DateTime.now().subtract(
        Duration(seconds: (3600 * 24 * 7) + Random().nextInt(3600 * 24 * 7))),
    "userprofilepic": const NotificationUserProfilePic(
        path: "assets/images/ridesharing/Vehicles-02.png")
  },
  {
    "message":
        "Your ride is waiting for you at your address. It will be there for 5 minutes.",
    "datetime": DateTime.now()
        .subtract(Duration(seconds: Random().nextInt(3600 * 24 * 7))),
    "userprofilepic": const NotificationUserProfilePic(
        path: "assets/images/ridesharing/Vehicles-03.png")
  }
];
