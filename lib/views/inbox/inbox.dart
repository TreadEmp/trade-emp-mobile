import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      // systemNavigationBarColor: Colors.white, //bottom bar color
      // systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            height: 50,
                            color: Colors.transparent,
                            alignment: Alignment.center, // This is needed
                            child: Text(
                              'Inbox',
                              style: themeData.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.list_outlined,
                            color: COLOR_GREY,
                            size: 30.0,
                          ),
                          tooltip: 'Show Categories',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Center(
          child: Text(
            'No messages yet...',
            style: themeData.textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
