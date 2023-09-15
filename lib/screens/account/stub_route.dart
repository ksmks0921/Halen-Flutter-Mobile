import 'package:flutter/material.dart';
import 'components/account_page_appbar.dart';

class AccountStubRoute extends StatefulWidget {
  const AccountStubRoute({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<AccountStubRoute> createState() => _AccountStubRouteState();
}

class _AccountStubRouteState extends State<AccountStubRoute> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body:
                Column(children: [AccountAppBar(title: widget.title ?? " ")])));
  }
}
