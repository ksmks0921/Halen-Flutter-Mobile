import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/widgets/image_view.dart';

class PaymentCardInformation extends StatelessWidget {
  final bool? showArrow;
  const PaymentCardInformation({Key? key, this.showArrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ImageView(
              fit: BoxFit.fill,
              path: 'assets/images/ridesharing/visa.png',
              height: 30,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "•••• 7539",
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Visibility(
          visible: showArrow!,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: AppColors.greyShade600,
          ),
        ),
      ],
    );
  }
}
