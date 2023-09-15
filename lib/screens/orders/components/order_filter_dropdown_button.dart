import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderFilterDropDown extends StatefulWidget {
  const OrderFilterDropDown(
      {Key? key,
      required this.label,
      required this.items,
      required this.value,
      required this.selectCB})
      : super(key: key);

  final String label;
  final List<String> items;
  final String value;
  final Function selectCB;
  @override
  State<OrderFilterDropDown> createState() => _OrderFilterDropDownState();
}

class _OrderFilterDropDownState extends State<OrderFilterDropDown> {
  String selectedValue = "All";
  @override
  Widget build(BuildContext context) {
    selectedValue = widget.value;
    return Container(
      width: .45.sw,
      // height: 32.h + 14.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: selectedValue,
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
          widget.selectCB(newValue);
        },
        items: widget.items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ))
            .toList(),

        icon: const Icon(Icons.arrow_forward_ios),
        iconSize: 28.h,
        // underline: SizedBox(),
      ),
    );
  }
}
