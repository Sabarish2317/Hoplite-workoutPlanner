import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget h0_h2(String h0, String h2, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //backbutton
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            width: 41,
            height: 41,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE8ECF4)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      const SizedBox(width: 15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              h0,
              style: const TextStyle(
                color: Color(0xFF0B4130),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "$h2 split",
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
        ),
      )
    ],
  );
}
