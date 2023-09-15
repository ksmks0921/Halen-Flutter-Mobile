import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/app_state.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OfferBanner extends ConsumerStatefulWidget {
  const OfferBanner({
    super.key,
    required this.image,
  });

  final String image;

  @override
  OfferBannerState createState() => OfferBannerState();
}

class OfferBannerState extends ConsumerState<OfferBanner> {
  void toggleExtendedBanner() {
    bool bannerIsShown = ref.read(offerShownProv);
    ref.read(offerShownProv.notifier).state = !bannerIsShown;
  }

  @override
  Widget build(BuildContext context) {
    bool showBanner = ref.watch(offerShownProv);

    double bannerSize = 44.w;
    double bannerTopLayerOverflowSize = 12.w;
    double iconLeftPadding = 24.w;
    double iconBorderSize = 2.h;

    return AnimatedContainer(
        curve: Curves.easeOutQuart,
        duration: const Duration(milliseconds: 300),
        height: bannerSize + bannerTopLayerOverflowSize,
        width: showBanner ? 1.sw : bannerSize + (2 * iconLeftPadding),
        child: Stack(children: [
          Positioned(
              top: bannerTopLayerOverflowSize,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    vertical: 4.h, horizontal: iconLeftPadding),
                width: showBanner ? 1.sw : 0,
                height: bannerSize,
                color: showBanner ? AppColors.primaryColor : Colors.transparent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                            left: iconLeftPadding +
                                bannerSize +
                                (2 * iconBorderSize) +
                                12.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                  child: Text(
                                'Get 10% for 1st ORDER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.h),
                              )),
                              Flexible(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                  top: 1.0.h,
                                ),
                                child: Text(
                                  'On All Stores',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.h,
                                  ),
                                ),
                              )),
                            ],
                          )),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child:
                      TextButton(
                        onPressed: () {
                          toggleExtendedBanner();
                        },
                        child: Image.asset(
                          'assets/images/icons/volume-x.png',
                          height: bannerSize / 2,
                          width: bannerSize / 2,
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    ]),
              )),
          Positioned(
              left: iconLeftPadding,
              top: 0,
              child: InkWell(
                  onTap: () {
                    if (!showBanner) {
                      toggleExtendedBanner();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: showBanner
                          ? null
                          : [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 8.w,
                                  spreadRadius: 1.w,
                                  offset: Offset(3.w, 5.w))
                            ],
                      border: Border.all(
                        color: Colors.white,
                        width: iconBorderSize,
                      ),
                    ),
                    child: Container(
                      // width: percentIconSize,
                      // height: percentIconSize,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor, width: 12.w),
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        widget.image,
                        width: bannerSize * .51,
                        height: bannerSize * .51,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ))),
        ]));
  }
}
