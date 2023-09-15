import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/homepage/components/tips_carousel.dart';
import '../../../routes/route_constants.dart';
import '../data.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';

class CategoryButtons extends ConsumerWidget {
  const CategoryButtons({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              itemCount: 4,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: GestureDetector(
                    onTap: () {
                      ref.read(navStateProvider.notifier).state = -1;
                      if (i == 0) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            homePageRoute, (route) => false);
                        Navigator.of(context).pushNamed(rideTabRoute);
                      }
                      if (i == 1) {
                        ref.read(navStateProvider.notifier).state = -1;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            homePageRoute, (route) => false);
                        Navigator.of(context).pushNamed(eatTabRoute);
                      }
                      if (i == 2) {
                        ref.read(navStateProvider.notifier).state = -1;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            homePageRoute, (route) => false);
                        Navigator.of(context).pushNamed(groceryTabRoute);
                      }
                      if (i == 3) {
                        ref.read(navStateProvider.notifier).state = -1;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            homePageRoute, (route) => false);
                        Navigator.of(context).pushNamed(shopsTabRoute);
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.98),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(top: 12, left: 13.17),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 230.w,
                              height: 121.h,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Image.asset(
                                  categoryButtonList[i].image,
                                  width: 66.w,
                                  height: 82.h,
                                  alignment: Alignment.bottomRight,
                                  //   fit: BoxFit.contain
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 203.w,
                              height: 151.h,
                              child: Text(
                                categoryButtonList[i].name,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 21.73.sp,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 23, left: 18),
                            //   child: SizedBox(
                            //     width: 39.6.w,
                            //     child: Image.asset(
                            //       'assets/images/icons/Line 45.png',
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 120.h,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 12.h, left: 16.h),
          child: Row(
            children: [
              Text(
                'Tips From Halen',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w500,
                    fontSize: 18.h),
              ),
            ],
          ),
        ),
        TipsCarousel(tipImages: tipImages),
        SizedBox(
          height: .2.sh,
        )
      ],
    );
  }
}
