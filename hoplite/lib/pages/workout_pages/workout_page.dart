import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hoplite/model/workout_model.dart';

import 'package:hoplite/pages/workout_pages/widgets/popup.dart';
import 'package:hoplite/pages/workout_pages/widgets/workout_listview.dart';

import '../quick_start_pages_template_start/quick start 1 widgets/h0_h2.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //user name and profile avatar
                    h0_h2("Workouts", 'Preset or create own workouts', context),
                    const SizedBox(
                      height: 24,
                    ),

                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        clipBehavior: Clip.antiAlias,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13),
                            ),
                          ),
                        ),
                        child: WorkoutListview(workoutDetails: workoutDetails)),
                  ],
                ),
              ),
              //elevated button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          iconSize: MaterialStatePropertyAll(24),
                          shape: MaterialStatePropertyAll(CircleBorder()),
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff5AF5C4))),
                      onPressed: () {
                        addWorkoutPopup(context);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Color(0xff17352C),
                        size: 26,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//home page widgets/
//
//

//test data
List<WorkoutDetail> workoutDetails = [
  WorkoutDetail('Bench Press', 'Chest', 3, 10, 50,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Pull-ups', 'Back', 3, 12, 0,
      'lib/assets/exercise_pics/exercisePic (9).jpeg'),
  WorkoutDetail('Push-ups', 'Chest', 3, 13, 0,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Cable Pull-ups', 'Back', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Squats', 'Legs', 4, 8, 100,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Deadlifts', 'Back', 3, 8, 120,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Dumbbell Press', 'Chest', 3, 12, 40,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Barbell Rows', 'Back', 3, 10, 60,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Dips', 'Chest', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Leg Press', 'Legs', 4, 10, 150,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Lat Pulldowns', 'Back', 3, 12, 50,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Incline Bench Press', 'Chest', 3, 10, 45,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Hamstring Curls', 'Legs', 3, 12, 40,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Pull-up Variations', 'Back', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Chest Flys', 'Chest', 3, 12, 25,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Leg Extensions', 'Legs', 3, 12, 30,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Seated Cable Rows', 'Back', 3, 10, 55,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Shoulder Press', 'Shoulders', 3, 10, 40,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
  WorkoutDetail('Lunges', 'Legs', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (10).jpeg'),
];
