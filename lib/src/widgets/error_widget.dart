import 'package:flutter/material.dart';

Widget buildErrorWidget(String error) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text(
        "Check your internet connection or some error on system",
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
    ],
  );
}