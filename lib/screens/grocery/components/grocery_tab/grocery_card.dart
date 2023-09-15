import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/grocery/grocery.dart';
import 'package:halen_customer_app/screens/grocery/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryCard extends ConsumerStatefulWidget {
  const GroceryCard({super.key, required this.store});

  final GroceryVendor store;

  @override
  GroceryCardState createState() => GroceryCardState();
}

class GroceryCardState extends ConsumerState<GroceryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Grocery(
                    vendor: widget.store,
                  );
                },
              ));
            },
            child: Container(
              width: 158.w,
              // height: 212.w,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(.02.sw)),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(14.w),
                    // width: 80.w,
                    height: 108.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.store.image),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 10.w), // Adjust the margin as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.r),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 14.r,
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(
                      height: 38.h,
                      child: Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Text(
                            widget.store.name,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.h,
                                fontWeight: FontWeight.w600),
                          ))),
                  SizedBox(height: 8.h),
                  Text(
                    widget.store.addressShort ?? "",
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12.h,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.store.deliveryTimeStr ?? "",
                    style: TextStyle(color: Colors.grey, fontSize: 14.h),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            )));
  }
}
