import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:halen_customer_app/screens/account/components/add_payments_button.dart';
import 'package:halen_customer_app/screens/add_payment/components/selection_bullet_point.dart';
import 'package:halen_customer_app/screens/add_payment/deposit_pending_splash.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/add_payments_state.dart';
import 'components/payment_methods_select_listitems.dart';
import 'package:halen_customer_app/components/sys_modal_bottom_sheet_float_close.dart';
import 'payment_methods_page.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'amount_entry_bottom_sheet.dart';
import 'constants.dart';

class AddFundsPage extends ConsumerStatefulWidget {
  const AddFundsPage({Key? key}) : super(key: key);

  @override
  AddFundsPageState createState() => AddFundsPageState();
}

class AddFundsPageState extends ConsumerState<AddFundsPage> {
  int amountItemSelected = 0;
  selectAmountItemCB(int val) {
    setState(() {
      amountItemSelected = val;
    });
  }

  addFundsAndPushPaymentsPage(amount) {
    addToBalance(amount);
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const PaymentMethodsPage();
      }));
    });

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const DepositPendingSplash();
    }));
  }

  submitAddFunds() {
    if (amountItemSelected == 4) {
      showAddFundsBottomSheet();
    } else {
      addFundsAndPushPaymentsPage(fundingAmounts[amountItemSelected]);
    }
  }

  addToBalance(int addAmount) {
    final Map hc = ref.read(hcProv);
    Map updatedCard = {};
    updatedCard["balance"] =
        (double.parse(hc["balance"]) + addAmount).toString();
    ref.read(hcProv.notifier).state = updatedCard;
  }

  showAddFundsBottomSheet() {
    showModalBottomSheetFloatClose(
        context,
        AddFundsBottomSheetContent(
          addCustomFundsCB: addFundsAndPushPaymentsPage,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        const AccountAppBar(title: "Add Funds"),
        // Padding(
        //   padding: EdgeInsets.all(16.w),
        //   child: Row(
        //     children: [
        //       GestureDetector(
        //           onTap: () {
        //             Navigator.pop(context);
        //           },
        //           child: const Icon(Icons.arrow_back_ios)),
        //       Padding(
        //         padding: EdgeInsets.only(left: 12.w),
        //         child: Text(
        //           "Add Funds",
        //           style: w400_20Avenir(),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        Expanded(
            child: ListView(children: [
          Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                "How much do you want to add to your Halen Card?",
                style: w400_16Poppins(),
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
                    amountStr: "Custom")
              ])),
          const PaymentMethodsSelectListItems(),
          const AddPaymentsButton(),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                    onTap: () {
                      submitAddFunds();
                    },
                    child: Container(
                      width: .7.sw,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(.01.sw)),
                      child: const Center(
                          child: Text(
                        "Add Funds",
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
