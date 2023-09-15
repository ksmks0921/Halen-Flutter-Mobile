import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/homepage/data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreenImageCarousel extends StatefulWidget {
  const HomeScreenImageCarousel({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenCarouselWithIndicatorState();
  }
}

class _HomeScreenCarouselWithIndicatorState
    extends State<HomeScreenImageCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 165.w,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: homescreenCarouselImages.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: (_current == entry.key ? 24.0.w : 12.0.w),
              height: 4.h,
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: (_current == entry.key
                    ? AppColors.greenColor
                    : Colors.black26),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

final List<Widget> imageSliders = homescreenCarouselImages
    .map((item) => ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.fill, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      width: 1000,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(58, 0, 0, 0),
                            // Colors.red,
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ))
    .toList();
