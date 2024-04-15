import 'package:flutter/material.dart';
import 'package:hoplite/global_widgets/button_small.dart';
import 'package:hoplite/global_widgets/h1_h2.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%201%20widgets/workout_exercise_listview.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%202/quick_start_page_2.dart';

Future<void> startWorkoutPopUpBox(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      // Return the dialog widget here
      return AlertDialog(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: const Color(0xffFFFFFF),
        title: h1h2("Bro's Split", "Chest"),
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: const DaysWorkoutListView(
            data: {
              1: 'Push-ups',
              2: 'Sit ups',
              3: 'dumbell curls',
              4: 'leg press',
              5: 'Shoulder press',
              6: 'Squats',
              // 7: 'Push-ups',
              // 8: 'Sit ups',
              // 9: 'dumbell curls',
              // 10: 'leg press',
              // 11: 'Shoulder press',
              // 12: 'Squats',
              // Add more entries as needed
            },
          ),
        ),
        actions: [
          ButtonSmall(
              h2: "Start Workout",
              context: context,
              navigateTo: const QuickStartPage2())
        ],
      );
    },
  );
}
