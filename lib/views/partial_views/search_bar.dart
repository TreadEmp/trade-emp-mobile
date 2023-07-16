import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';

class SearchBar extends StatelessWidget {
  final Widget icon;
  final EdgeInsets? padding;
  final double width, height;
  final Text text;

  const SearchBar(
      {Key? key,
      required this.icon,
      this.padding,
      required this.width,
      required this.height,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: COLOR_WHITE,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2)),
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, addHorizontalSpace(10), text],
        ),
      ),
    );
  }
}
