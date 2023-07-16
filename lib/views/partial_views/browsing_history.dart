import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/custom_functions.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';

class BrowsingHistory extends StatelessWidget {
  final dynamic itemData;

  const BrowsingHistory({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: 220,
      width: 150,
      child: Card(
        elevation: 1.5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: <Widget>[
                  Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      width: 142,
                      height: 120,
                      child: Image.asset(itemData['image'], fit: BoxFit.cover)),
                ]),
                SizedBox(
                  width: 142,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Column(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 11,
                                        )
                                      ],
                                    ),
                                    addHorizontalSpace(3),
                                    const Column(
                                      children: [
                                        Text(
                                          "4.9",
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 11,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                    addHorizontalSpace(3),
                                    const Column(
                                      children: [
                                        Text(
                                          "(304)",
                                          style: TextStyle(
                                              color: COLOR_GREY,
                                              fontSize: 11,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        addVerticalSpace(5),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 1),
                                  child: Text(
                                    "PSD, Lgo and UI/UX",
                                    style: themeData.textTheme.titleMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 1),
                                  child: Text(
                                    "This is very big",
                                    style: themeData.textTheme.titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    "From ${formatCurrency(150)}",
                                    style: const TextStyle(
                                        color: COLOR_BLUE,
                                        fontSize: 11,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
