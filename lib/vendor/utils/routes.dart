import 'package:flutter/material.dart';

class Routes {
  static final navigationKey = GlobalKey<NavigatorState>();

  static push({required Widget screen}) {
    navigationKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static back({required Widget screen}) {
    navigationKey.currentState?.pop();
  }

  static pushReplace({required Widget screen}) {
    navigationKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushRemoveUntil({required Widget screen}) {
    navigationKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) => false,
    );
  }
}
