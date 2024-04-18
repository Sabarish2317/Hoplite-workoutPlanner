// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:hoplite/pages/home_page/home_page.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%202/widget/list_view_headings.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%202/widget/workout_live_list_tile.dart';
import '../../../../global_widgets/h1_h2.dart';
import '../../../../model/workout_model.dart';

class LiveWorkoutListView extends StatefulWidget {
  final String templateName;
  final String dayName;
  final Map<int, WorkoutDetail> exerciseList;

  const LiveWorkoutListView(
      {super.key,
      required this.templateName,
      required this.dayName,
      required this.exerciseList});

  @override
  State<LiveWorkoutListView> createState() => _LiveWorkoutListViewState();
}

class _LiveWorkoutListViewState extends State<LiveWorkoutListView> {
  Map<int, WorkoutDetail> modifiedExerciseList = {};
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x1927433A)),
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            h1h2("${widget.templateName} Split", widget.dayName),
            //using seperae column for different padding for heading and listview contents
            const SizedBox(
              height: 32,
            ),

            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    workoutLiveListViewHeading(),
                    WorkoutLiveListView(
                      data: widget.exerciseList,
                      onExerciseDataChanged: _updateExerciseData,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: ShapeDecoration(
                  color: const Color(0xFF5AF5C4),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0x1E27433A)),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 20,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(13),
                  onTap: () {
                    // addHistory(getCurrentDate(), widget.templateName,
                    //     widget.dayName, modifiedExerciseList);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Saved to workout History')));
                  },
                  child: const Center(
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        color: Color(0xFF242731),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _updateExerciseData(Map<int, WorkoutDetail>? modifiedData) {
    setState(() {
      if (modifiedData != null) {
        modifiedExerciseList = modifiedData;
      }
    });
  }

  // void printModifiedExerciseList() {
  //   modifiedExerciseList.forEach((key, value) {
  //     print("Exercise at index $key:");
  //     print("Name: ${value.name}");
  //     print("Reps: ${value.reps}");
  //     print("Sets: ${value.sets}");
  //     print("Weight: ${value.weight}");
  //     print("---------------------------------");
  //   });
  // }

  // void addHistory(currentDate, templateName, dayName, modExerciseList) {
  //   appWorkoutHistory
  //       .add(History(currentDate, [templateName, dayName, modExerciseList]));
  // }

  // String getCurrentDate() {
  //   // Get the current date
  //   DateTime currentDate = DateTime.now();

  //   // Format the date as "MMM dd yyyy" (e.g., "Apr 23 2024")
  //   return DateFormat('MMM dd yyyy').format(currentDate);
  // }
}
//custom snack bar widget
