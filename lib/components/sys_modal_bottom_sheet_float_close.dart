import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// call this to show sheet, can be dismissed with Navigator.pop(context)
// Don't forget to add a size and color to your child
showModalBottomSheetFloatClose(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ModalBottomSheetFloatClose(child: child);
    },
  );
}

class ModalBottomSheetFloatClose extends StatelessWidget {
  const ModalBottomSheetFloatClose({Key? key, required this.child})
      : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Wrap(children: [
      Padding(
          padding: EdgeInsets.only(bottom: 16.w),
          child: SizedBox(
              width: 1.sw,
              height: 51.h,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5.w,
                              offset: Offset(1.w, 3.w))
                        ]),
                    child: const Icon(Icons.close),
                  )))),
      child
    ]));
  }
}
