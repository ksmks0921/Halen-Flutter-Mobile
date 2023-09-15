import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/appstate/add_payments_state.dart';
import 'package:halen_customer_app/screens/account/components/account_page_appbar.dart';

// 8 custom cards for now
// images in assets/images/cards/customcard0 - customcard7
class CustomizeCardPage extends ConsumerStatefulWidget {
  const CustomizeCardPage({Key? key}) : super(key: key);

  @override
  CustomizeCardPageState createState() => CustomizeCardPageState();
}

class CustomizeCardPageState extends ConsumerState<CustomizeCardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      const AccountAppBar(title: "Customize Card"),
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
      //           "Customize Halen Card",
      //           style: w400_20Avenir(),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      Expanded(
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                String cardImgPath =
                    "assets/images/cards/customcard${index}_bg.png";
                return ChooseCustomCardLVI(
                    cardImgPath: cardImgPath, index: index);
              }))
    ])));
  }
}

class ChooseCustomCardLVI extends ConsumerWidget {
  const ChooseCustomCardLVI(
      {Key? key, required this.cardImgPath, required this.index})
      : super(key: key);

  final String cardImgPath;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(scdProv);
    return Padding(
        padding: EdgeInsets.all(32.w),
        child: GestureDetector(
            onTap: () {
              ref.read(scdProv.notifier).state = (index);
            },
            child: Container(
              width: .9.sw,
              height: .6.sw,
              decoration: selectedIndex == (index)
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(22.w),
                      border: Border.all(color: Colors.lightBlue, width: 3.w),
                      boxShadow: const [
                          BoxShadow(
                              spreadRadius: 4,
                              blurRadius: 8,
                              color: Colors.lightBlueAccent)
                        ])
                  : null,
              child: Image.asset(
                cardImgPath,
                width: .9.sw,
                height: .6.sw,
                fit: BoxFit.fill,
              ),
            )));
  }
}
