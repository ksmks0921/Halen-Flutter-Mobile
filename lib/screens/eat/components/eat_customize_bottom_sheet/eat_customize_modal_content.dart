import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/screens/eat/data.dart';
import 'package:halen_customer_app/screens/eat/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:halen_customer_app/appstate/eat_cart_state.dart';
import 'package:halen_customer_app/methods/conversions/price_string_util.dart';

class EatCustomizeBottomSheetContent extends ConsumerStatefulWidget {
  const EatCustomizeBottomSheetContent(
      {Key? key,
      required this.product,
      required this.vendor,
      required this.showItemAddedSnackBarCB})
      : super(key: key);

  final EatProduct product;
  final EatVendor vendor;
  final Function showItemAddedSnackBarCB;

  @override
  EatCustomizeBottomSheetContentState createState() =>
      EatCustomizeBottomSheetContentState();
}

class EatCustomizeBottomSheetContentState
    extends ConsumerState<EatCustomizeBottomSheetContent> {
  List<Widget> buildCustomizationInclusiveSelectGroupEntries = [];
  List<Widget> buildCustomizationExclusiveSelectGroupEntries = [];

  // use name of EatProductCustomization to check required fields are selected
  List<String> requiredCustomizations = [];

  List<EatProductCustomization> setCustomizations = [];

  bool showRequiredNotSetSnackBar = false;
  String requiredCustomizationName = "";

  @override
  void initState() {
    for (EatProductCustomization epc in eatProductCustomizationOptions) {
      if (epc.required) {
        requiredCustomizations.add(epc.name);
      }
      if (epc.exclusive) {
        buildCustomizationExclusiveSelectGroupEntries.add(
            CustomizationExclusiveSelectGroupEntry(
                eatCustomization: epc,
                updateCustomizationsCB: updateCustomizationsCB));
      }
      if (!epc.exclusive) {
        buildCustomizationInclusiveSelectGroupEntries.add(
            CustomizationInclusiveSelectGroupEntry(
                eatCustomization: epc,
                updateCustomizationsCB: updateCustomizationsCB));
      }
    }
    super.initState();
  }

  // czn is the full object with all options, eci is the item to be set
  updateCustomizationsCB(EatProductCustomization czn,
      EatProductCustomizationItem eci, bool addOrRemove) {
    if (addOrRemove) {
      bool customizationGroupExists = false;
      int sceIdx = 0;

      // check if exists already
      for (EatProductCustomization epc in setCustomizations) {
        if (czn.name == epc.name) {
          customizationGroupExists = true;
          sceIdx = setCustomizations.indexWhere((sc) => sc.name == czn.name);
        }
      }
      if (customizationGroupExists) {
        setCustomizations[sceIdx].items.add(eci);
      }
      // add new if doesn't exist
      else {
        setCustomizations.add(EatProductCustomization(
            required: czn.required,
            name: czn.name,
            items: [eci],
            multiple: czn.multiple,
            exclusive: czn.exclusive));
      }
    }
    // remove item
    else {
      // have to keep indexes and update after loop to avoid concurrent modification
      int sepcIdx = 0;
      int sepcIdxGet = 0;
      int sepciIdx = 0;
      int sepciIdxGet = 0;
      for (EatProductCustomization epc in setCustomizations) {
        if (epc.name == czn.name) {
          sepcIdxGet = sepcIdx;
          for (EatProductCustomizationItem epci in epc.items) {
            if (epci.name == eci.name) {
              sepciIdxGet = sepciIdx;
            }
            sepciIdx += 1;
          }
        }
        sepcIdx += 1;
      }

      setCustomizations[sepcIdxGet].items.removeAt(sepciIdxGet);

      if (setCustomizations[sepcIdxGet].items.isEmpty) {
        setCustomizations.removeAt(sepcIdxGet);
      }
    }
  }

  confirmAddToCartCB() {
    // be sure user set required items first
    List<String> checkRequiredCustomizations = requiredCustomizations;

    for (EatProductCustomization sc in setCustomizations) {
      checkRequiredCustomizations.removeWhere((String rc) => sc.name == rc);
    }
    // user did not complete required customizations
    if (requiredCustomizations.isNotEmpty) {
      // doesn't show over bottom sheet
      // ScaffoldMessenger.of(context).showSnackBar(
      //   requiredNotSetSnackBar(requiredCustomizations[0])
      // );
      // so I made a custom snackbar shown with showRequiredNotSetSnackBar
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          showRequiredNotSetSnackBar = false;
        });
      });
      setState(() {
        showRequiredNotSetSnackBar = true;
        requiredCustomizationName = requiredCustomizations[0];
      });
      return;
    }

    // create new instance of widget product to add to state product list and not duplicate reference
    widget.product.customizations = setCustomizations;
    ref
        .read(eatOrderProv.notifier)
        .addItemToOrder(EatProduct.copy(widget.product), widget.vendor);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: .8.sh,
        color: Colors.white,
        child: Stack(children: [
          Column(children: [
            Expanded(
                child: ListView(children: [
              Material(
                  elevation: 12,
                  child: Container(
                      padding: EdgeInsets.all(24.w),
                      child: Text(
                        "Customize your Order",
                        style: TextStyle(
                            color: AppColors.primaryColor1, fontSize: 24.w),
                      ))),
              SizedBox(
                height: 32.w,
              ),
              ...buildCustomizationInclusiveSelectGroupEntries,
              ...buildCustomizationExclusiveSelectGroupEntries
            ])),
            Container(
              padding: EdgeInsets.all(16.h),
              child: ElevatedButton(
                onPressed: () {
                  confirmAddToCartCB();
                  widget.showItemAddedSnackBarCB();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.color20A39E,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Container(
                  height: 48.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          RequiredNotSetSnackBar(
              show: showRequiredNotSetSnackBar,
              requiredCustomizationName: requiredCustomizationName)
          //   ],
          // )
        ]));
  }
}

class CustomizationExclusiveSelectGroupEntry extends StatefulWidget {
  const CustomizationExclusiveSelectGroupEntry(
      {Key? key,
      required this.eatCustomization,
      required this.updateCustomizationsCB})
      : super(key: key);

  final EatProductCustomization eatCustomization;
  final Function updateCustomizationsCB;

  @override
  State<CustomizationExclusiveSelectGroupEntry> createState() =>
      _CustomizationExclusiveSelectGroupEntryState();
}

class _CustomizationExclusiveSelectGroupEntryState
    extends State<CustomizationExclusiveSelectGroupEntry> {
  List customizationRadioChildren = [];

  int selected = -1;
  @override
  Widget build(BuildContext context) {
    customizationRadioChildren = [];

    int radioIdx = 0;
    for (EatProductCustomizationItem ci in widget.eatCustomization.items) {
      int locIdx = radioIdx;
      customizationRadioChildren.add(RadioListTile(
        fillColor: MaterialStateProperty.all(AppColors.primaryColor1),
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ci.name,
              style: TextStyle(color: AppColors.bglDefTextColor),
            ),
            Text(twoDecItemPriceString(ci.price),
                style: TextStyle(color: AppColors.bglDefTextColor)),
          ],
        ),
        value: locIdx,
        groupValue: selected,
        toggleable: true,
        onChanged: (int? newVal) {
          int oldVal = selected;
          if (newVal != null) {
            setState(() {
              selected = newVal;
            });
          } else {
            setState(() {
              selected = -1;
            });
          }
          if (oldVal != -1) {
            widget.updateCustomizationsCB(widget.eatCustomization,
                widget.eatCustomization.items[oldVal], false);
          }
          if (newVal != null) {
            widget.updateCustomizationsCB(widget.eatCustomization, ci, true);
          }
        },
      ));
      radioIdx += 1;
    }

    return ClipRRect(
        borderRadius: BorderRadius.circular(.015.sh),
        child: Container(
            color: Colors.white,
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.all(
                    12.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.eatCustomization.name,
                          style: TextStyle(
                              color: AppColors.primaryColor1,
                              fontSize: 20.h,
                              fontWeight: FontWeight.w500)),
                      Text(
                          widget.eatCustomization.required
                              ? "(Required)"
                              : "(Optional)",
                          style: TextStyle(
                              color: AppColors.primaryColor1, fontSize: 16.h))
                    ],
                  )),
              ...customizationRadioChildren
            ])));
  }
}

