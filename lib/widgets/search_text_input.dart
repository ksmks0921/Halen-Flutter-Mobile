import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInputLink extends StatelessWidget {
  const SearchInputLink({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SizedBox(
        height: 40.h,
        child: TextField(
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white, // Set the background color to white
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(width: 1, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchInputBar extends StatefulWidget {
  const SearchInputBar(
      {super.key, required this.textController, required this.searchCB});

  final TextEditingController textController;
  final Function searchCB;

  @override
  State<SearchInputBar> createState() => _SearchInputBarState();
}

class _SearchInputBarState extends State<SearchInputBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        height: 40.h,
        child: TextField(
          onChanged: (text) {
            widget.searchCB(text);
            // performStagSearch(text);
          },
          style: const TextStyle(
            color: Colors.black, // Set the text color here
          ),
          controller: widget.textController,
          onSubmitted: (value) {
            widget.searchCB(value);
          },
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white, // Set the background color to white
            contentPadding: EdgeInsets.zero,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(width: 1, color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(
                color: Colors.transparent, // Set the color to transparent
                width: 0, // Set the width to 0
              ),
            ),
          ),
        ),
      ),
    );
  }
}
