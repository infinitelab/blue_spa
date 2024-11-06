import 'package:flutter/material.dart';

class AppNavigation {
  static push(BuildContext context, String page, {Object? arg}) {
    Navigator.pushNamed(context, page, arguments: arg);
  }

  static pushAndRemoveAll(BuildContext context, String page, {Object? arg}) {
    Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
  }
}
