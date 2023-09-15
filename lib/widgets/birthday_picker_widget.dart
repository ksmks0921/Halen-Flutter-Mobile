import 'package:flutter/material.dart';
import 'package:halen_customer_app/styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthdayPickerWidget extends StatefulWidget {
  const BirthdayPickerWidget({super.key});

  @override
  BirthdayPickerWidgetState createState() => BirthdayPickerWidgetState();
}

class BirthdayPickerWidgetState extends State<BirthdayPickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(primary: AppColors.primaryColor),
            ),
            child: child!,
          );
        });

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: 'mm/dd/yyyy',
          hintStyle: TextStyle(color: Colors.black, fontSize: 17.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_selectedDate.month}/${_selectedDate.day}/${_selectedDate.year}',
              style: TextStyle(
                fontSize: 17.h,
              ),
            ),
            Icon(
              Icons.calendar_today,
              color: AppColors.primaryColor1,
            ),
          ],
        ),
      ),
    );
  }
}
