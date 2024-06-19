import 'package:flutter/material.dart';

mixin NotificationMixin on StatefulWidget {
  void showAlert(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Color(0XFFEEEEEE),
        duration: const Duration(seconds: 1),
        content: Text(message),
      ),
    );
  }
}
