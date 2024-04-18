import 'package:flutter/material.dart';
import 'package:hoplite/pages/home_page/home_page.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick_start_page_1.dart';
import 'package:hoplite/pages/start_workout_page/start_workout_page.dart';

import '../../../model/workout_model.dart';

class WorkoutCard extends StatefulWidget {
  final String h1;

  final int index;
  final Map<int, DayName> dayList;

  const WorkoutCard(
      {super.key,
      required this.h1,
      required this.index,
      required this.dayList});

  @override
  State<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83,
      child: InkWell(
          radius: 15,
          onLongPress: () {
            showDialogBox(context, widget.index);
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuickStartPage(
                      //passing h1 as it contains the name of the current split to display on top of the next page
                      dayListReference: widget.dayList,
                      splitName: widget.h1)),
            );
          },
          child: Container(
            width: 163.50,
            height: 83,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.46000000834465027),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0x1927423A),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 83,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "lib/assets/exercise_pics/dumbell_pic_for_card.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  flex: (widget.h1.length > 8) ? 2 : 1,
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 18),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.h1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xCC00111C),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Splits',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xCC303E47),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void showDialogBox(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text('Are you sure want to delete the split permanently ?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Perform action when button is pressed
                templateNameInstance.removeAt(index);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),

                  (route) =>
                      false, // This prevents the back button from returning to the previous page
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Deleted successfully'),
                    duration:
                        Duration(seconds: 2), // Adjust the duration as needed
                  ),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
