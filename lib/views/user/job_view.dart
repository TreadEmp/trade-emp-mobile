import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/models/job/job.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/viewmodels/jobs/job_viewmodel.dart';
import 'package:trade_emp_mobile/views/partial_views/user_jobs.dart';
import '../../locator.dart';

class JobView extends StatelessWidget {
  const JobView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    // final double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final NavigationService navigationService = locator<NavigationService>();
    return Consumer<JobViewModel>(builder: (
      final BuildContext context,
      final JobViewModel jobs,
      final Widget? child,
    ) {
      if (jobs.getJobs.isEmpty) {
        jobs.getAllJobs();
      }
      List<Items> pendingJobs = [];
      List<Items> hiredJobs = [];
      List<Items> completedJobs = [];
      if (jobs.getJobs.isNotEmpty) {
        for (var job in jobs.getJobs) {
          if (job.status == "pending") {
            pendingJobs.add(job);
          } else if (job.status == "hired") {
            hiredJobs.add(job);
          } else {
            completedJobs.add(job);
          }
        }
      }
      return Theme(
        data: ThemeData(primaryColor: COLOR_BLUE),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: COLOR_WHITE,
              automaticallyImplyLeading: false,
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
                                    "Your Jobs",
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
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Center(
                      //         child: Text(
                      //           "CONTACT",
                      //           style: TextStyle(
                      //               color: COLOR_BLUE,
                      //               fontSize: 14,
                      //               fontFamily: 'Montserrat',
                      //               fontWeight: FontWeight.w700),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                        'Pending Jobs',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hired Jobs',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Completed Jobs',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification? overscroll) {
                      overscroll!.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              //////////////////////////////
                              pendingJobs.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      primary: false,
                                      itemCount: pendingJobs.length,
                                      itemBuilder: (context, index) {
                                        return UserJobs(
                                            job: pendingJobs[index]);
                                      },
                                    )
                                  : const Center(
                                      child: Text(
                                        'No pending jobs',
                                        style: TextStyle(
                                          color: COLOR_BLACK,
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                              //////////////////////////////
                            ],
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
                        child: SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                //////////////////////////////
                                hiredJobs.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        primary: false,
                                        itemCount: hiredJobs.length,
                                        itemBuilder: (context, index) {
                                          return UserJobs(
                                              job: hiredJobs[index]);
                                        },
                                      )
                                    : const Center(
                                        child: Text(
                                          'No hired jobs',
                                          style: TextStyle(
                                            color: COLOR_BLACK,
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
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
                        child: SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                //////////////////////////////
                                completedJobs.isNotEmpty
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        primary: false,
                                        itemCount: completedJobs.length,
                                        itemBuilder: (context, index) {
                                          return UserJobs(
                                              job: completedJobs[index]);
                                        },
                                      )
                                    : const Center(
                                        child: Text(
                                          'No completed jobs',
                                          style: TextStyle(
                                            color: COLOR_BLACK,
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
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
            ),
            floatingActionButton: FloatingActionButton.extended(
              label: const Text("CREATE NEW JOB"),
              // label: _user.loading
              //     ? CircularProgressIndicator(
              //         strokeWidth: 2.0,
              //         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              //       )
              //     : Text("CREATE JOB"),
              elevation: 3,
              focusElevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              onPressed: () {
                navigationService.navigateTo(createJobPageRoute);
              },
            ),
          ),
        ),
      );
    });
  }
}
