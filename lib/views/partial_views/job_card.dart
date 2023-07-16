import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/custom_functions.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';

import 'boder_box.dart';

class JobCard extends StatelessWidget {
  final dynamic itemData;

  const JobCard({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(itemData['image'])),
            const Positioned(
                top: 15,
                right: 15,
                child: BorderBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.favorite_border,
                    color: COLOR_BLACK,
                  ),
                )),
          ]),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                // ignore: unnecessary_string_interpolations
                "${formatCurrency(itemData['amount'])}",
                style: themeData.textTheme.displayLarge,
              ),
              addHorizontalSpace(10),
              Text(
                itemData['address'],
                style: themeData.textTheme.bodyMedium,
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
            style: themeData.textTheme.headlineSmall,
          )
        ],
      ),
    );
  }
}
