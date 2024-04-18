import 'package:flutter/material.dart';
import 'package:hoplite/global_widgets/button_small.dart';
import 'package:hoplite/global_widgets/h1_h2.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%201%20widgets/workout_exercise_listview.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%202/quick_start_page_2.dart';

import '../../../model/workout_model.dart';

Future<void> startWorkoutPopUpBox(
  final String templateName,
  final String dayName,
  BuildContext context,
  DayName dayNameReference,
) async {
  //extracting the exercise in that specific workout day passed to this fucntion
  final Map<int, WorkoutDetail> exerciseList = dayNameReference.workoutList;
  //
  //
  //
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      // Return the dialog widget here
      return AlertDialog(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: const Color(0xffFFFFFF),
        title: h1h2("${templateName}Split", dayName),
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: DaysWorkoutListView(workoutList: exerciseList),
        ),
        actions: [
          ButtonSmall(
              h2: "Start Workout",
              context: context,
              shouldPop: false,
              navigateTo: QuickStartPage2(
                  templateName: templateName,
                  dayName: dayName,
                  exerciseList: exerciseList))
        ],
      );
    },
  );
}
