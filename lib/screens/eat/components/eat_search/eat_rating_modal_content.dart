import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EatRatingBottomSheetContent extends StatefulWidget {
  const EatRatingBottomSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  State<EatRatingBottomSheetContent> createState() =>
      _EatRatingBottomSheetContentState();
}

class _EatRatingBottomSheetContentState
    extends State<EatRatingBottomSheetContent> {
  List<Widget> buildStarRatingEntries = [];

  List ratingEntryName = [
    "No Rating",
    "1 and above",
    "2 and above",
    "3 and above",
    "4 and above",
    "4.5 and above",
  ];

  @override
  void initState() {
    for (var rn in ratingEntryName) {
      buildStarRatingEntries.add(StarRatingEntry(entryName: rn));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: .6.sh,
        color: Colors.white,
        child: Column(children: [
          Expanded(
              child: ListView(children: [
            Material(
                elevation: 4,
                child: Container(
                    padding: EdgeInsets.all(24.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Star Rating",
                            style: TextStyle(
                                color: AppColors.primaryColor1, fontSize: 24.w),
                          )
                        ]))),
            SizedBox(
              height: 32.w,
            ),
            ...buildStarRatingEntries
          ])),
        ]));
  }
}

class StarRatingEntry extends StatelessWidget {
  const StarRatingEntry({Key? key, required this.entryName}) : super(key: key);

  final String entryName;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1.w, color: Colors.black38))),
        child: ListTile(
          title: Text(entryName),
          textColor: AppColors.bglDefTextColor,
        ));
  }
}
