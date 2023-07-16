import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_base_model.dart';
import 'package:trade_emp_mobile/views/auth/signin_view.dart';
import 'package:trade_emp_mobile/views/error/no_internet_access.dart';
import 'package:trade_emp_mobile/views/home_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthViewModel>(context, listen: false).checkAuthStatus();
      Provider.of<AuthViewModel>(context, listen: false)
          .checkInternetConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          body: !auth.connected
              ? const NoConnectionFoundScreen()
              : auth.authStatus == AuthStatus.loggedIn
                  ? const HomeScreen()
                  : const SignInView()),
    );
  }
}