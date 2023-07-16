import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                              'Notifications',
                              style: themeData.textTheme.displaySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Column()
              ],
            ),
          ),
        ),
        body: Center(
          child: Text(
            'No notifications yet...',
            style: themeData.textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
