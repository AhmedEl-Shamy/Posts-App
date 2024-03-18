import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar getAppBar({
    required String title,
    required BuildContext context,
  }) {
    return AppBar(
      title: Text(title, overflow: TextOverflow.ellipsis, maxLines: 1,),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
