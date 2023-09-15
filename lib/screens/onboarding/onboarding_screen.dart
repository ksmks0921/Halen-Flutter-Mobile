import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:halen_customer_app/widgets/circle_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int? _index = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _pageController.addListener(() {
      setState(() {
        _index = _pageController.page?.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: Colors.black, //change your color here
        // ),
        leading: _index == 0
            ? null
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor1,
                ),
                onPressed: () {
                  if (_index == 1 || _index == 2) {
                    setState(() {
                      _index = _index! - 1;
                      _pageController.animateToPage(_index!,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    });
                  }

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return UserRegistrationStep1();
                  //     },
                  //   ),
                  // );
                },
              ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 32),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Material(
                    child: buildPages(
                        'assets/images/illustrations/illustration_1.png',
                        'Order',
                        "Make your life a little easier in every possible way. From essential services to vacation rental. We're an all-in-one platform."),
                  ),
                  buildPages(
                      'assets/images/illustrations/illustration_2.png',
                      'Track',
                      'Realtime Update: Ability to track your driver or an order, you will be able to track the location using the Halen app.'),
                  buildPages(
                      'assets/images/illustrations/illustration_3.png',
                      'Deliver',
                      'A World of Food and Grocery at Your Fingertips, Shop places you love online, schedule, and sit back with an On-Demand delivery.'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(40.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(homePageRoute);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.primaryColor1,
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      CircleIndicator(selected: _index == 0),
                      CircleIndicator(selected: _index == 1),
                      CircleIndicator(selected: _index == 2),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        if (_index == 2) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              homePageRoute, (route) => false);
                        } else {
                          setState(() {
                            _index = _index! + 1;
                            _pageController.animateToPage(_index!,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor3,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 2.h),
                          child: Image.asset(
                            'assets/images/icons/arrow_right.png',
                            width: 49.w,
                            height: 32.h,
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget buildPages(String imagePath, String title, String text) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Material(
        //   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
        //   shadowColor: AppColors.primaryColor1,
        //   elevation: 18,
        //   child:
        Image.asset(
          imagePath,
          width: .67.sw,
          height: .67.sw,
          fit: BoxFit.contain,
          // ),
        ),
        SizedBox(
          height: 36.h,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColors.primaryColor1,
              fontFamily: 'Avenir-Heavy',
              fontSize: 28.sp,
              fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 31.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  height: 1.4,
                  fontFamily: 'Avenir-Medium',
                  letterSpacing: 1.05.sp),
            ),
          ),
        ),
      ],
    );
  }
}
