import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String? routeName, {dynamic arguments}) {
    if (routeName == routes.logoutRoute) {
      return navigatorKey.currentState!
          .pushNamedAndRemoveUntil(routes.initialRoute, (Route route) => false);
    }
    return navigatorKey.currentState!.pushNamed(routeName!, arguments: arguments);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
