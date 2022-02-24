import 'package:flutter/material.dart';

enum NotifierSnackBarType { sucess, alert, error }

class NotifierSnackBar {
  BuildContext context;
  late SnackBar snackBar;

  NotifierSnackBar({required this.context});

  void show(String message, NotifierSnackBarType type) {
    if (message.length > 200) throw "Message input max length is 200 caracters";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    TargetPlatform targetPlatform = Theme.of(context).platform;
    late double maxWidth;

    if (targetPlatform == TargetPlatform.android ||
        targetPlatform == TargetPlatform.iOS ||
        screenWidth <= 600) {
      maxWidth = screenWidth;
    } else {
      maxWidth = screenWidth * 0.35;
    }

    double margin = (screenWidth - maxWidth) / 2 + 10;

    Color backgroundColor;

    switch (type) {
      case NotifierSnackBarType.sucess:
        backgroundColor = Colors.green;
        break;
      case NotifierSnackBarType.alert:
        backgroundColor = Colors.yellow;
        break;
      case NotifierSnackBarType.error:
        backgroundColor = Color.fromARGB(255, 255, 100, 100);
        break;
      default:
        backgroundColor = Colors.black;
    }

    snackBar = SnackBar(
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'Ok',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      backgroundColor: backgroundColor,
      content: Text(message),
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      // margin: EdgeInsets.fromLTRB(110, 110, 110, 110),
      margin: EdgeInsets.fromLTRB(
          margin, 0.05 * screenHeight, margin, 0.8 * screenHeight),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void hide() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
