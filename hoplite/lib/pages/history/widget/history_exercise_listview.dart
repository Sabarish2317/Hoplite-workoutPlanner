//creating a list tile
import 'package:flutter/material.dart';

//created custom tile go down to see implementation of listview builder
class HistoryExerciseListView extends StatelessWidget {
  final int serialNumber;
  final String exerciseName;
  final int reps;
  final int weight;
  final int sets;
  final VoidCallback? onTap;

  const HistoryExerciseListView({
    super.key,
    required this.serialNumber,
    required this.exerciseName,
    this.onTap,
    required this.reps,
    required this.weight,
    required this.sets,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        "$serialNumber",
        style: const TextStyle(
          color: Color(0xFF0B4130),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Center(
              child: Text(
                exerciseName,
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
            width: 50,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Center(
              child: Text(
                "${weight.floor()}",
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
            width: 50,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Center(
              child: Text(
                "$reps",
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
            width: 50,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Center(
              child: Text(
                "$sets",
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
        ],
      ),
    );
  }
}

class HistoryExerciseListViewLive extends StatelessWidget {
  final Map<int, List<dynamic>> modifiedExerciseList;

  const HistoryExerciseListViewLive(
      {super.key, required this.modifiedExerciseList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: modifiedExerciseList.length,
      itemBuilder: (context, index) {
        //       List<History> appWorkoutHistory = [
//   History("date", currentTime(), "bros split", "chest day", {
//     1: [20, 4, 120],
//     2: [20, 4, 120],
//     3: [20, 4, 120],
//     4: [20, 4, 120],
//     5: [20, 4, 120],
//     6: [20, 4, 120],
//   })
// ];
        int serialNumber = modifiedExerciseList.keys.elementAt(index);
        List<dynamic> keys = modifiedExerciseList.values.elementAt(index);
        String exerciseName = keys[0];
        int reps = keys[1];
        int sets = keys[2];
        int weight = keys[3];

        return Column(
          children: [
            HistoryExerciseListView(
              serialNumber: serialNumber,
              exerciseName: exerciseName,
              reps: reps,
              sets: sets,
              weight: weight,
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
