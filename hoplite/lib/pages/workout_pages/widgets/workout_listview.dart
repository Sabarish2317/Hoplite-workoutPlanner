import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoplite/model/workout_model.dart';

class WorkoutListview extends StatelessWidget {
  final List<WorkoutDetail> workoutDetails;

  const WorkoutListview({super.key, required this.workoutDetails});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: workoutDetails.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      height: 46,
                      width: 35,
                      child: (() {
                        if (workoutDetails[index].imgPath.startsWith('lib')) {
                          // Load as an asset
                          return Image.asset(
                            workoutDetails[index].imgPath,
                            fit: BoxFit.cover,
                          );
                        } else {
                          // Load as a local file
                          return Image.file(
                            File(workoutDetails[index].imgPath),
                            fit: BoxFit.cover,
                          );
                        }
                      })(),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workoutDetails[index].name,
                          style: const TextStyle(
                            color: Color(0xFF0B4130),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          workoutDetails[index].targetMuscle,
                          style: const TextStyle(
                            color: Color(0xFF0B4130),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
