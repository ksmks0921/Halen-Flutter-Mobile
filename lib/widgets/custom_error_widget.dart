import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({Key? key, required this.errorDetails}) : super(key: key);

  final FlutterErrorDetails errorDetails;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          color: Colors.tealAccent,
          child: Center(
              child: Text(errorDetails.toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 12))))
    ]);
  }
}
