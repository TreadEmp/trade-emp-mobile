import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';

class EmptyInboxScreen extends StatelessWidget {
  const EmptyInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final ThemeData themeData = Theme.of(context);
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
              // Row(
              //   // crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       'Whoops!',
              //       style: TextStyle(
              //         color: COLOR_BLUE_SHADE,
              //         fontSize: 32,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ],
              // ),
              // addVerticalSpace(10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No messages yet ...',
                    style: TextStyle(
                      color: COLOR_BLUE_SHADE,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              addVerticalSpace(10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Start a conversation with employer,',
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
                    'and get the job done',
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
