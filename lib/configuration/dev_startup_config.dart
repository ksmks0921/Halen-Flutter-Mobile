import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/homepage/homepage_screen.dart';
import 'package:halen_customer_app/screens/account/addresses_edit_page.dart';

// Allow you to skip login screens
// just switch startAtPageFlag to false to disable (for production)

// create a route flow in startAtPage and set with String routeConfig
bool startAtPageFlag = false;

String routeConfig0 = "0";
String routeConfig1 = "1";

String routeConfig = routeConfig0;

// skip callback for reload after startup runs twice
int initRunCtr = 0;

startAtPage(BuildContext context) {
  if (startAtPageFlag) {
    if (routeConfig == "0") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    }
    if (routeConfig == "1") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const AddressesEditPage();
      }));
    }
  }
}
