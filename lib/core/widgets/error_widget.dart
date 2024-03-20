import 'package:flutter/material.dart';

import '../utlis/failure.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({required this.failure, super.key});
  final Failure failure;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.msg,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
