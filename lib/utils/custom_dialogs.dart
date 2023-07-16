import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trade_emp_mobile/utils/widget_functions.dart';

Future<void> showErrorDialog(
    String? message, BuildContext context, dynamic auth) async {
  await Future.delayed(const Duration(milliseconds: 3000));
  if (message != null) {
    Timer? timer = Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });

    return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext builderContext) {
          return AlertDialog(
            elevation: 10,
            backgroundColor: const Color(0xfffbeae8),
            title: Row(children: [
              const Icon(
                Icons.error_outline,
                size: 20.0,
                color: Color(0xfff25347),
              ),
              addHorizontalSpace(10.0),
              const Text(
                'Error',
                style: TextStyle(color: Color(0xff601914), fontSize: 20),
              ),
            ]),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    message,
                    style:
                        const TextStyle(color: Color(0xff601914), fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }).then((value) {
      timer?.cancel();
      timer = null;
      auth.setError(null);
    });
  }
  return;
}

Future<void> showWarningDialog(String? message, BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 3000));
  if (message != null) {
    Timer? timer = Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });

    return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext builderContext) {
          return AlertDialog(
            elevation: 10,
            backgroundColor: const Color(0xfffdf2e3),
            title: Row(children: [
              const Icon(
                Icons.warning_amber_outlined,
                size: 20.0,
                color: Color(0xfffd9f16),
              ),
              addHorizontalSpace(10.0),
              const Text(
                'Warning',
                style: TextStyle(color: Color(0xff653b00), fontSize: 20),
              ),
            ]),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    message,
                    style:
                        const TextStyle(color: Color(0xff653b00), fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }).then((value) {
      timer?.cancel();
      timer = null;
    });
  }
  return;
}

Future<void> showInfoDialog(String? message, BuildContext context) async {
  if (message != null) {
    Timer? timer = Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });

    return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext builderContext) {
          return AlertDialog(
            elevation: 10,
            backgroundColor: const Color(0xffe6f2fb),
            title: Row(children: [
              const Icon(
                Icons.error_outline,
                size: 20.0,
                color: Color(0xff349df2),
              ),
              addHorizontalSpace(10.0),
              const Text(
                'Info',
                style: TextStyle(color: Color(0xff0c3b60), fontSize: 20),
              ),
            ]),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    message,
                    style:
                        const TextStyle(color: Color(0xff0c3b60), fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }).then((value) {
      timer?.cancel();
      timer = null;
    });
  }
  await Future.delayed(const Duration(milliseconds: 3000));
  return;
}

Future<void> showSuccessDialog(String? message, BuildContext? context) async {
  await Future.delayed(const Duration(milliseconds: 3000));
  if (message != null) {
    Timer? timer = Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context!, rootNavigator: true).pop();
    });

    return showDialog(
        context: context!,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext builderContext) {
          return AlertDialog(
            elevation: 10,
            backgroundColor: const Color(0xffe6f2fb),
            title: Row(children: [
              const Icon(
                Icons.check_circle_outline,
                size: 20.0,
                color: Color(0xff88c98b),
              ),
              addHorizontalSpace(10.0),
              const Text(
                'Success',
                style: TextStyle(color: Color(0xff1d451f), fontSize: 20),
              ),
            ]),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    message,
                    style:
                        const TextStyle(color: Color(0xff1d451f), fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        }).then((value) {
      timer?.cancel();
      timer = null;
    });
  }
  return;
}
