import 'package:flutter/material.dart';

Widget h1h2(String h1, String h2) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: double.infinity,
        child: Text(
          h1,
          style: const TextStyle(
            color: Color(0xFF069A6B),
            fontSize: 22,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: Text(
          h2,
          style: const TextStyle(
            color: Color(0xCC0B4130),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
    ],
  );
}
