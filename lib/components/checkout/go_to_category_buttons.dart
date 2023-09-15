import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/home_page_state.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/shop_retail/data.dart';
import 'package:halen_customer_app/routes/route_constants.dart';

class CheckoutGoToCategoryButtons extends ConsumerWidget {
  const CheckoutGoToCategoryButtons({super.key, required this.clearCartCB});

  final Function clearCartCB;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          itemCount: 4,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: GestureDetector(
                onTap: () async {
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     homePageRoute, (route) => false);
                  clearCartCB(context, ref, "cat");
                  if (i == 0) {
                    ref.read(navStateProvider.notifier).state = 1;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        rideTabRoute, (route) => false);
                    // Navigator.of(context).pushNamed(rideTabRoute);
                  }
                  if (i == 1) {
                    ref.read(navStateProvider.notifier).state = 2;
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(eatTabRoute, (route) => false);
                    // Navigator.of(context).pushNamed(eatTabRoute);
                  }
                  if (i == 2) {
                    ref.read(navStateProvider.notifier).state = 3;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        groceryTabRoute, (route) => false);
                    // Navigator.of(context).pushNamed(groceryTabRoute);
                  }
                  if (i == 3) {
                    ref.read(navStateProvider.notifier).state = 4;
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        shopsTabRoute, (route) => false);
                    // Navigator.of(context).pushNamed(shopsTabRoute);
                    // Navigator.of(context).pushNamed(retailPageRoute);
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 12.h, left: 13.w),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 230.w,
                          height: 151.h,
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
            mainAxisExtent: 130.h,
          ),
        ),
      ),
    );
  }
}
