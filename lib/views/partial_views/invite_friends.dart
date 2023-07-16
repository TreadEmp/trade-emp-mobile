import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/constants/theam_data.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';
import 'package:share/share.dart';

class InviteFriends extends StatelessWidget {
  final EdgeInsets? padding;
  final double width, height;
  final Text heddingText;
  final Text bodyText;
  final String buttonText;

  const InviteFriends(
      {Key? key,
      this.padding,
      required this.width,
      required this.height,
      required this.heddingText,
      required this.bodyText,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        final RenderBox box = context.findRenderObject() as RenderBox;
        Share.share(
            'Trade-emp is the fastest way to get your work done. Try it today /n https://www.tradeemp.com',
            subject: 'Trade-emp Invitation',
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              addVerticalSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  heddingText,
                ],
              ),
              addVerticalSpace(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bodyText,
                ],
              ),
              addVerticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // FlatButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     buttonText,
                  //     style: themeData.textTheme.button,
                  //   ),
                  //   color: COLOR_BLUE,
                  //   height: 40.0,
                  //   minWidth: width * 0.9,
                  // ),
                  SizedBox(
                    height: 40.0,
                    width: width * 0.9,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (state) => COLOR_BLUE),
                          shape: MaterialStateProperty.resolveWith(
                            (state) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0)),
                          )),
                      onPressed: () {},
                      child: Text(
                        buttonText,
                        style: themeData.textTheme.labelLarge,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
