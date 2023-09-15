import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_tab/grocery_card.dart';
import 'package:halen_customer_app/screens/grocery/components/grocery_tab/order_again_carousel.dart';
import 'package:halen_customer_app/screens/grocery/data.dart';
import 'package:halen_customer_app/screens/grocery/grocery_shops.dart';

class GroceryTabContent extends StatelessWidget {
  const GroceryTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// for tab bar
    // return Scaffold(
    //     resizeToAvoidBottomInset: false,
    //     backgroundColor: AppColors.baseGreyColor,
    //     body:

    return Column(children: [
      SizedBox(
        height: 20.h,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Order Again",
              style: TextStyle(
                color: AppColors.color20A39E,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 24.w, // Set the desired width
              height: 24.h, // Set the desired height
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const GroceryShops();
                    },
                  ));
                  // Handle "View All" button click
                },
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  color: AppColors.color20A39E,
                  size: 24.h,
                ),
              ),
            ),
          ])),
      SizedBox(
        height: 20.h,
      ),
      const OrderAgain(),
      Expanded(
        child: GridView.builder(
          padding: EdgeInsets.only(top: 12.h),
          itemCount: groceryStoreData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            final item = groceryStoreData[index];
            return GestureDetector(
              onTap: () {},
              child: GroceryCard(store: item),
            );
          },
        ),
      )
    ]);
    // ],
    // ));
  }
}
