import 'package:flutter/material.dart';

class Messenger {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar({required String message, Color? color}) {
    Size size = MediaQuery.of(scaffoldKey.currentState!.context).size;
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        margin: EdgeInsets.only(bottom: size.height - 150, right: 20, left: 20),
        content: Text(
          message,
          style: const TextStyle(
              letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
