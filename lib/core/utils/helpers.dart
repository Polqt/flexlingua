import 'package:flutter/material.dart';

class Helpers {
  static void showSnackBarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
