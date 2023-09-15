import 'package:flutter/material.dart';
import 'package:halen_customer_app/constants/colors.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  const Accordion({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  // Show or hide the content
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Column(children: [
        // The title
        ListTile(
          tileColor: Colors.transparent, // Set the tile color to transparent
          title: Text(
            widget.title,
            style: TextStyle(
              color: AppColors.color8E8E8E,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          trailing: IconButton(
            icon: Icon(_showContent
                ? Icons.keyboard_arrow_up_outlined
                : Icons.keyboard_arrow_down_outlined),
            onPressed: () {
              setState(() {
                _showContent = !_showContent;
              });
            },
          ),
        ),
        // Show or hide the content based on the state
        _showContent
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Text(widget.content,
                    style:
                        TextStyle(color: AppColors.color8E8E8E, fontSize: 12)),
              )
            : Container()
      ]),
    );
  }
}
