import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:trade_emp_mobile/models/job/job.dart' as jobs;

class UserJobs extends StatelessWidget {
  final jobs.Items job;
  const UserJobs({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 160,
      width: size.width,
      child: Card(
        color: Colors.white,
        elevation: 1.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      // alignment: Alignment.center,
                      width: size.width * 0.4,
                      height: 152,
                      child:
                          Image.network(job.images![0].url!, fit: BoxFit.cover)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  height: 152 * 0.3,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.25,
                        height: 152 * 0.5,
                        // color: Colors.green,
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 13,
                                  ),
                                )
                              ],
                            ),
                            addHorizontalSpace(3),
                            const Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                                  child: Text(
                                    "4.9",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 11,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                            addHorizontalSpace(3),
                            const Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                                  child: Text(
                                    "(304)",
                                    style: TextStyle(
                                        color: COLOR_GREY,
                                        fontSize: 11,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.25,
                        height: 152 * 0.5,
                        // color: Colors.pink,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "",
                                    style: TextStyle(
                                        color: job.status == 'pending'
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 11,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  height: 152 * 0.4,
                  // color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      job.title!,
                      style: const TextStyle(
                        color: COLOR_BLACK,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.5,
                  height: 152 * 0.3,
                  // color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              job.status!,
                              style: TextStyle(
                                  color: job.status == 'hired'
                                      ? Colors.green
                                      : job.status == 'pendingtt'
                                          ? Colors.red
                                          : Colors.deepPurple,
                                  fontSize: 11,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
