import 'package:flutter/material.dart';
import 'package:hoplite/global_widgets/button_small.dart';
import 'package:hoplite/global_widgets/h1_h2.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%202/quick_start_page_2.dart';

import '../../../model/workout_model.dart';

Future<void> addWorkoutPopup(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      // Return the dialog widget here
      return AlertDialog(
        backgroundColor: const Color(0xffFFFFFF),
        surfaceTintColor: const Color(0xffFFFFFF),
        title: h1h2("Add Workout", "You can't modify this after creating"),
        content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 24),
                      Text(
                        'Workout Name',
                        style: TextStyle(
                          color: Color(0xFF0B4130),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Target Muscle',
                        style: TextStyle(
                          color: Color(0xFF0B4130),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sets',
                        style: TextStyle(
                          color: Color(0xFF0B4130),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Reps',
                        style: TextStyle(
                          color: Color(0xFF0B4130),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Weight (Kg)',
                        style: TextStyle(
                          color: Color(0xFF0B4130),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Workout Image (optional)',
                        style: TextStyle(
                          color: Color(0xFF0B4130),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                iconSize: MaterialStatePropertyAll(24),
                                shape: MaterialStatePropertyAll(CircleBorder()),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xff5AF5C4))),
                            onPressed: () {},
                            child: const Icon(
                              Icons.add,
                              color: Color(0xff17352C),
                              size: 26,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )),
        actions: [
          ButtonSmall(
              shouldPop: true,
              h2: "Add Workout",
              context: context,
              snackBarText: "Added to Workouts",
              //gave blank data as it it not required for this type should pop true
              navigateTo: QuickStartPage2(
                templateName: "",
                dayName: "",
                exerciseList: dummyExerciseList(),
              ))
        ],
      );
    },
  );
}

Map<int, WorkoutDetail> dummyExerciseList() {
  Map<int, WorkoutDetail> list = {};
  return list;
}
