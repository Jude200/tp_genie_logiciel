import 'package:flutter/material.dart';

enum SnackBarStatus { success, failure, neutral }

void snackBarPerso(SnackBarStatus status, String msg, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: status == SnackBarStatus.success
          ? Colors.green
          : status == SnackBarStatus.failure
              ? Colors.red
              : Theme.of(context).primaryColor,
      content: Text(msg)));
}
