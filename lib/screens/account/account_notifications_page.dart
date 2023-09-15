import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:intl/intl.dart';
import 'data.dart';
import 'components/account_page_appbar.dart';

class AccountNotificationsPage extends StatefulWidget {
  const AccountNotificationsPage({Key? key}) : super(key: key);

  @override
  State<AccountNotificationsPage> createState() =>
      _AccountNotificationsPageState();
}

class _AccountNotificationsPageState extends State<AccountNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: AppColors.lightBgColor,
                child: Column(children: [
                  const AccountAppBar(
                    title: "Notifications",
                  ),
                  Expanded(
                      child: SizedBox(
                          width: .96.sw,
                          child: ListView.builder(
                              itemCount: todayNotificationsLVI.length +
                                  2 +
                                  yesterdayNotificationsLVI.length +
                                  2 +
                                  lastweekNotificationsLVI.length +
                                  2,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return const NotificationGroupHeader(
                                    title: "Today",
                                  );
                                }
                                if (index == todayNotificationsLVI.length + 1) {
                                  return const NotificationGroupFooter();
                                }
                                if (index < todayNotificationsLVI.length + 1) {
                                  return NotificationLVI(
                                      message: todayNotificationsLVI[index - 1]
                                          ["message"],
                                      datetime: todayNotificationsLVI[index - 1]
                                          ["datetime"],
                                      dateformatshort: true,
                                      userprofilepic:
                                          todayNotificationsLVI[index - 1]
                                              ["userprofilepic"]);
                                }

                                if (index == todayNotificationsLVI.length + 2) {
                                  return const NotificationGroupHeader(
                                    title: "Yesterday",
                                  );
                                }
                                if (index ==
                                    todayNotificationsLVI.length +
                                        2 +
                                        yesterdayNotificationsLVI.length +
                                        1) {
                                  return const NotificationGroupFooter();
                                }
                                if (index <
                                    todayNotificationsLVI.length +
                                        2 +
                                        yesterdayNotificationsLVI.length +
                                        1) {
                                  return NotificationLVI(
                                      message: yesterdayNotificationsLVI[index -
                                          todayNotificationsLVI.length -
                                          2 -
                                          1]["message"],
                                      datetime: yesterdayNotificationsLVI[
                                          index -
                                              todayNotificationsLVI.length -
                                              2 -
                                              1]["datetime"],
                                      dateformatshort: true,
                                      userprofilepic: yesterdayNotificationsLVI[
                                          index -
                                              todayNotificationsLVI.length -
                                              2 -
                                              1]["userprofilepic"]);
                                }

                                if (index ==
                                    todayNotificationsLVI.length +
                                        2 +
                                        yesterdayNotificationsLVI.length +
                                        2) {
                                  return const NotificationGroupHeader(
                                    title: "Last Week",
                                  );
                                }
                                if (index ==
                                    todayNotificationsLVI.length +
                                        2 +
                                        yesterdayNotificationsLVI.length +
                                        2 +
                                        lastweekNotificationsLVI.length +
                                        1) {
                                  return const NotificationGroupFooter();
                                }
                                if (index <
                                    todayNotificationsLVI.length +
                                        2 +
                                        yesterdayNotificationsLVI.length +
                                        2 +
                                        lastweekNotificationsLVI.length +
                                        1) {
                                  return NotificationLVI(
                                      message: lastweekNotificationsLVI[index -
                                          todayNotificationsLVI.length -
                                          yesterdayNotificationsLVI.length -
                                          2 -
                                          2 -
                                          1]["message"],
                                      datetime: lastweekNotificationsLVI[index -
                                          todayNotificationsLVI.length -
                                          yesterdayNotificationsLVI.length -
                                          2 -
                                          2 -
                                          1]["datetime"],
                                      dateformatshort: false,
                                      userprofilepic: lastweekNotificationsLVI[
                                          index -
                                              todayNotificationsLVI.length -
                                              yesterdayNotificationsLVI.length -
                                              2 -
                                              2 -
                                              1]["userprofilepic"]);
                                } else {
                                  return Container();
                                }
                              })))
                ]))));
  }
}

class NotificationGroupHeader extends StatelessWidget {
  const NotificationGroupHeader({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    TextStyle notificationHeadingStyle = TextStyle(
        fontSize: 20.w,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor2);
    return Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Container(
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13.w),
                    topRight: Radius.circular(13.w))),
            child: Text(
              title,
              style: notificationHeadingStyle,
            )));
  }
}

class NotificationGroupFooter extends StatelessWidget {
  const NotificationGroupFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(13.w),
              bottomRight: Radius.circular(13.w))),
    );
  }
}

class NotificationUserProfilePic extends StatelessWidget {
  const NotificationUserProfilePic({Key? key, required this.path})
      : super(key: key);

  final String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.black12)),
      child: Image.asset(
        path,
        fit: BoxFit.contain,
      ),
    );
  }
}

class NotificationLVI extends StatelessWidget {
  const NotificationLVI(
      {Key? key,
      required this.message,
      required this.datetime,
      required this.dateformatshort,
      required this.userprofilepic})
      : super(key: key);

  final String message;
  final DateTime datetime;
  final bool dateformatshort;
  final Widget userprofilepic;

  @override
  Widget build(BuildContext context) {
    var dateformatShort = DateFormat.jm().format(datetime);
    var dateformatLongYear = DateFormat.yMMMd().format(datetime);
    var dateformatLong = "$dateformatLongYear at $dateformatShort";
    return Container(
        padding: EdgeInsets.all(14.h),
        color: Colors.white,
        width: .9.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 60.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [userprofilepic])),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    message,
                    style: w400_17Avenir(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(dateformatshort ? dateformatShort : dateformatLong,
                      style: w300_13Poppins()),
                ])),
          ],
        ));
  }
}
