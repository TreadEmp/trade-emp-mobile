import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;

import '../../locator.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      // systemNavigationBarColor: Colors.white, //bottom bar color
      // systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    const double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final NavigationService navigationService = locator<NavigationService>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            // leading: new Container(),
            title: Text(
              'Categories',
              style: themeData.textTheme.displaySmall,
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.search_outlined,
                  color: COLOR_GREY,
                  size: 30.0,
                ),
                tooltip: 'Show Categories',
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              indicatorColor: COLOR_BLUE,
              indicatorPadding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              labelColor: COLOR_BLUE,
              unselectedLabelColor: COLOR_BLACK,
              // indicator: BoxDecoration(color: Colors.blueAccent),
              tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Categories',
                      // style: themeData.textTheme.bodyText1,
                    ),
                    addVerticalSpace(20),
                    addHorizontalSpace(24),
                    const SizedBox(
                      width: 24.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Interests',
                      // style: themeData.textTheme.bodyText1,
                    ),
                    addVerticalSpace(10),
                  ],
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification? overscroll) {
                      overscroll!.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/construction.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Machinary",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Machinary hiring, chenrjfnd adcjanenajdn ",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/circuit.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/configuration.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/cctv.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/demolishing.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/repair-tools.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/construction.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Machinary",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Machinary hiring, chenrjfnd adcjanenajdn ",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/circuit.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/configuration.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/cctv.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/demolishing.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              navigationService.navigateTo(routes
                                                  .pageNotImplementedYetRoute);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/svg/repair-tools.svg',
                                              width: 40,
                                              height: 40,
                                            )),
                                      ],
                                    ),
                                    addHorizontalSpace(20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                navigationService.navigateTo(routes
                                                    .pageNotImplementedYetRoute);
                                              },
                                              child: Text(
                                                "Terms of service",
                                                style: themeData
                                                    .textTheme.bodyMedium,
                                              ),
                                            ),
                                          ],
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text('Interests'),
              )
            ],
          )),
    );
  }
}
