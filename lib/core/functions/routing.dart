import 'package:flutter/material.dart';

class AppRouting {
  static Future navigateTo(Widget newScreen, BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => newScreen),
      
    );
  }

  static Future navigateWithReplacement(
      Widget newScreen, BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => newScreen),
    );
  }

  static Future navigateAndRemove(Widget newScreen, BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => newScreen),
      (Route<dynamic> route) => false,
    );
  }

  static pop(BuildContext context) {
    return Navigator.of(context).canPop();
  }
}
