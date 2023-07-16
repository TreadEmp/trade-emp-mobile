import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/user/user_viewmodel.dart';
import 'package:trade_emp_mobile/views/partial_views/full_profile_job_request.dart';
import 'package:trade_emp_mobile/views/partial_views/full_profile_review.dart';
import 'package:trade_emp_mobile/locator.dart';

class EmployeeFullProfileScreen extends StatelessWidget {
  final String? employeeId;
  const EmployeeFullProfileScreen({Key? key, required this.employeeId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    const double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final NavigationService navigationService = locator<NavigationService>();
    return Consumer2<UserViewModel, AuthViewModel>(builder: (
      final BuildContext context,
      final UserViewModel user,
      final AuthViewModel auth,
      final Widget? child,
    ) {
      // print(user.getEmployeeFullProfile?.email?.trim().length);
      // if (user.getEmployeeFullProfile?.email == null ||
      //     user.getEmployeeFullProfile?.email?.trim().length == 0) {

      // }
      user.userFullProfile("Employee", employeeId);
      return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              // leading: new Container(),
              actions: <Widget>[
                Container(
                  // color: Colors.red,
                  width: size.width,
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: COLOR_BLACK,
                                      size: 25.0,
                                    ),
                                    tooltip: 'Show Categories',
                                    onPressed: () {
                                      navigationService.goBack();
                                    },
                                  ),
                                ),
                                addHorizontalSpace(10),
                                Center(
                                  child: Text(
                                    "${user.getEmployeeFullProfile!.firstName!} ${user.getEmployeeFullProfile!.lastName!}",
                                    style: themeData.textTheme.displaySmall,
                                    // style: TextStyle(
                                    //     color: COLOR_BLACK,
                                    //     fontSize: 14,
                                    //     fontFamily: 'Montserrat',
                                    //     fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "CONTACT",
                                style: TextStyle(
                                    color: COLOR_BLUE,
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              bottom: const TabBar(
                labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                indicatorColor: COLOR_BLUE,
                indicatorPadding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                labelColor: COLOR_BLUE,
                unselectedLabelColor: COLOR_BLACK,
                physics: AlwaysScrollableScrollPhysics(),
                tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Job Requests',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Reviews',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: CircleAvatar(
                                            radius: 21,
                                            backgroundImage: NetworkImage(
                                              user.getEmployeeFullProfile!
                                                  .profileImage!,
                                              // useDiskCache: true,
                                              // cacheRule: CacheRule(
                                              //   maxAge: const Duration(days: 7),
                                              // ),
                                            ),
                                          ),
                                        ),
                                        addHorizontalSpace(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                "${user.getEmployeeFullProfile!.firstName!} ${user.getEmployeeFullProfile!.lastName!}",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                      Column(
                                                        children: [
                                                          Text(
                                                            user.getEmployeeFullProfile!
                                                                .overallRating!
                                                                .toStringAsFixed(
                                                                    1),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .amber,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          )
                                                        ],
                                                      ),
                                                      addHorizontalSpace(3),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "(${user.getEmployeeFullProfile!.totalNoOfReviews})",
                                                            style: const TextStyle(
                                                                color:
                                                                    COLOR_GREY,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "User information",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Icon(
                                            Icons.place_rounded,
                                            color: Colors.grey,
                                            size: 28,
                                          ),
                                        ),
                                        addHorizontalSpace(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                "From",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                user.getEmployeeFullProfile!
                                                    .address!.country!,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Icon(
                                            Icons.verified,
                                            color: Colors.grey,
                                            size: 28,
                                          ),
                                        ),
                                        addHorizontalSpace(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                // "${auth.getUserData.customRole!} level",
                                                "${auth.getUserData.userId!} level",
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                "Level 1",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Icon(
                                            Icons.public_rounded,
                                            color: Colors.grey,
                                            size: 28,
                                          ),
                                        ),
                                        addHorizontalSpace(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                "Member since",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                DateFormat('MMM y')
                                                    .format(DateTime.parse(user
                                                        .getEmployeeFullProfile!
                                                        .createdAt!))
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Icon(
                                            Icons.public_rounded,
                                            color: Colors.grey,
                                            size: 28,
                                          ),
                                        ),
                                        addHorizontalSpace(10),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                "Languages",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                "Sinhala, English",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Icon(
                                            Icons.schedule_rounded,
                                            color: Colors.grey,
                                            size: 28,
                                          ),
                                        ),
                                        addHorizontalSpace(10),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                "Average response time",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: Text(
                                                "1 hour",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Expanded(
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification? overscroll) {
                        overscroll!.disallowIndicator();
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                //////////////////////////////
                                user.getEmployeeFullProfile!.jobRequests != null
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        primary: false,
                                        itemCount: user.getEmployeeFullProfile!
                                            .jobRequests!.length,
                                        itemBuilder: (context, index) {
                                          return FullProfileJobRequest(
                                              jobRequest: user
                                                  .getEmployeeFullProfile!
                                                  .jobRequests![index]);
                                        },
                                      )
                                    : Container(),
                                //////////////////////////////
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Expanded(
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification? overscroll) {
                        overscroll!.disallowIndicator();
                        return true;
                      },
                      child: SingleChildScrollView(
                        primary: false,
                        // controller: ScrollController,
                        child: SizedBox(
                          width: size.width,
                          // height: size.height,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Overall Rating",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              const Column(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 14,
                                                  )
                                                ],
                                              ),
                                              addHorizontalSpace(3),
                                              Column(
                                                children: [
                                                  Text(
                                                    user.getEmployeeFullProfile!
                                                        .overallRating!
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 8.0, 16.0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Communication",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              const Column(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 14,
                                                  )
                                                ],
                                              ),
                                              addHorizontalSpace(3),
                                              Column(
                                                children: [
                                                  Text(
                                                    user.getEmployeeFullProfile!
                                                        .communication!
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 8.0, 16.0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Service as described",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              const Column(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 14,
                                                  )
                                                ],
                                              ),
                                              addHorizontalSpace(3),
                                              Column(
                                                children: [
                                                  Text(
                                                    user.getEmployeeFullProfile!
                                                        .serviceAsDescribed!
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 8.0, 16.0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Would recommend",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              const Column(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 14,
                                                  )
                                                ],
                                              ),
                                              addHorizontalSpace(3),
                                              Column(
                                                children: [
                                                  Text(
                                                    user.getEmployeeFullProfile!
                                                        .recommend!
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 14,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: padding,
                                  thickness: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${user.getEmployeeFullProfile!.totalNoOfReviews} Reviews",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: const Text(
                                              "See all",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                //////////////////////////////
                                user.getEmployeeFullProfile!.reviews != null
                                    ? ListView.builder(
                                        // controller: ScrollController,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        primary: false,
                                        itemCount: user.getEmployeeFullProfile!
                                            .reviews!.length,
                                        itemBuilder: (context, index) {
                                          return FullProfileReview(
                                              review: user
                                                  .getEmployeeFullProfile!
                                                  .reviews![index]);
                                        },
                                      )
                                    : Container(),
                                //////////////////////////////
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
