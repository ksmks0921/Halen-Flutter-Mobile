import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/add_payments_state.dart';

class PaymentMethodsListItems extends ConsumerStatefulWidget {
  const PaymentMethodsListItems({
    Key? key,
  }) : super(key: key);

  @override
  PaymentMethodsListItemsState createState() => PaymentMethodsListItemsState();
}

class PaymentMethodsListItemsState
    extends ConsumerState<PaymentMethodsListItems> {
  List getPaymentMethods = [];

  @override
  Widget build(BuildContext context) {
    getPaymentMethods = ref.watch(pmProv);
    return Column(children: [
      Padding(
          padding: EdgeInsets.all(16.w), child: const Text("Payment methods")),
      BuildPaymentMethodsListItems(
        getPaymentMethods: getPaymentMethods,
      )
    ]);
  }
}

class BuildPaymentMethodsListItems extends StatelessWidget {
  BuildPaymentMethodsListItems({
    Key? key,
    required this.getPaymentMethods,
  }) : super(key: key);

  final List getPaymentMethods;
  final List<Widget> builtPaymentMethodsListItems = [];

  @override
  Widget build(BuildContext context) {
    for (var paymentMethod in getPaymentMethods) {
      Widget bpmli = Padding(
          padding: EdgeInsets.all(16.w),
          child: GestureDetector(
              onTap: () {
// Push card page
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 1.w))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 36.w,
                                  child: Image.asset(
                                    paymentMethod["icon"],
                                    fit: BoxFit.contain,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: Text(
                                    paymentMethod["display_number"] ?? "",
                                    style: w400_16Poppins(),
                                  )),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey[400],
                              )
                            ])
                      ]))));

      builtPaymentMethodsListItems.add(bpmli);
    }

    return Column(children: builtPaymentMethodsListItems);
  }
}
