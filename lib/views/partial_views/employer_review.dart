import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/helper.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/models/job/latest_job.dart' as latest_jobs;

/* this class is used to display reviews by employers */
class EmployerReview extends StatelessWidget {
  final latest_jobs.Reviews? review;
  final String? type;
  const EmployerReview({Key? key, required this.review, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helper helper = Helper();
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 235,
      width: size.width * 0.8,
      child: Card(
        color: Colors.white,
        elevation: type == "main" ? 2 : 0,
        child: Padding(
          padding: type == "main"
              ? const EdgeInsets.all(8.0)
              : const EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                width: type == "main" ? size.width * 0.8 : size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundImage: NetworkImage(
                                      review!.reviewer!.profileImage!),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Flexible(
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700),
                                            text:
                                                "${review!.reviewer!.firstName!} ${review!.reviewer!.lastName!}"),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: SizedBox(
                                      width: 24,
                                      height: 16,
                                      child: SvgPicture.asset(
                                          "assets/svg/sri-lanka.svg",
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      type != "main"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
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
                                                    review!.rating!
                                                        .toStringAsFixed(1),
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 252, 214, 101),
                                                        fontSize: 11,
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            helper.getDuration(
                                                review!.createdAt!),
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
                              ],
                            )
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: []),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: type == "main" ? size.width * 0.8 : size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: type == "main"
                                    ? size.width * 0.7
                                    : size.width * 0.9,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 1,
                                  ),
                                  child: Text(
                                    "${review!.review!.length > 200 ? '${review!.review!.substring(0, 197)}...' : review!.review}",
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
                width: type == "main" ? size.width * 0.8 : size.width,
                child: getReviewImageContainer(review!.images!),
              ),
              type == "main"
                  ? SizedBox(
                      width: type == "main" ? size.width * 0.8 : size.width,
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
                                              review!.rating!
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
                                        helper.getDuration(review!.createdAt!),
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
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      width: type == "main" ? size.width * 0.8 : size.width,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8, 0, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget getReviewImageContainer(List<latest_jobs.Images> images) {
    switch (images.length) {
      case 0:
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHorizontalSpace(5),
                ],
              ),
            ],
          ),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[0].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  addHorizontalSpace(5),
                ],
              ),
            ],
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[0].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  addHorizontalSpace(5),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[1].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  addHorizontalSpace(5),
                ],
              ),
            ],
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[0].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  addHorizontalSpace(5),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[1].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  addHorizontalSpace(5),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[2].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[0].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  addHorizontalSpace(5),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[1].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  addHorizontalSpace(5),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      images[2].url!,
                      width: 75,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
    }
  }
}
