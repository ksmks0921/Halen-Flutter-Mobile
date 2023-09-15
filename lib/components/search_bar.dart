import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({this.hint, Key? key}) : super(key: key);

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6)),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: hint),
              ),
            )
          ],
        ),
      ),
    );
  }
}
