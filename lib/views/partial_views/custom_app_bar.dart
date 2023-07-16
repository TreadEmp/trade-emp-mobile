import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  @override
  final Widget child;
  final double height;
  final Color color;
  final double elevation;

  const CustomAppBar(
      {super.key,
      required this.child,
      this.height = kToolbarHeight,
      this.color = Colors.white,
      this.elevation = 4});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: color,
        type: MaterialType.canvas,
        borderOnForeground: false,
        elevation: 0,
        child: SizedBox(height: preferredSize.height, child: child));
  }
}
