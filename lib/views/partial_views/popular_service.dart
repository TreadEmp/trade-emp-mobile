import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/models/jobCategory/job_category.dart'
    as job_category;

class PopularService extends StatelessWidget {
  final job_category.Items jobCategory;

  const PopularService({Key? key, required this.jobCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: 185,
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          //set border radius more than 50% of height and width to make circle
        ),
        color: Colors.white,
        elevation: 1.5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Image.network(
                    jobCategory.image!.url!,
                    width: 142,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          jobCategory.category!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700),
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
