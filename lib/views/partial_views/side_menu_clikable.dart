import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;

class SideMenuClikable extends StatelessWidget {
  final double padding;
  final Widget iconLeft;
  final Widget? iconRight;
  final Text text;
  final String? routeName;

  const SideMenuClikable(
      {Key? key,
      required this.padding,
      required this.iconLeft,
      this.iconRight,
      required this.text,
      this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService navigationService = locator<NavigationService>();
    final auth = Provider.of<AuthViewModel>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: GestureDetector(
        onTap: () {
          if (routeName != null) {
            if (routeName == routes.logoutRoute.toString()) {
              auth.signOut(context);
            } else {
              navigationService.navigateTo(routeName);
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    iconLeft,
                    addHorizontalSpace(padding),
                    text,
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    iconRight!,
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
