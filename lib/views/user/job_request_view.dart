import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/viewmodels/jobRequests/job_request_view_model.dart';
import 'package:trade_emp_mobile/views/partial_views/user_job_requests.dart';
import '../../locator.dart';

class JobRequestView extends StatefulWidget {
  const JobRequestView({super.key});

  @override
  State<JobRequestView> createState() => _JobRequestViewState();
}

class _JobRequestViewState extends State<JobRequestView>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;
  final ScrollController _activeJobScrollController = ScrollController();
  final ScrollController _inactiveJobScrollController = ScrollController();
  int _activeJobPage = 1;
  int _inactiveJobPage = 1;

  @override
  void initState() {
    super.initState();

    _tabcontroller = TabController(length: 2, vsync: this, initialIndex: 0);
    var jobRequests = Provider.of<JobRequestViewModel>(context, listen: false);

    _tabcontroller.addListener(() {
      jobRequests.setJobRequestSelectedTabIndex(_tabcontroller.index);
    });

    if (jobRequests.jobRequestSelectedTabIndex == 1) {
      jobRequests.resetActiveJobRequestStreams();
      jobRequests.fetchAllActiveJobRequests(_activeJobPage);

      _activeJobScrollController.addListener(() {
        if (_activeJobScrollController.position.pixels ==
            _activeJobScrollController.position.maxScrollExtent) {
          jobRequests.setActiveJobRequestLoadingState(
              ActiveJobRequestLoadMoreStatus.LOADING);
          jobRequests.fetchAllActiveJobRequests(++_activeJobPage);
        }
      });
    } else {
      jobRequests.resetInactiveJobRequestStreams();
      jobRequests.fetchAllInactiveJobRequests(_inactiveJobPage);

      _inactiveJobScrollController.addListener(() {
        if (_inactiveJobScrollController.position.pixels ==
            _inactiveJobScrollController.position.maxScrollExtent) {
          jobRequests.setInactiveJobRequestLoadingState(
              InactiveJobRequestLoadMoreStatus.LOADING);
          jobRequests.fetchAllInactiveJobRequests(++_inactiveJobPage);
        }
      });
    }
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    // final double padding = 10;
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final NavigationService navigationService = locator<NavigationService>();
    var jobRequests = Provider.of<JobRequestViewModel>(context, listen: true);
    return Theme(
      data: ThemeData(primaryColor: COLOR_BLUE),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: COLOR_WHITE,
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.white,
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
                                  "Your Job Requests",
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
            bottom: TabBar(
              controller: _tabcontroller,
              labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              indicatorColor: COLOR_BLUE,
              indicatorPadding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              labelColor: COLOR_BLUE,
              unselectedLabelColor: COLOR_BLACK,
              physics: const AlwaysScrollableScrollPhysics(),
              tabs: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Active Jobs',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Inactive Jobs',
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabcontroller,
            children: <Widget>[
              Center(
                child: Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification? overscroll) {
                      overscroll!.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      controller: _activeJobScrollController,
                      child: SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              //////////////////////////////
                              jobRequests.getActiveJobRequestDataFetcher.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      primary: false,
                                      itemCount: jobRequests
                                          .getActiveJobRequestDataFetcher
                                          .length,
                                      itemBuilder: (context, index) {
                                        return UserJobRequests(
                                            jobRequest: jobRequests
                                                    .getActiveJobRequestDataFetcher[
                                                index]);
                                      },
                                    )
                                  : const Center(
                                      child: Text(
                                        'No avtive job requests',
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
                  child: NotificationListener<OverscrollIndicatorNotification>(
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
                              jobRequests.getInactiveJobRequestDataFetcher.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      primary: false,
                                      itemCount: jobRequests
                                          .getInactiveJobRequestDataFetcher
                                          .length,
                                      itemBuilder: (context, index) {
                                        return UserJobRequests(
                                            jobRequest: jobRequests
                                                    .getInactiveJobRequestDataFetcher[
                                                index]);
                                      },
                                    )
                                  : const Center(
                                      child: Text(
                                        'No inavtive job requests',
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
            label: const Text("CREATE NEW JOB REQUEST"),
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
  }
}

// class JobRequestView extends StatelessWidget {
//   const JobRequestView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {

//     return new Consumer<JobRequestViewModel>(builder: (
//       final BuildContext context,
//       final JobRequestViewModel jobRequests,
//       final Widget? child,
//     ) {
//       if (jobRequests.getJobRequests.length == 0) {
//         jobRequests.getAllJobRequests();
//       }
//       List<Items> activeJobs = [];
//       List<Items> inactiveJobs = [];
//       if (jobRequests.getJobRequests.length > 0) {
//         jobRequests.getJobRequests.forEach((jobRequest) {
//           if (jobRequest.isActive!) {
//             activeJobs.add(jobRequest);
//           } else {
//             inactiveJobs.add(jobRequest);
//           }
//         });
//       }
//       return ;
//     });
//   }
// }
