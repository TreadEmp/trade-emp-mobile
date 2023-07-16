import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/custom_functions.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/user/user_viewmodel.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';
import 'package:trade_emp_mobile/views/partial_views/side_menu_clikable.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/enums.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthViewModel, UserViewModel>(builder: (
      final BuildContext context,
      final AuthViewModel auth,
      final UserViewModel user,
      final Widget? child,
    ) {
      bool isSwitched = false;
      final NavigationService navigationService = locator<NavigationService>();
      final ThemeData themeData = Theme.of(context);
      final Size size = MediaQuery.of(context).size;
      const double padding = 20;
      const sidePadding = EdgeInsets.symmetric(horizontal: padding);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor:
            user.getUserType ? COLOR_GREEN_BLACK : COLOR_GREEN, //top bar color
        statusBarIconBrightness: Brightness.light, //top bar icons
        // systemNavigationBarColor: Colors.white, //bottom bar color
        // systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
      ));
      if (!user.hasUser) {
        user.getCurrentUser();
      }
      // if (user.getUserType) {
      //   user.getCurrentUserType();
      // }
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            color: user.getUserType ? COLOR_GREEN_BLACK : COLOR_GREEN,
            height: 194,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Row(
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
                                    '',
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
                                  Icons.settings_outlined,
                                  color: COLOR_WHITE,
                                  size: 25.0,
                                ),
                                tooltip: 'Show Categories',
                                onPressed: () {
                                  navigationService
                                      .navigateTo(routes.settingsRoute);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Stack(clipBehavior: Clip.none, children: <Widget>[
                        Container(
                          height: 140,
                          width: size.width * 0.9,
                          color: user.getUserType
                              ? COLOR_GREEN_BLACK
                              : COLOR_GREEN,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // addVerticalSpace(padding * 2),
                              Stack(children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: sidePadding,
                                        child: user.getSingleUser
                                                    ?.profileImage! !=
                                                null
                                            ? CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                  user.getSingleUser!
                                                      .profileImage!.url!,
                                                ),
                                                // backgroundImage: AdvancedNetworkImage(
                                                //   user
                                                //       .getSingleUser.profileImage.url,
                                                //   useDiskCache: true,
                                                //   cacheRule: CacheRule(
                                                //     maxAge: const Duration(days: 7),
                                                //   ),
                                                // ),
                                              )
                                            : const CircleAvatar(
                                                radius: 30,
                                                backgroundImage: AssetImage(
                                                  "assets/images/default_user.png",
                                                ),
                                              ),
                                      ),
                                      Padding(
                                        padding: sidePadding,
                                        child: Text(
                                            "${user.getSingleUser?.firstName!} ${user.getSingleUser?.lastName!}",
                                            style: const TextStyle(
                                                color: COLOR_WHITE,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  width: 60,
                                  margin: const EdgeInsets.fromLTRB(
                                    25,
                                    15,
                                    0,
                                    0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withAlpha(0),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  alignment: FractionalOffset.bottomRight,
                                  child: const Icon(
                                    Icons.stop_circle_rounded,
                                    color: Color.fromARGB(255, 27, 224, 34),
                                    size: 20,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          child: Container(
                            height: 25,
                            width: size.width * 5,
                            color: COLOR_WHITE,
                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          ),
                        ),
                        Positioned(
                          bottom: -30,
                          left: 15,
                          child: Card(
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    width: 3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            elevation: 3,
                            color: COLOR_WHITE,
                            child: SizedBox(
                              height: 50,
                              width: size.width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Seller mode",
                                      style: TextStyle(
                                          color: COLOR_BLACK,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5),
                                    ),
                                    Switch(
                                      value: user.getUserType,
                                      onChanged: (value) {
                                        user.setUserType(value);
                                      },
                                      activeTrackColor: COLOR_BLUE_SHADE,
                                      activeColor: COLOR_BLUE,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification? overscroll) {
                    overscroll!.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        addVerticalSpace(30),
                        Padding(
                          padding: sidePadding,
                          child: Row(children: [
                            Text(
                              "My Profile",
                              style: themeData.textTheme.displaySmall,
                            ),
                          ]),
                        ),
                        SideMenuClikable(
                          text: Text(
                            "Saved Jobs",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.headset_rounded,
                            color: COLOR_GREY,
                          ),
                          iconRight: const Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                        ),
                        SideMenuClikable(
                          text: Text(
                            "Edit profile",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.edit_outlined,
                            color: COLOR_GREY,
                          ),
                          iconRight: const Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                          routeName: user.getUserType
                              ? routes.employeeProfileRoute
                              : routes.employerProfileRoute,
                        ),
                        const Padding(
                          padding: sidePadding,
                          child: Divider(
                            height: padding,
                            color: COLOR_GREY,
                          ),
                        ),
                        Padding(
                          padding: sidePadding,
                          child: Row(children: [
                            Text(
                              "Working",
                              style: themeData.textTheme.displaySmall,
                            ),
                          ]),
                        ),
                        SideMenuClikable(
                          text: Text(
                            user.getUserType
                                ? "Manage Job Requests"
                                : "Manage Jobs",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.file_copy,
                            color: COLOR_GREY,
                          ),
                          iconRight: const Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                          routeName: user.getUserType
                              ? routes.viewJobRequestPageRoute
                              : routes.viewJobPageRoute,
                        ),
                        SideMenuClikable(
                          text: Text(
                            user.getUserType
                                ? "Post a New Job Request"
                                : "Post a New Job",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.watch,
                            color: COLOR_GREY,
                          ),
                          iconRight: const Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                          routeName: user.getUserType
                              ? routes.createJobPageRoute
                              : routes.createJobRequestPageRoute,
                        ),
                        const Padding(
                          padding: sidePadding,
                          child: Divider(
                            height: padding,
                            color: COLOR_GREY,
                          ),
                        ),
                        Padding(
                          padding: sidePadding,
                          child: Row(children: [
                            Text(
                              "Genaral",
                              style: themeData.textTheme.displaySmall,
                            ),
                          ]),
                        ),
                        SideMenuClikable(
                          text: Text(
                            "Online Status",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.online_prediction_outlined,
                            color: COLOR_GREY,
                          ),
                          iconRight: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              // setState(() {
                              //   isSwitched = value;
                              //   print(isSwitched);
                              // });
                            },
                            activeTrackColor: COLOR_BLUE_SHADE,
                            activeColor: COLOR_BLUE,
                          ),
                          padding: 20,
                        ),
                        SideMenuClikable(
                          text: Text(
                            "Payments",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.wallet_travel_outlined,
                            color: COLOR_GREY,
                          ),
                          iconRight: const Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                        ),
                        SideMenuClikable(
                          text: Text(
                            "Invite Friends",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.loupe_rounded,
                            color: COLOR_GREY,
                          ),
                          iconRight: const Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                        ),
                        SideMenuClikable(
                          text: Text(
                            "Support",
                            style: themeData.textTheme.bodyLarge,
                          ),
                          iconLeft: const Icon(
                            Icons.construction_outlined,
                            color: COLOR_GREY,
                          ),
                          iconRight: const Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                          routeName: routes.pageNotImplementedYetRoute,
                        ),
                        const SideMenuClikable(
                          text: Text(
                            "Logout",
                            style: TextStyle(
                                color: COLOR_RED,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.5),
                          ),
                          iconLeft: Icon(
                            Icons.logout,
                            color: COLOR_RED,
                          ),
                          iconRight: Icon(
                            Icons.online_prediction_outlined,
                            color: Colors.transparent,
                          ),
                          padding: 20,
                          routeName: routes.logoutRoute,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
