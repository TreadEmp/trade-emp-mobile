import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/views/category/category.dart';
import 'package:trade_emp_mobile/views/inbox/inbox.dart';
import 'package:trade_emp_mobile/views/landing/landing_page.dart';
import 'package:trade_emp_mobile/views/notification/notification.dart';
import 'package:trade_emp_mobile/views/user/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (
      final BuildContext contextAuth,
      final AuthViewModel auth,
      final Widget? child,
    ) {
      return Scaffold(
        body: Center(
          child: getBody(context, auth),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 24.0,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.email_outlined,
                  size: 24.0,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 24.0,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_outlined,
                  size: 24.0,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 24.0,
                ),
                label: ''),
          ],
          currentIndex: auth.selectedIndex,
          selectedItemColor: COLOR_BLUE,
          onTap: (int value) {
            auth.setSelectedIndex(value);
          },
        ),
      );
    });
  }

  Widget getBody(BuildContext context, AuthViewModel auth) {
    Widget body = Container();
    switch (auth.selectedIndex) {
      case 0:
        {
          // _title = 'Home';
          body = const LandingPageScreen();
          break;
        }
      case 1:
        {
          body = const InboxScreen();
          // _body = EmptyInboxScreen();
          // _body = UserFullProfileScreen();
          break;
        }
      case 2:
        {
          body = const CategoryScreen();
          break;
        }
      case 3:
        {
          body = const NotificationScreen();
          // _body = EmptyNotificationPage();
          break;
        }
      case 4:
        {
          body = const UserScreen();
          break;
        }
    }
    return body;
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//   Widget _body;
//   String _title;

//   void initState() {
//     super.initState();
//     changeView(0);
//   }

//   void _onTapBottomNavigationItem(index) {
//     changeView(index);
//   }

//   @override
//   Widget build(BuildContext context) {}
// }
