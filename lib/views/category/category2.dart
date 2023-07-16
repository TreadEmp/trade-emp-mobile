import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';

class CategoryScreen2 extends StatefulWidget {
  const CategoryScreen2({super.key});

  @override
  State<CategoryScreen2> createState() => _CategoryScreen2State();
}

class _CategoryScreen2State extends State<CategoryScreen2> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    // final Size size = MediaQuery.of(context).size;
    // final double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    // final NavigationService _navigationService = locator<NavigationService>();
    return Scaffold(
        appBar: CustomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                Row(
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
                                  'Categories',
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
                                Icons.search_outlined,
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
              ],
            ),
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(children: [
            addVerticalSpace(20),
            TabBar(
              tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Categories',
                      style: themeData.textTheme.bodyLarge,
                    ),
                    addVerticalSpace(10),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Interests',
                      style: themeData.textTheme.bodyLarge,
                    ),
                    addVerticalSpace(10),
                  ],
                )
              ],
            ),
            const TabBarView(
              children: <Widget>[
                Center(
                  child: Text('data'),
                ),
                Center(
                  child: Text('data'),
                ),
              ],
            ),
          ]),
        ));
  }
}
