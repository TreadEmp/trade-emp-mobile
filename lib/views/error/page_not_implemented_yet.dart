import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';

class PageNotImplementedYet extends StatefulWidget {
  const PageNotImplementedYet({super.key});

  @override
  State<PageNotImplementedYet> createState() => _PageNotImplementedYetState();
}

class _PageNotImplementedYetState extends State<PageNotImplementedYet> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            // title: Text(
            //   'Settings',
            //   style: themeData.textTheme.headline3,
            // ),
            ),
        body: Center(
          child: SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.construction_outlined,
                    size: 80,
                    color: Colors.amber[600],
                  ),
                  addVerticalSpace(20),
                  Text(
                    'This page is under construction.',
                    style: themeData.textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
