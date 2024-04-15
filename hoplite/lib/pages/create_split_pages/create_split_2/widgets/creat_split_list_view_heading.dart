import 'package:flutter/material.dart';

Widget createSplitListViewHeading() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 17,
          height: 30,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "No",
              style: TextStyle(
                color: Color(0xFF0B4130),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Exercise",
                style: TextStyle(
                  color: Color(0xFF0B4130),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
