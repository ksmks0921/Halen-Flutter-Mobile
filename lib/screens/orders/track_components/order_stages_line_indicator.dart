import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/orders/models/order_models.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/components/etc/vertical_dashed_line.dart';

class OrderStagesLineIndicator extends ConsumerWidget {
  const OrderStagesLineIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle trackOrderSectionTS;
    trackOrderSectionTS =
        TextStyle(color: AppColors.primaryColor1, fontSize: 20.w);

    List buildOrderStagesVertStepIndicator = [];

    for (var stage in orderStages) {
      if (orderStagesComplete.contains(stage)) {
        buildOrderStagesVertStepIndicator.add(VertStepIndicatorRowLabel(
          complete: true,
          stagelabel: stage,
        ));
        if (orderStages.indexOf(stage) != orderStages.length - 1) {
          buildOrderStagesVertStepIndicator.add(SizedBox(
              height: 24.h,
              child: const VerticalStepIndicatorDashedLine(complete: true)));
        }
      } else {
        buildOrderStagesVertStepIndicator.add(VertStepIndicatorRowLabel(
          complete: false,
          stagelabel: stage,
        ));
        if (orderStages.indexOf(stage) != orderStages.length - 1) {
          buildOrderStagesVertStepIndicator.add(SizedBox(
              height: 24.h,
              child: const VerticalStepIndicatorDashedLine(complete: false)));
        }
      }
    }

    return Container(
        padding: EdgeInsets.all(16.w),
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black38))),
        child: Column(children: [
          Row(
            children: [Text("Order Status", style: trackOrderSectionTS)],
          ),
          SizedBox(
            height: 16.w,
          ),
          ...buildOrderStagesVertStepIndicator
        ]));
  }
}

class VertStepIndicatorRowLabel extends StatelessWidget {
  const VertStepIndicatorRowLabel(
      {Key? key, required this.complete, required this.stagelabel})
      : super(key: key);
  final bool complete;
  final String stagelabel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: complete ? AppColors.primaryColor : AppColors.greyShade600,
              shape: BoxShape.circle),
          width: 12.w,
          height: 12.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, top: 12.w, bottom: 12.w),
          child: Text(
            stagelabel,
            style: w400_16Avenir(),
          ),
        )
      ],
    );
  }
}

class VerticalStepIndicatorDashedLine extends StatelessWidget {
  const VerticalStepIndicatorDashedLine({Key? key, required this.complete})
      : super(key: key);

  final bool complete;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 6.w,
        ),
        VerticalDashedLine(
          color: complete ? AppColors.primaryColor1 : AppColors.greyShade600,
          thickness: 2.w,
        )
      ],
    );
  }
}
