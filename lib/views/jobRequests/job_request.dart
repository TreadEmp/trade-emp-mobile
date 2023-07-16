import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/models/jobRequest/latest_job_request.dart'
    as latest_job_requests;
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/views/partial_views/employee_review.dart';
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;
import 'package:trade_emp_mobile/views/partial_views/expandable_text.dart';
import 'package:trade_emp_mobile/views/partial_views/faq.dart';

class JobRequestScreen extends StatelessWidget {
  final latest_job_requests.Items? jobRequest;
  const JobRequestScreen({Key? key, required this.jobRequest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light));
    final Size size = MediaQuery.of(context).size;
    const double padding = 10;
    ScrollController jobRequestScrollController = ScrollController();
    // final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white, //change your color here
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_outline,
                    ),
                  ),
                ),
              ],
            ),
            body: SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
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
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      viewportFraction: 1.0,
                                      // disableCenter: false,
                                      height: size.height * 0.34,
                                      // aspectRatio: 16 / 9,
                                    ),
                                    items: jobRequest!.images!
                                        .map((item) => Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.white),
                                              height: size.height * 0.34,
                                              width: size.width,
                                              child: Center(
                                                child: Image.network(
                                                  item.url!,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                  Container(
                                    height: 70,
                                    color: Colors.grey[100],
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 1),
                                                    child: CircleAvatar(
                                                      radius: 18,
                                                      backgroundImage:
                                                          NetworkImage(
                                                        jobRequest!
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                          "${jobRequest!.firstName!} ${jobRequest!.lastName!}",
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                          "Top Rated Seller",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  _userDetailsModalBottomSheet(
                                                      context,
                                                      size,
                                                      padding,
                                                      jobRequest,
                                                      jobRequestScrollController);
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Icon(
                                                    Icons.expand_more_outlined,
                                                    color: Colors.grey,
                                                    // size: 11,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      jobRequest!.title!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: ExpandableText(
                                      jobRequest!.description!
                                    ),
                                  ),
                                  if (jobRequest!.faqs!.isNotEmpty)
                                    ExpansionTile(
                                      title: const Text(
                                        'Price',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          primary: false,
                                          padding: const EdgeInsets.all(4.0),
                                          itemCount: jobRequest!.faqs!.length,
                                          itemBuilder: (context, index) {
                                            return Faq(
                                                question: jobRequest!
                                                    .faqs![index].question,
                                                answer: jobRequest!
                                                    .faqs![index].answer);
                                          },
                                        ),
                                      ],
                                    ),
                                  if (jobRequest!.faqs!.isNotEmpty)
                                    ExpansionTile(
                                      title: const Text(
                                        'Frequently Asked Questions',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          primary: false,
                                          padding: const EdgeInsets.all(4.0),
                                          itemCount: jobRequest!.faqs!.length,
                                          itemBuilder: (context, index) {
                                            return Faq(
                                                question: jobRequest!
                                                    .faqs![index].question,
                                                answer: jobRequest!
                                                    .faqs![index].answer);
                                          },
                                        ),
                                      ],
                                    ),
                                  if (jobRequest!.reviews!.isNotEmpty)
                                    ExpansionTile(
                                      title: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 8.0, 16.0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  jobRequest!.totalNoOfReviews ==
                                                          1
                                                      ? "${jobRequest!.totalNoOfReviews} Review"
                                                      : "${jobRequest!.totalNoOfReviews} Reviews",
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            addHorizontalSpace(3),
                                            Column(
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
                                                          size: 14,
                                                        )
                                                      ],
                                                    ),
                                                    addHorizontalSpace(3),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          jobRequest!
                                                              .overallRating!
                                                              .toStringAsFixed(
                                                                  1),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.amber,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
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
                                      children: [
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
                                                    "Overall Rating",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                                            jobRequest!
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
                                                                        .w600),
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                            jobRequest!
                                                                .communication!
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
                                                                        .w600),
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                            jobRequest!
                                                                .serviceAsDescribed!
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
                                                                        .w600),
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
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                            jobRequest!
                                                                .recommend!
                                                                .toStringAsFixed(
                                                                    1),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.amber,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: padding),
                                          child: NotificationListener<
                                              OverscrollIndicatorNotification>(
                                            onNotification:
                                                (OverscrollIndicatorNotification?
                                                    overscroll) {
                                              overscroll!.disallowIndicator();
                                              return true;
                                            },
                                            child: SingleChildScrollView(
                                              controller:
                                                  jobRequestScrollController,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: jobRequest!.reviews!
                                                    .map((item) =>
                                                        EmployeeReview(
                                                            type: "main",
                                                            review: item))
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

void _userDetailsModalBottomSheet(
    context, size, padding, jobRequest, jobRequestScrollController) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
        const double padding = 10;
        final ThemeData themeData = Theme.of(context);
        final NavigationService navigationService =
            locator<NavigationService>();
        return DraggableScrollableSheet(
            expand: true,
            initialChildSize: 0.68, // half screen on load
            maxChildSize: 1.0, // full screen on scroll
            // minChildSize: 0.25,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                // height: MediaQuery.of(context).size.height * 0.75,
                color: Colors.white,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
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
                                            jobRequest.profileImage,
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              jobRequest.firstName +
                                                  " " +
                                                  jobRequest.lastName,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
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
                                                          jobRequest
                                                              .overallRating
                                                              .toStringAsFixed(
                                                                  1),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.amber,
                                                              fontSize: 11,
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
                                                          "(${jobRequest.totalNoOfReviews})",
                                                          style: const TextStyle(
                                                              color: COLOR_GREY,
                                                              fontSize: 11,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "Contact",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification:
                                (OverscrollIndicatorNotification? overscroll) {
                              overscroll!.disallowIndicator();
                              return true;
                            },
                            child: SingleChildScrollView(
                              controller: scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "From",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "Sri Lanka",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "Employee level",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "Sri Lanka",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "Languages",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "Sinhala, English",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "Average response time",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "1 hour",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w700,
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

                                  Divider(
                                    height: padding,
                                    thickness: 1.0,
                                    color: Colors.grey[400],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Description",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Material icons are delightful, beautifully crafted symbols for common actions and items. Download on desktop to use them in your digital products for Android, iOS, and web. Material icons are delightful, beautifully crafted symbols for common actions and items. Download on desktop to use them in your digital products for Android, iOS, and web.",
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
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
                                                      jobRequest.overallRating
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
                                                      jobRequest.communication
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
                                                      jobRequest
                                                          .serviceAsDescribed
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
                                                      jobRequest.recommend
                                                          .toStringAsFixed(1),
                                                      style: const TextStyle(
                                                        color: Colors.amber,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'Montserrat',
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
                                              "${jobRequest.totalNoOfReviews} Reviews",
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
                                  ///
                                  ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: jobRequest.reviews.length,
                                    itemBuilder: (context, index) {
                                      return EmployeeReview(
                                          review: jobRequest.reviews[index]);
                                    },
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: padding),
                                  //   child: NotificationListener<
                                  //       OverscrollIndicatorNotification>(
                                  //     onNotification:
                                  //         (OverscrollIndicatorNotification?
                                  //             overscroll) {
                                  //       overscroll!.disallowIndicator();
                                  //       return true;
                                  //     },
                                  //     child: SingleChildScrollView(
                                  //       controller: jobRequestScrollController,
                                  //       physics:
                                  //           const AlwaysScrollableScrollPhysics(),
                                  //       scrollDirection: Axis.horizontal,
                                  //       child: Row(
                                  //         children: jobRequest!.reviews!
                                  //             .map((item) =>
                                  //                 EmployeeReview(review: item))
                                  //             .toList(),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //////////////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // FlatButton(
                                        //   onPressed: () {
                                        //     navigationService.navigateTo(
                                        //         routes.EmployeeFullProfileRoute,
                                        //         arguments:
                                        //             jobRequest.employeeId);
                                        //   },
                                        //   child: Text(
                                        //     'See Full Profile',
                                        //     style: themeData.textTheme.button,
                                        //   ),
                                        //   color: COLOR_BLUE,
                                        //   height: 40.0,
                                        //   minWidth: size.width * 0.94,
                                        // ),
                                        TextButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith((state) =>
                                                          COLOR_BLUE),
                                              shape: MaterialStateProperty
                                                  .resolveWith(
                                                (state) =>
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    30.0)),
                                              )),
                                          onPressed: () {
                                            navigationService.navigateTo(
                                                routes.employeeFullProfileRoute,
                                                arguments:
                                                    jobRequest.employeeId);
                                          },
                                          child: Text(
                                            'See Full Profile',
                                            style:
                                                themeData.textTheme.labelLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            });
      });
}
