import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/add_payment/components/selection_bullet_point.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/appstate/add_payments_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodsSelectListItems extends ConsumerStatefulWidget {
  const PaymentMethodsSelectListItems({
    Key? key,
  }) : super(key: key);

  @override
  PaymentMethodsSelectListItemsState createState() =>
      PaymentMethodsSelectListItemsState();
}

class PaymentMethodsSelectListItemsState
    extends ConsumerState<PaymentMethodsSelectListItems> {
  List getPaymentMethods = [];

  @override
  Widget build(BuildContext context) {
    getPaymentMethods = ref.watch(pmProv);
    return Column(children: [
      Padding(
          padding: EdgeInsets.all(16.w), child: const Text("Payment methods")),
      const BuildPaymentMethodsSelectListItems()
    ]);
  }
}

class BuildPaymentMethodsSelectListItems extends ConsumerWidget {
  const BuildPaymentMethodsSelectListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setChosenPaymentMethod(index) {
      ref.read(spProv.notifier).state = index;
    }

    int selectedPM = ref.watch(spProv);

    final List paymentMethods = ref.watch(pmProv);

    double liPadding;
    double rowPadding;
    double iconHeight;
    liPadding = 16.w;
    rowPadding = 16.w;
    iconHeight = 36.h;

    return SizedBox(
        height: (iconHeight + (2 * rowPadding) + (2 * liPadding)) *
            paymentMethods.length,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentMethods.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.all(liPadding),
                  child: GestureDetector(
                      onTap: () {
                        setChosenPaymentMethod(index);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: rowPadding),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1.w))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SelectionBulletPoint(
                                                index: index,
                                                selectedIndex: selectedPM)
                                            // chosenPaymentMethod)
                                          ]),
                                      SizedBox(
                                          height: iconHeight,
                                          // width: 36.w,
                                          child: Image.asset(
                                            paymentMethods[index]["icon"],
                                            fit: BoxFit.contain,
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(left: 24.w),
                                          child: Text(
                                            paymentMethods[index]
                                                    ["display_number"] ??
                                                "",
                                            style: w400_16Poppins(),
                                          )),
                                    ]),
                              ]))));
            }));
  }
}
