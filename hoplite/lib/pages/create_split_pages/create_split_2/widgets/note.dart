import 'package:flutter/material.dart';

Widget note(String note) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFE9ECEB)),
        borderRadius: BorderRadius.circular(13),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Note : ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF3AB28C),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0.12,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note,
                  style: const TextStyle(
                    color: Color(0xFF0B4130),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
