import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    const double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final NavigationService navigationService = locator<NavigationService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: themeData.textTheme.displaySmall,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              navigationService.navigateTo(
                                  routes.pageNotImplementedYetRoute);
                            },
                            child: const Icon(
                              Icons.notifications_outlined,
                              color: COLOR_GREY,
                            )),
                      ],
                    ),
                    addHorizontalSpace(20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(routes.pageNotImplementedYetRoute);
                          },
                          child: Text(
                            "Notifications",
                            style: themeData.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: padding,
                color: COLOR_GREY,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(routes.pageNotImplementedYetRoute);
                          },
                          child: const Icon(
                            Icons.notifications_active_outlined,
                            color: COLOR_GREY,
                          ),
                        )
                      ],
                    ),
                    addHorizontalSpace(20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(routes.pageNotImplementedYetRoute);
                          },
                          child: Text(
                            "Notification sounds",
                            style: themeData.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: padding,
                color: COLOR_GREY,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(routes.pageNotImplementedYetRoute);
                          },
                          child: const Icon(
                            Icons.copyright_outlined,
                            color: COLOR_GREY,
                          ),
                        ),
                      ],
                    ),
                    addHorizontalSpace(20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(routes.pageNotImplementedYetRoute);
                          },
                          child: Text(
                            "Terms of service",
                            style: themeData.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: padding,
                color: COLOR_GREY,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(routes.pageNotImplementedYetRoute);
                          },
                          child: const Icon(
                            Icons.privacy_tip_outlined,
                            color: COLOR_GREY,
                          ),
                        ),
                      ],
                    ),
                    addHorizontalSpace(20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            navigationService.navigateTo(routes.pageNotImplementedYetRoute);
                          },
                          child: Text(
                            "Privacy policy",
                            style: themeData.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: padding,
                color: COLOR_GREY,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Version 2.5.3.4",
                          style: themeData.textTheme.bodyMedium,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
