import 'package:flutter/material.dart';

class CustomSnackBars {
  static SnackBar errorSnackBar({
    required String msg,
    required BuildContext context,
  }) =>
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onError,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: const Duration(seconds: 5),
      );

  static SnackBar successSnackBar({
    required String msg,
    required BuildContext context,
  }) =>
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onError,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green.shade700,
        duration: const Duration(seconds: 5),
      );
}
