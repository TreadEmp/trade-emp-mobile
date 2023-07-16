import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';

class RouteNotFound extends StatefulWidget {
  const RouteNotFound({super.key});

  @override
  State<RouteNotFound> createState() => _RouteNotFoundState();
}

class _RouteNotFoundState extends State<RouteNotFound> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          // height: 67,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          color: Colors.transparent,
                          alignment: Alignment.center, // This is needed
                          child: const Icon(Icons.arrow_back_outlined,
                              color: COLOR_BLACK),
                        ),
                      ],
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         IconButton(
                //           icon: Icon(
                //             Icons.dashboard_sharp,
                //             color: COLOR_GREY,
                //           ),
                //           tooltip: 'Show Categories',
                //           onPressed: () {},
                //         ),
                //       ],
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
        body: Center(
          child: Text(
            'Page not implemented yet!',
            style: themeData.textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
