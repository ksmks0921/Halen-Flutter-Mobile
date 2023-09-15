import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/orders/contact_us/issue_select.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const ContactUsIssueSelect();
          }));
        },
        child: Text(
          "Contact us",
          style: TextStyle(
              fontSize: 20.w,
              color: Colors.black,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500),
        ));
  }
}
