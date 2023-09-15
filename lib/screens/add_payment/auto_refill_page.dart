import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:halen_customer_app/screens/account/components/add_payments_button.dart';
import 'dart:convert';
import 'package:halen_customer_app/screens/add_payment/constants.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/add_payments_state.dart';
import 'components/payment_methods_select_listitems.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'payment_methods_page.dart';
import 'components/selection_bullet_point.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/screens/add_payment/auto_refill_splash.dart';
import 'amount_entry_bottom_sheet.dart';

class AutoRefillPage extends ConsumerStatefulWidget {
  const AutoRefillPage({Key? key}) : super(key: key);

  @override
  AutoRefillPageState createState() => AutoRefillPageState();
}

class AutoRefillPageState extends ConsumerState<AutoRefillPage> {
  int amountItemSelected = 0;
  bool autoRefillSwitchVal = false;
  int customAmount = 0;

  autoRefillSwitchPress(BuildContext context, bool newval) {
    if (amountItemSelected != 4) {
      saveRefill(context, newval, fundingAmounts[amountItemSelected]);
    } else {
      saveRefill(context, newval, customAmount);
    }
  }

  saveRefill(BuildContext context, bool newval, int amount) {
    final pm = ref.watch(pmProv);
    final int chosenPaymentMethod = ref.watch(spProv);
    final hc = ref.watch(hcProv);
    if (newval) {
      ref.read(pmProv.notifier).setPM(List.from(pm));
      Map updatedHc = Map.from(hc);
      updatedHc["auto_refill"] = amount.toString();
      List<Map> setList = List.from(pm);
      setList[chosenPaymentMethod]["refill"] =
          json.encode({"amount": amount.toString()});
      ref.read(hcProv.notifier).state = updatedHc;
    } else {
      if (pm[chosenPaymentMethod].containsKey("refill")) {
        pm[chosenPaymentMethod].remove("refill");
        List<Map> setList = List.from(pm);
        ref.read(pmProv.notifier).setPM(setList);
      }
      if (hc.containsKey("auto_refill")) {
        hc.remove("auto_refill");
      }
    }
  }

  customFundsSubmitted(int amount) {
    // save custom funds amount to payment method
    setState(() {
      autoRefillSwitchVal = true;
      customAmount = amount;
    });
    saveRefill(context, true, amount);
    Navigator.pop(context);
  }

