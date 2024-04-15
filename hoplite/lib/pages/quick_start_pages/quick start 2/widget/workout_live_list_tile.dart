//created custom tile go down to see implementation of listview builder
import 'package:flutter/material.dart';

import 'workout_live_listview_ddbutton.dart';

class WorkoutLiveListTile extends StatelessWidget {
  final int serialNumber;
  final String exerciseName;
  final int sets;
  final int reps;
  final VoidCallback? onTap;

  const WorkoutLiveListTile({
    super.key,
    required this.serialNumber,
    required this.exerciseName,
    this.onTap,
    required this.sets,
    required this.reps,
  });

  @override
  Widget build(BuildContext context) {
    List<int> repList = [];
    for (var i = 1; i <= 20; i++) {
      repList.add(i);
    }
    return ListTile(
      onTap: onTap,
      minVerticalPadding: 0,
      visualDensity: VisualDensity.standard,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 17,
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$serialNumber",
                style: const TextStyle(
                  color: Color(0xFF0B4130),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Container(
            width: 100,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  exerciseName,
                  style: const TextStyle(
                    color: Color(0xFF0B4130),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          const MyDropDownButton(
            initialValue: 1,
            dropDownItems: [1, 2, 3, 4, 5, 6],
            width: 55,
          ),
          MyDropDownButton(
            initialValue: 1,
            dropDownItems: repList,
            width: 60,
          ),
          Container(
            width: 32,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: const Center(
                child: Icon(
              Icons.check,
              size: 13,
            )),
          ),
        ],
      ),
    );
  }
}

//list view builder
class WorkoutLiveListView extends StatelessWidget {
  final Map<int, String> data;

  const WorkoutLiveListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.antiAlias,
      itemCount: 25,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            WorkoutLiveListTile(
              exerciseName: "chest Press",
              reps: 13,
              sets: 4,
              serialNumber: 1,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const QuickStartPage2()),
                // );
                // startWorkoutPopUpBox(context);
              },
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
