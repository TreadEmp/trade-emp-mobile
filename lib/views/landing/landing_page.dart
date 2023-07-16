import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trade_emp_mobile/constants/enums.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/custom_dialogs.dart';
import 'package:trade_emp_mobile/utils/custom_functions.dart';
import 'package:trade_emp_mobile/utils/sample_data.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/viewmodels/auth/auth_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobCategory/job_category_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobRequests/job_request_view_model.dart';
import 'package:trade_emp_mobile/viewmodels/jobs/job_viewmodel.dart';
import 'package:trade_emp_mobile/views/partial_views/browsing_history.dart';
import 'package:trade_emp_mobile/views/partial_views/custom_app_bar.dart';
import 'package:trade_emp_mobile/views/partial_views/invite_friends.dart';
import 'package:trade_emp_mobile/views/partial_views/popular_service.dart';
import 'package:trade_emp_mobile/views/partial_views/recent_job_requests.dart';
import 'package:trade_emp_mobile/views/partial_views/recent_jobs.dart';

import '../../viewmodels/user/user_viewmodel.dart';

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({super.key});

  @override
  State<LandingPageScreen> createState() => _LandingPageScreenState();
}

class _LandingPageScreenState extends State<LandingPageScreen> {
  ScrollController jobCategiryScrollController = ScrollController();
  ScrollController jobScrollController = ScrollController();
  ScrollController jobRequestScrollController = ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();

    var user = Provider.of<UserViewModel>(context, listen: false);
    var jobCategory = Provider.of<JobCategoryViewModel>(context, listen: false);
    jobCategory.resetStreams();
    jobCategory.fetchAllJobCategories(_page);

    jobCategiryScrollController.addListener(() {
      if (jobCategiryScrollController.position.pixels ==
          jobCategiryScrollController.position.maxScrollExtent) {
        jobCategory.setLoadingState(JobCategoryLoadMoreStatus.LOADING);
        jobCategory.fetchAllJobCategories(++_page);
      }
    });

