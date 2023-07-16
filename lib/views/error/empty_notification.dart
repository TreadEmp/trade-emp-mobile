import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';

class EmptyNotificationPage extends StatelessWidget {
  const EmptyNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    // final double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.width * 0.5,
                width: size.width * 0.5,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset("assets/images/no-internet2.png"),
                ),
              ),
              addVerticalSpace(20),
              const Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Whoops!',
                    style: TextStyle(
                      color: COLOR_BLUE_SHADE,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              addVerticalSpace(10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'There seems to be a problem with',
                    style: TextStyle(
                      color: Color.fromRGBO(22, 131, 227, 0.40),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'your network connection',
                    style: TextStyle(
                      color: Color.fromRGBO(22, 131, 227, 0.40),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
