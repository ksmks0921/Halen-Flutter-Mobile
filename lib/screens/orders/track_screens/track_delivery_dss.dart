import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/screens/account/components//account_page_appbar.dart';
import 'package:halen_customer_app/screens/orders/track_components/order_details_line_items.dart';
import 'package:halen_customer_app/screens/orders/track_components/order_stages_line_indicator.dart';
import 'package:halen_customer_app/screens/orders/track_components/track_order_payment_details.dart';
import 'package:halen_customer_app/screens/orders/track_components/track_delivery_header.dart';
import 'package:halen_customer_app/screens/homepage/components/navigationBar/navigation_bar.dart';

// draggable scrollable sheet size
final dsss = StateProvider<double>((ref) {
  return .45;
});

class CSExpand extends ConsumerWidget {
  const CSExpand({
    Key? key,
    required this.child,
    // required this.snapOffset
    required this.expandZero,
    required this.expandEnd,
  }) : super(key: key);
  final Widget child;
  // final double snapOffset;

  final double expandZero;
  final double expandEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // double gdsss = ref.watch(dsss);

    /// y(x) such that y(.2) = 0 and y(.8) = 1
    /// y = (x - .2) + (2/3)(x-.2)
    ///
    double rssh = ref.watch(dsss);
    double xx = (rssh);
    // double yy = ( xx - .2) + (2/3) * (xx - .2);

    /// y(x) such that y(A) = 0 and y(B) = 1
    ///
    /// y = (1/(B-A))x - (A/(B-A))

    double yy = (1 / (expandEnd - expandZero)) * xx -
        (expandZero / (expandEnd - expandZero));

    return Transform(
        transform: Matrix4.identity()
          ..scale(
              1.0,
              (yy > 1
                  ? 1
                  : yy < 0
                      ? 0
                      : yy)),
        alignment: Alignment.center,
        child: child);
  }
}

class CSShrink extends ConsumerWidget {
  const CSShrink({
    Key? key,
    required this.child,
    // required this.snapOffset
    required this.shrinkZero,
    required this.shrinkEnd,
  }) : super(key: key);
  final Widget child;
  // final double snapOffset;

  final double shrinkZero;
  final double shrinkEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // double gdsss = ref.watch(dsss);

    double rssh = ref.watch(dsss);
    double xx = (rssh);

    /// y(x) such that y(A) = 1 and y(B) = 0
    ///
    /// y = -(1/(B-A))x + (A/(B-A)) + 1

    double yy = (-(1 / (shrinkEnd - shrinkZero)) * xx) +
        (shrinkZero / (shrinkEnd - shrinkZero)) +
        1;

    return Transform(
        transform: Matrix4.identity()
          ..scale(
              1.0,
              (yy > 1
                  ? 1
                  : yy < 0
                      ? 0
                      : yy)),
        alignment: Alignment.center,
        child: child);
  }
}

class TrackDeliveryScreen extends ConsumerStatefulWidget {
  const TrackDeliveryScreen({Key? key, required this.orderData})
      : super(key: key);
  final Map orderData;
  @override
  TrackDeliveryScreenState createState() => TrackDeliveryScreenState();
}

class TrackDeliveryScreenState extends ConsumerState<TrackDeliveryScreen> {
  DraggableScrollableController dsc = DraggableScrollableController();

  dscListener() {
    ref.read(dsss.notifier).state = dsc.size;
  }

  @override
  void dispose() {
    dsc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const CustomNavigationBar(),
      body: Stack(children: [
        Positioned(
          child: ListView(children: [
            Container(
              height: 1.sh,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ridesharing/Frame 6.png'),
                  fit: BoxFit.cover,
                ),
                color: Colors.black,
              ),
            ),
          ]),
        ),
        Positioned(
            child: Column(
          children: [
            const AccountAppBar(title: "Track Order"),
            TrackDeliveryHeader(
              orderData: widget.orderData,
            ),
          ],
        )),
        Transform(
            transform: Matrix4.identity()..scale(.98, 1.0),
            alignment: Alignment.center,
            child: DraggableScrollableSheet(
              controller: dsc,
              snap: true,
              initialChildSize: .45,
              maxChildSize: .9,
              minChildSize: .175,
              snapSizes: const [.175, .45, .9],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                // ssc = scrollController;
                // ssc.addListener(ssc_listener);
                dsc.addListener(dscListener);
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.w),
                            topLeft: Radius.circular(12.w)),
                        color: Colors.white),
                    child:
                        // Container(height: 11,color: Colors.purple,));
                        ListView(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                            height: 88.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(mainAxisSize: MainAxisSize.min, children: [
                                  Padding(
                                      padding: EdgeInsets.all(16.w),
                                      child: Image.asset(
                                        widget.orderData["driver"]
                                            ["profile_img"],
                                        fit: BoxFit.contain,
                                      )),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          widget.orderData["driver"]["name"],
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 20.h),
                                        ),
                                        Text(
                                          "Your delivery partner",
                                          style: w400_16Poppins(),
                                        )
                                      ])
                                ]),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2.w,
                                                    color:
                                                        AppColors.peachButton),
                                                shape: BoxShape.circle),
                                            padding: EdgeInsets.all(8.w),
                                            child: Center(
                                              child: Icon(Icons.message_sharp,
                                                  color: AppColors.peachButton),
                                            ))),
                                    Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2.w,
                                                    color:
                                                        AppColors.peachButton),
                                                shape: BoxShape.circle),
                                            padding: EdgeInsets.all(8.w),
                                            child: Center(
                                              child: Icon(
                                                  Icons.phone_callback_sharp,
                                                  color: AppColors.peachButton),
                                            )))
                                  ],
                                )
                              ],
                            )),
                        CSShrink(
                            // snapOffset: .45,
                            shrinkZero: .2,
                            shrinkEnd: .45,
                            child: Container(
                              padding: EdgeInsets.all(16.h),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 1, color: Colors.black38))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Order Information",
                                      style: TextStyle(
                                          color: AppColors.primaryColor1,
                                          fontSize: 22.h))
                                ],
                              ),
                            )),
                        const CSExpand(
                          expandZero: .2,
                          expandEnd: .45,
                          child: OrderStagesLineIndicator(),
                        ),
                        CSExpand(
                          expandZero: .45,
                          expandEnd: .8,
                          child: OrderDetailsLineItems(
                            orderData: widget.orderData,
                            enableCallService: true,
                          ),
                        ),
                        TrackOrderPaymentDetails(
                          orderData: widget.orderData,
                        ),
                      ],
                    ));
              },
            ))
      ]),
    ));
  }
}