    if (user.getUserType) {
      var job = Provider.of<JobViewModel>(context, listen: false);
      job.resetStreams();
      job.fetchRecentJobs(_page);

      jobScrollController.addListener(() {
        if (jobScrollController.position.pixels ==
            jobScrollController.position.maxScrollExtent) {
          job.setLoadingState(JobLoadMoreStatus.LOADING);
          job.fetchRecentJobs(++_page);
        }
      });
    } else {
      var jobRequest = Provider.of<JobRequestViewModel>(context, listen: false);
      jobRequest.resetStreams();
      jobRequest.fetchRecentJobRequests(_page);

      jobRequestScrollController.addListener(() {
        if (jobRequestScrollController.position.pixels ==
            jobRequestScrollController.position.maxScrollExtent) {
          jobRequest.setLoadingState(JobRequestLoadMoreStatus.LOADING);
          jobRequest.fetchRecentJobRequests(++_page);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      // systemNavigationBarColor: Colors.white, //bottom bar color
      // systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ));
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    const double padding = 10;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final auth = Provider.of<AuthViewModel>(context, listen: false);
    final user = Provider.of<UserViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 247, 247),
        appBar: CustomAppBar(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          color: Colors.transparent,
                          alignment: Alignment.center, // This is needed
                          child: Image.asset(
                            "assets/images/logo_2.png",
                            fit: BoxFit.cover,
                            width: 130,
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
                            Icons.dashboard_sharp,
                            color: COLOR_GREY,
                          ),
                          tooltip: 'Show Categories',
                          onPressed: () {
                            auth.setSelectedIndex(2);
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification? overscroll) {
                          overscroll!.disallowIndicator();
                          return true;
                        },
                        child: SingleChildScrollView(
                          // primary: false,
                          // reverse: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              addVerticalSpace(10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: SizedBox(
                                    height: 70.0,
                                    width: size.width,
                                    // color: Theme.of(context).primaryColor,
                                    child: Card(
                                        // shape: RoundedRectangleBorder(
                                        //   borderRadius:
                                        //       BorderRadius.circular(8),
                                        //   side: const BorderSide(
                                        //     color: Color.fromARGB(
                                        //         255, 235, 234, 234),
                                        //   ),
                                        //   //set border radius more than 50% of height and width to make circle
                                        // ),
                                        borderOnForeground: false,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            addHorizontalSpace(10),
                                            const Icon(
                                              Icons.search,
                                              color: COLOR_GREY,
                                            ),
                                            SizedBox(
                                              //height: double.infinity, //This is extra
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  90, // Subtract sums of paddings and margins from actual width
                                              child: const TextField(
                                                // controller: controller,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        'What are you looking for?',
                                                    border: InputBorder.none),
                                                // onChanged: onSearchTextChanged,
                                              ),
                                            ),
                                          ],
                                        ))),
                              ),
                              addVerticalSpace(10),
                              Padding(
                                padding: sidePadding,
                                child: Text(
                                  "Popular Services",
                                  style: themeData.textTheme.displaySmall,
                                ),
                              ),
                              addVerticalSpace(10),
                              getPopularService(context),
                              addVerticalSpace(10),
                              Padding(
                                padding: sidePadding,
                                child: Text(
                                  user.getUserType
                                      ? "Recent Jobs & More"
                                      : "Recent Job Requests & More",
                                  style: themeData.textTheme.displaySmall,
                                ),
                              ),
                              addVerticalSpace(10),
                              getRecentJobs(context),
                              addVerticalSpace(10),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    6.0, 6.0, 6.0, 6.0),
                                child: InviteFriends(
                                  height: 120,
                                  width: size.width,
                                  heddingText: Text(
                                    "Invite friends & get up to ${formatCurrency(150)}",
                                    style: themeData.textTheme.displaySmall,
                                  ),
                                  bodyText: Text(
                                    user.getUserType
                                        ? "Introduce your friends to the fastest way to find a work."
                                        : "Introduce your friends to the fastest way to get their work done.",
                                    // "Introduce your friends to the fastest way to get their work done.",
                                    style: themeData.textTheme.titleSmall,
                                  ),
                                  buttonText: "Invite Friends",
                                ),
                              ),
                              addVerticalSpace(10),
                              Padding(
                                padding: sidePadding,
                                child: Text(
                                  "Your Previous Browsing",
                                  style: themeData.textTheme.displaySmall,
                                ),
                              ),
                              addVerticalSpace(10),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: NotificationListener<
                                    OverscrollIndicatorNotification>(
                                  onNotification:
                                      (OverscrollIndicatorNotification?
                                          overscroll) {
                                    overscroll!.disallowIndicator();
                                    return true;
                                  },
                                  child: SingleChildScrollView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: RE_DATA
                                          .map((item) =>
                                              BrowsingHistory(itemData: item))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                              addVerticalSpace(10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget getPopularService(BuildContext context) {
    final jobCategory =
        Provider.of<JobCategoryViewModel>(context, listen: true);
    const double padding = 8;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    if (jobCategory.hasError) {
      showErrorDialog(jobCategory.error.errorMessage, context, jobCategory);
    }
    if (jobCategory.getDataFetcher.isNotEmpty) {
      return Padding(
        padding: sidePadding,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification? overscroll) {
            overscroll!.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            controller: jobCategiryScrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: jobCategory.getDataFetcher
                  .map((item) => PopularService(jobCategory: item))
                  .toList(),
            ),
          ),
        ),
      );
    }
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }

  Widget getRecentJobs(BuildContext context) {
    final jobs = Provider.of<JobViewModel>(context, listen: true);
    final jobRequests = Provider.of<JobRequestViewModel>(context, listen: true);
    var user = Provider.of<UserViewModel>(context, listen: false);
    const double padding = 8;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    if (user.getUserType) {
      if (jobs.hasError) {
        showErrorDialog(jobs.error.errorMessage, context, jobs);
      }
      if (jobs.getDataFetcher.isNotEmpty) {
        return Padding(
          padding: sidePadding,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification? overscroll) {
              overscroll!.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              controller: jobScrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: jobs.getDataFetcher
                    .map((item) => RecentJobs(job: item))
                    .toList(),
              ),
            ),
          ),
        );
      }
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      );
    } else {
      if (jobRequests.hasError) {
        showErrorDialog(jobs.error.errorMessage, context, jobRequests);
      }
      if (jobRequests.getDataFetcher.isNotEmpty) {
        return Padding(
          padding: sidePadding,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification? overscroll) {
              overscroll!.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              controller: jobRequestScrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: jobRequests.getDataFetcher
                    .map((item) => RecentJobRequests(jobRequest: item))
                    .toList(),
              ),
            ),
          ),
        );
      }
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      );
    }
  }
}
