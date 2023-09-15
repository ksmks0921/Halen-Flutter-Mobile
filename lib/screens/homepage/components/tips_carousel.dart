import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:halen_customer_app/screens/homepage/data.dart';
// import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:expandable_page_view/expandable_page_view.dart';

class TipsCarousel extends ConsumerStatefulWidget {
  const TipsCarousel({super.key, required this.tipImages});
  final List<String> tipImages;

  @override
  CarouselWithIndicatorState createState() {
    return CarouselWithIndicatorState();
  }
}

class CarouselWithIndicatorState extends ConsumerState<TipsCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
        // child: CarouselSlider(
        //   options: CarouselOptions(padEnds: false),
        ////   options: CarouselOptions(height: 155.h),
        // child: ExpandablePageView(
        child: GestureDetector(
            onTap: () {
              // ref.read(navStateProvider.notifier).state = -1;
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
              // Navigator.of(context).pushNamed(rideTabRoute);
            },
            child: SizedBox(
                height: .4.sw,
                width: 1.sw,
                child: PageView(
                  controller: PageController(viewportFraction: .88),
                  padEnds: false,
                  children: tipImages.map((i) {
                    return Builder(builder: (BuildContext context) {
                      return Padding(
                          padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                child: Image.asset(
                                  i,
                                  fit: BoxFit.fill,
                                  // width: .7.sw,
                                  height: .33.sw,
                                ),
                              ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              // if (i == 'assets/images/illustrations/goto_ridegroup.png')
                              //   Column(
                              //     children: [
                              //       Padding(
                              //         padding: EdgeInsets.only(top: 8.h, left: 8.h),
                              //         child: Align(
                              //           alignment: Alignment.centerLeft,
                              //           child: Text(
                              //             tipHeadline[0],
                              //             style: TextStyle(
                              //                 fontSize: 16.h,
                              //                 fontWeight: FontWeight.w600,
                              //                 color: Colors.black),
                              //           ),
                              //         ),
                              //       ),
                              //       SizedBox(
                              //         height: 8.h,
                              //       ),
                              //       Column(children: [
                              //         Text(
                              //           tipBody[0],
                              //           style: TextStyle(
                              //               fontSize: 16.h,
                              //               fontWeight: FontWeight.w400,
                              //               color: Colors.black),
                              //         )
                              //       ]),
                              //     ],
                              //   ),
                            ],
                          ));
                    });
                  }).toList(),
                ))),
      ),
    ]);
  }
}
