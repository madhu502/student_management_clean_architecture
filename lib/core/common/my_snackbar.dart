import 'package:flutter/material.dart';
import 'package:student_management_starter/app/navigator_key/navigator_key.dart';

showMySnackBar({
  required String message,
  Color? color
}) {
  ScaffoldMessenger.of(

    // Already created this navigatorkey in the navigator_kry.dart file
    AppNavigator.navigatorKey.currentState!.context,
  ).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.green,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
