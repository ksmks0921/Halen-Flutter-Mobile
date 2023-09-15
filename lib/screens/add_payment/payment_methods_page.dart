import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';
import 'package:halen_customer_app/screens/account/components/add_payments_button.dart';
import 'package:halen_customer_app/screens/add_payment/add_funds_page.dart';
import 'package:halen_customer_app/screens/add_payment/auto_refill_page.dart';
import 'package:halen_customer_app/routes/route_constants.dart';
import 'package:halen_customer_app/styles/font_style_globle.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'components/payment_methods_listitems.dart';
import 'package:halen_customer_app/appstate/add_payments_state.dart';

class CustomCardImageWidget extends ConsumerWidget {
  const CustomCardImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int cci = ref.watch(scdProv);
    return Image.asset(
      "assets/images/cards/customcard${cci}_bg.png",
      fit: BoxFit.cover,
      width: .9.sw,
      height: .6.sw,
    );
  }
}

class PaymentMethodsPage extends ConsumerStatefulWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  NoPaymentsMethodPageState createState() => NoPaymentsMethodPageState();
}

class NoPaymentsMethodPageState extends ConsumerState<PaymentMethodsPage> {
  @override
  Widget build(BuildContext context) {
    final pm = ref.watch(pmProv);
    Map hc = ref.watch(hcProv);
    bool refillActive = false;

    for (var pmv in pm) {
      if (pmv.containsKey("refill")) {
        refillActive = true;
      }
    }

    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        const AccountAppBar(
          title: "Payment Methods",
        ),
        Expanded(
            child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: .9.sw,
                    height: .6.sw,
                    child: Stack(children: [
                      const CustomCardImageWidget(),
                      Positioned(
                          top: .03.sw,
                          right: .02.sw,
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(.04.sw),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(customizeCardRoute);
                                      },
                                      child: Container(
                                          height: .08.sw,
                                          width: .24.sw,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300]),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: .08.sw,
                                                // width: .08.sw,
                                                child: Image.asset(
                                                  "assets/images/cards/customize_card_button.png",
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              )
                                            ],
                                          ))))
                            ],
                          )),
                      Positioned(
                          top: .24.sw,
                          left: .1.sw,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(.04.sw),
                              child: Container(
                                  height: .12.sw,
                                  width:
                                      .17.sw + ((hc["balance"].length) * 30.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor1),
                                  child: Center(
                                      child: Text(
                                          "\$ ${hc["balance"].split(".")[0]}.00",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.w,
                                              fontWeight: FontWeight.w500)))))),
                    ]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                SizedBox(
                    width: .45.sw,
                    child: Center(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const AddFundsPage();
                              }));
                            },
                            child: Container(
                                width: .33.sw,
                                height: 32.w,
                                decoration: BoxDecoration(
                                    color: AppColors.greyShade600,
                                    borderRadius: BorderRadius.circular(16.w)),
                                child: Image.asset(
                                  "assets/images/cards/add_funds_button.png",
                                ))))),
                const Spacer(
                  flex: 1,
                ),
                SizedBox(
                    width: .45.sw,
                    child: Center(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const AutoRefillPage();
                              }));
                            },
                            child: Container(
                                width: .33.sw,
                                height: 32.w,
                                decoration: BoxDecoration(
                                    color: refillActive
                                        ? AppColors.primaryColor2
                                        : AppColors.greyShade600,
                                    borderRadius: BorderRadius.circular(16.w)),
                                child: refillActive
                                    ? Image.asset(
                                        "assets/images/cards/auto_refill_active_button.png",
                                      )
                                    : Image.asset(
                                        "assets/images/cards/auto_refill_button.png",
                                      ))))),
              ],
            ),
          ),
          PaymentMethodsListItems(key: UniqueKey()),
          pm.length < 2
              ? Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(children: [
                    Text(
                      "You don't have any saved payment yet. You can start by tapping below",
                      style: w400_16Poppins(),
                    )
                  ]))
              : Container(),
          const AddPaymentsButton(),
          Container(
            height: 200,
          )
        ])),
      ],
    )));
  }
}