  pushPaymentMethodsPage() {
    if (autoRefillSwitchVal) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const AutoRefillSplash();
      }));
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const PaymentMethodsPage();
        }));
      });
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const PaymentMethodsPage();
      }));
    }
  }

  autoRefillSubmit(BuildContext context) {
    if (amountItemSelected == 4) {
      //saveRefill called in  customFundsSubmitted
      pushPaymentMethodsPage();
    } else {
      saveRefill(
          context, autoRefillSwitchVal, fundingAmounts[amountItemSelected]);
      pushPaymentMethodsPage();
    }
  }

  selectAmountItemCB(int val) {
    setState(() {
      amountItemSelected = val;
    });
    if (val == 4) {
      showAddFundsBottomSheet();
    }
    saveRefill(context, autoRefillSwitchVal, fundingAmounts[val]);
  }

  showAddFundsBottomSheet() {
    showModalBottomSheetFloatClose(
        context,
        AddFundsBottomSheetContent(
          addCustomFundsCB: customFundsSubmitted,
        ));
  }

  @override
  Widget build(BuildContext context) {
    Map hc = ref.watch(hcProv);
    List pm = ref.watch(pmProv);
    int chosenPaymentMethod = ref.watch(spProv);

    if (hc.containsKey("auto_refill")) {
      autoRefillSwitchVal = true;
    } else {
      autoRefillSwitchVal = false;
    }
    if (pm[chosenPaymentMethod].containsKey("refill")) {
      autoRefillSwitchVal = true;
    } else {
      autoRefillSwitchVal = false;
    }

    String displayRefillAmount = "";
    if (hc.containsKey("auto_refill")) {
      // funding amount is custom
      if (fundingAmounts.contains(int.parse(hc["auto_refill"])) == false) {
        displayRefillAmount = "\$ ${hc["auto_refill"].toString()}.00";
        amountItemSelected = 4;
      }
      // funding amount is chosen from list
      else {
        amountItemSelected =
            fundingAmounts.indexOf(int.parse(hc["auto_refill"]));
      }
    }

    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        const AccountAppBar(title: "Add Address"),
        // Padding(
        //   padding: EdgeInsets.all(16.w),
        //   child: GestureDetector(
        //       onTap: () {
        //         if (autoRefillSwitchVal) {
        //           Navigator.of(context)
        //               .push(MaterialPageRoute(builder: (context) {
        //             return const AutoRefillSplash();
        //           }));
        //           Future.delayed(const Duration(seconds: 1), () {
        //             Navigator.of(context).pushNamedAndRemoveUntil(
        //                 homePageRoute, (route) => false);
        //             Navigator.of(context)
        //                 .push(MaterialPageRoute(builder: (context) {
        //               return const PaymentMethodsPage();
        //             }));
        //           });
        //         } else {
        //           Navigator.pop(context);
        //         }
        //       },
        //       child: Row(
        //         children: [
        //           const Icon(Icons.arrow_back_ios),
        //           Padding(
        //             padding: EdgeInsets.only(left: 12.w),
        //             child: Text(
        //               "Auto-refill",
        //               style: w400_20Avenir(),
        //             ),
        //           )
        //         ],
        //       )),
        // ),
        Expanded(
            child: ListView(children: [
          Material(
              elevation: 4,
              child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      Text(
                        "Auto-refill",
                        style: w400_14Avenir(),
                      ),
                      Switch(
                        value: autoRefillSwitchVal,
                        onChanged: (newval) {
                          autoRefillSwitchPress(context, newval);
                        },
                        thumbColor: MaterialStateProperty.all(
                            Theme.of(context).scaffoldBackgroundColor),
                        inactiveThumbColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        trackOutlineColor: autoRefillSwitchVal
                            ? MaterialStateProperty.all(AppColors.primaryColor2)
                            : MaterialStateProperty.all(Colors.grey),
                        // not available in flutter stable only master
                        // trackOutlineWidth: MaterialStateProperty.all(18.w),
                        activeTrackColor: autoRefillSwitchVal
                            ? AppColors.primaryColor2
                            : Colors.grey,
                      )
                    ],
                  ))),
          Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                "Set your auto-refill",
                style: w400_16Avenir(),
              )),
          Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                "Choose how much to add to your balance each time it drops below \$10",
                style: w400_13Poppins(),
              )),
          Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(children: [
                AddAmountListButton(
                    index: 0,
                    selectedIndex: amountItemSelected,
                    selectedCB: selectAmountItemCB,
                    amountStr: "\$10.00"),
                AddAmountListButton(
                    index: 1,
                    selectedIndex: amountItemSelected,
                    selectedCB: selectAmountItemCB,
                    amountStr: "\$25.00"),
                AddAmountListButton(
                    index: 2,
                    selectedIndex: amountItemSelected,
                    selectedCB: selectAmountItemCB,
                    amountStr: "\$50.00"),
                AddAmountListButton(
                    index: 3,
                    selectedIndex: amountItemSelected,
                    selectedCB: selectAmountItemCB,
                    amountStr: "\$100.00"),
                AddAmountListButton(
                    index: 4,
                    selectedIndex: amountItemSelected,
                    selectedCB: selectAmountItemCB,
                    amountStr: "Custom $displayRefillAmount")
              ])),
          const PaymentMethodsSelectListItems(),
          const AddPaymentsButton(),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                    onTap: () {
                      autoRefillSubmit(context);
                    },
                    child: Container(
                      width: .7.sw,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(.01.sw)),
                      child: const Center(
                          child: Text(
                        "Set auto-refill",
                        style: TextStyle(color: Colors.white),
                      )),
                    ))
              ]))
        ])),
      ]),
    ));
  }
}

class AddAmountListButton extends StatelessWidget {
  const AddAmountListButton(
      {Key? key,
      required this.index,
      required this.selectedIndex,
      required this.selectedCB,
      required this.amountStr})
      : super(key: key);

  final int index;
  final int selectedIndex;
  final Function selectedCB;
  final String amountStr;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: GestureDetector(
            onTap: () {
              selectedCB(index);
            },
            child: Material(
                elevation: 12,
                child: Container(
                    color: Colors.white,
                    height: 64.h,
                    child: Row(
                      children: [
                        SelectionBulletPoint(
                          index: index,
                          selectedIndex: selectedIndex,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(amountStr, style: w400_19Avenir())
                                ]))
                      ],
                    )))));
  }
}