class CustomizationInclusiveSelectGroupEntry extends StatefulWidget {
  const CustomizationInclusiveSelectGroupEntry(
      {Key? key,
      required this.eatCustomization,
      required this.updateCustomizationsCB})
      : super(key: key);

  final EatProductCustomization eatCustomization;
  final Function updateCustomizationsCB;

  @override
  State<CustomizationInclusiveSelectGroupEntry> createState() =>
      _CustomizationInclusiveSelectGroupEntryState();
}

class _CustomizationInclusiveSelectGroupEntryState
    extends State<CustomizationInclusiveSelectGroupEntry> {
  List customizationCheckBoxChildren = [];
  List<bool> checkboxSelects = [];

  @override
  Widget build(BuildContext context) {
    customizationCheckBoxChildren = [];
    int checkboxIdx = 0;
    for (EatProductCustomizationItem ci in widget.eatCustomization.items) {
      int checkboxIdxLoc = checkboxIdx;

      if (checkboxSelects.length < widget.eatCustomization.items.length) {
        checkboxSelects.add(false);
      }

      customizationCheckBoxChildren.add(CheckboxListTile(
        fillColor: MaterialStateProperty.all(AppColors.primaryColor1),
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ci.name,
              style: TextStyle(color: AppColors.bglDefTextColor),
            ),
            Text(twoDecItemPriceString(ci.price),
                style: TextStyle(color: AppColors.bglDefTextColor)),
          ],
        ),
        value: checkboxSelects[checkboxIdxLoc],
        selected: checkboxSelects[checkboxIdxLoc],
        onChanged: (bool? newval) {
          setState(() {
            checkboxSelects[checkboxIdxLoc] = newval!;
          });
          widget.updateCustomizationsCB(widget.eatCustomization, ci, newval);
        },
      ));
      checkboxIdx += 1;
    }

    return ClipRRect(
        borderRadius: BorderRadius.circular(.015.sh),
        child: Container(
            color: Colors.white,
            child: Column(children: [
              Padding(
                  padding: EdgeInsets.all(
                    12.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.eatCustomization.name,
                          style: TextStyle(
                              color: AppColors.primaryColor1,
                              fontSize: 20.h,
                              fontWeight: FontWeight.w500)),
                      Text(
                          widget.eatCustomization.required
                              ? "(Required)"
                              : "(Optional)",
                          style: TextStyle(
                              color: AppColors.primaryColor1, fontSize: 16.h))
                    ],
                  )),
              ...customizationCheckBoxChildren
            ])));
  }
}

class RequiredNotSetSnackBar extends StatelessWidget {
  const RequiredNotSetSnackBar(
      {super.key, required this.requiredCustomizationName, required this.show});

  final String requiredCustomizationName;
  final bool show;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        bottom: show ? 28 : -88,
        left: 0,
        right: 0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 58.h,
            width: .94.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(.02.sw),
              color: Colors.lightBlueAccent[700],
            ),
            // height: show ? 88.h : 0,
            // duration: const Duration(milliseconds: 300),
            child: Column(children: [
              Flexible(
                child: Center(
                    child: Text(
                  "Please $requiredCustomizationName",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.h,
                    color: Colors.white,
                  ),
                )),
              )
            ]),
          )
        ]));
  }
}
