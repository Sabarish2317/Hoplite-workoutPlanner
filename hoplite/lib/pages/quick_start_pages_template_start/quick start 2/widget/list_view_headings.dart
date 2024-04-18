import 'package:flutter/material.dart';

Widget workoutLiveListViewHeading() {
  return SizedBox(
    width: 450,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
            width: 150,
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
          Container(
            width: 60,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'reps',
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
          Container(
            width: 60,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sets',
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
          Container(
            width: 70,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Weight',
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
          // Container(
          //   width: 32,
          //   height: 30,
          //   padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
          //   child: const Center(
          //       child: Icon(
          //     Icons.check,
          //     size: 13,
          //   )),
          // ),
        ],
      ),
    ),
  );
}
