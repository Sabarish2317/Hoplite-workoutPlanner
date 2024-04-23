//creating a list tile
import 'package:flutter/material.dart';
import 'package:hoplite/model/workout_model.dart';

//created custom tile go down to see implementation of listview builder
class CustomListTile2 extends StatelessWidget {
  final int serialNumber;
  final String exerciseName;
  final VoidCallback? onTap;

  const CustomListTile2({
    super.key,
    required this.serialNumber,
    required this.exerciseName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                overflow: TextOverflow.ellipsis,
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
        ],
      ),
    );
  }
}

class DaysWorkoutListView extends StatelessWidget {
  //int , exercise list
  final Map<int, WorkoutDetail> workoutList;

  const DaysWorkoutListView({super.key, required this.workoutList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: workoutList.length,
      itemBuilder: (context, index) {
        //iterating over this
        int serialNumber = index + 1;
        //getting the value to parse it
        WorkoutDetail exercise = workoutList.values.elementAt(index);
//parsing it
        String exerciseName = exercise.name;
        //not workoutdetail itself doesnt contain the details of the workout rather it contains the indexs of the workoutdetail list

        return Column(
          children: [
            CustomListTile2(
              serialNumber: serialNumber,
              exerciseName: exerciseName,
              onTap: () {},
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
