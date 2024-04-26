import 'package:flutter/material.dart';
import 'package:hoplite/data/workoutdata.dart';
import 'package:hoplite/pages/workout_pages/widgets/addworkoutdialogue.dart';
import 'package:hoplite/pages/workout_pages/widgets/workout_listview.dart';
import '../quick_start_pages_template_start/quick start 1 widgets/h0_h2.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  var workoutDetailInstance = workoutDetails;
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
                        child: WorkoutListview(
                            workoutDetails: workoutDetailInstance)),
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AddWorkoutDialogue();
                          },
                        );
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

