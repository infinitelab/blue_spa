import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum TaostNotificationType { error, warning, success }

class ToastNotification {
  static show(BuildContext context, String message,
      {TaostNotificationType type = TaostNotificationType.error}) {
    toastification.show(
        alignment: Alignment.bottomCenter,
        backgroundColor: type == TaostNotificationType.error
            ? Colors.red
            : type == TaostNotificationType.warning
                ? Colors.yellow
                : Colors.green,
        foregroundColor: Colors.white,
        primaryColor: Colors.white,
        context: context,
        autoCloseDuration: const Duration(seconds: 3),
        title: Text(message));
  }
}
