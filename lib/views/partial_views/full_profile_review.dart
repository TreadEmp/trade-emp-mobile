import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/models/users/review_model.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';

/* this class is used to display reviews by employers */
class FullProfileReview extends StatelessWidget {
  final Reviews review;
  const FullProfileReview({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helper helper = Helper();
    // final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    // final NavigationService _navigationService = locator<NavigationService>();
    return Column(
      children: [
        addVerticalSpace(10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: CircleAvatar(
                        radius: 21,
                        backgroundImage: NetworkImage(
                          review.reviewer!.profileImage!,
                          // useDiskCache: true,
                          // cacheRule: CacheRule(
                          //   maxAge: const Duration(days: 7),
                          // ),
                        ),
                      ),
                    ),
                    addHorizontalSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "${review.reviewer!.firstName!} ${review.reviewer!.lastName!}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white),
                                        width: size.width * 0.05,
                                        height: 10,
                                        child: SvgPicture.asset(
                                            "assets/svg/sri-lanka.svg",
                                            fit: BoxFit.cover),
                                      ),
                                    ],
                                  ),
                                  addHorizontalSpace(3),
                                  Column(
                                    children: [
                                      Text(
                                        "${review.reviewer!.city!} - ",
                                        style: const TextStyle(
                                            color: COLOR_GREY,
                                            fontSize: 11,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                  addHorizontalSpace(3),
                                  Column(
                                    children: [
                                      Text(
                                        review.reviewer!.country!,
                                        style: const TextStyle(
                                            color: COLOR_GREY,
                                            fontSize: 11,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                review.rating!.toStringAsFixed(1),
                                style: const TextStyle(
                                    color: Colors.amber,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    helper.getDuration(review.createdAt!),
                    style: const TextStyle(
                        color: COLOR_GREY,
                        fontSize: 11,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
        addVerticalSpace(8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.0001,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                review.review!,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(8.0),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width: size.width * 0.18,
                                height: 50,
                                child: Image.network(
                                  review.images![0].url!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width: size.width * 0.18,
                                height: 50,
                                child: Image.network(
                                  review.images![1].url!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                width: size.width * 0.18,
                                height: 50,
                                child: Image.network(
                                  review.images![2].url!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        addVerticalSpace(10.0),
      ],
    );
  }
}
