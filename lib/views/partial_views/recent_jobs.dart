import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/locator.dart';
import 'package:trade_emp_mobile/services/navigation_service.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/models/job/latest_job.dart' as latest_jobs;
import 'package:trade_emp_mobile/constants/route_paths.dart' as routes;

class RecentJobs extends StatelessWidget {
  final latest_jobs.Items job;
  const RecentJobs({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final NavigationService navigationService = locator<NavigationService>();
    return SizedBox(
      height: 320,
      width: size.width * 0.6,
      // 0.5902
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        navigationService.navigateTo(routes.jobRoute,
                            arguments: job);
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: Image.network(
                          job.images![0].url!,
                          width: size.width * 0.8,
                          height: 175,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: size.width * 0.6,
                      height: 175,
                      alignment: Alignment.topRight,
                      child: Container(
                        width: size.width * 0.1186,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black.withAlpha(150),
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                color: COLOR_GREY.withAlpha(40), width: 2)),
                        padding: const EdgeInsets.all(8.0),
                        child: const Center(
                            child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundImage: NetworkImage(
                                        job.profileImage!,
                                        // useDiskCache: true,
                                        // cacheRule: CacheRule(
                                        //   maxAge: const Duration(days: 7),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700),
                                            text:
                                                "${job.firstName!} ${job.lastName!}"),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "Top Rated Seller",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.5194,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 1,
                                      ),
                                      child: Text(
                                        "${job.title!.length > 63 ? '${job.title!.substring(0, 60)}...' : job.title}",
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 0, 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Column(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color.fromARGB(
                                                255, 252, 214, 101),
                                            size: 11,
                                          )
                                        ],
                                      ),
                                      addHorizontalSpace(3),
                                      Column(
                                        children: [
                                          Text(
                                            job.overallRating!
                                                .toStringAsFixed(1),
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 252, 214, 101),
                                                fontSize: 11,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                      addHorizontalSpace(3),
                                      Column(
                                        children: [
                                          Text(
                                            "(${job.totalNoOfReviews!.toStringAsFixed(1)})",
                                            style: const TextStyle(
                                                color: COLOR_GREY,
                                                fontSize: 11,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      "${job.activeBids!.toStringAsFixed(0)}  Active Bids",
                                      style: const TextStyle(
                                          color: COLOR_BLUE,
                                          fontSize: 11,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
