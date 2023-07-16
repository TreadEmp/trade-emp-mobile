import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';

class ImageCircle extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? width, height;
  // final Image image;

  const ImageCircle(
      {Key? key, this.padding, this.width, this.height, required this.child})
      : super(key: key);
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        border: Border.all(color: COLOR_GREY.withAlpha(10), width: 1),
        shape: BoxShape.circle,
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}
