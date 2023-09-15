import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:halen_customer_app/screens/eat/components/etc/rating_chip.dart';
import 'package:halen_customer_app/screens/eat/components/vendor_detail/eat_vendor_detail.dart';
import 'package:halen_customer_app/widgets/image_widgets/aspect_ratios.dart';

class EatVendorCard extends StatefulWidget {
  const EatVendorCard({super.key, required this.vendor});

  final EatVendor vendor;
  @override
  State<EatVendorCard> createState() => _EatVendorCardState();
}

class _EatVendorCardState extends State<EatVendorCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return EatVendorDetail(
              vendor: widget.vendor,
            );
          }));
        },
        child: Container(
          width: .88.sw,
          // height: .84.sw,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(.02.sw)),
          // padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(.02.sw),
                        topRight: Radius.circular(.02.sw),
                      ),
                      child: AspectVendorFeatureFullScreen(
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.vendor.image),
                                  fit: BoxFit.fitWidth,
                                ),
                              )))),
                  Positioned(
                    top: 12.w,
                    right: 12.w,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: .05.sw,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.w),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text(
                        widget.vendor.name,
                        style: TextStyle(
                            color: AppColors.bglDefTextColor,
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
              SizedBox(height: 8.w),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Text(
                    widget.vendor.shortDesc!,
                    style: TextStyle(
                        color: AppColors.bglDefTextColor, fontSize: 12.w),
                  )),
              SizedBox(height: 12.h),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 37.w, vertical: 12.h),
                  child: RatingChip(
                    vendor: widget.vendor,
                  ))
            ],
          ),
        ));
  }
}
