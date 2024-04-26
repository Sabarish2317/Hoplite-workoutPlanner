//created custom tile go down to see implementation of listview builder
import 'package:flutter/material.dart';
import '../../../../data/app_data.dart';
import '../../../../model/workout_model.dart';

class WorkoutLiveListTile extends StatefulWidget {
  final int? serialNumber;
  final String? exerciseName;
  final int? sets;
  final int? reps;
  final int? weight;
  final VoidCallback? onTap;
  final Map<int, WorkoutDetail>? exerciseData;

  final void Function(Map<int, WorkoutDetail>? modifiedData)?
      onExerciseDataChanged; // Callback function

  const WorkoutLiveListTile({
    super.key,
    required this.serialNumber,
    required this.exerciseName,
    this.onTap,
    required this.sets,
    required this.reps,
    this.weight,
    this.exerciseData,
    this.onExerciseDataChanged,
  });

  @override
  State<WorkoutLiveListTile> createState() => _WorkoutLiveListTileState();
}

class _WorkoutLiveListTileState extends State<WorkoutLiveListTile> {
  late var selectedRepValue = widget.reps;
  late var selectedSetValue = widget.sets;
  late var selectedWeightValue = widget.weight;
  late var modExerciseData = widget.exerciseData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
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
                "${widget.serialNumber}",
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
            clipBehavior: Clip.antiAlias,
            width: 150,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  overflow: TextOverflow.clip,
                  widget.exerciseName ?? "",
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
          //dd button
//dd rep button
          Container(
            width: 60,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: const BorderSide(
                  color: Color.fromARGB(
                      100, 158, 158, 158), // Add your border color here
                  width: 1, // Add your border width here
                ),
              ),
            ),
            child: DropdownButton<int>(
              borderRadius: BorderRadius.circular(9),
              dropdownColor: const Color.fromARGB(220, 255, 255, 255),
              value: selectedRepValue,
              onChanged: (int? newValue) {
                setState(() {
                  selectedRepValue = newValue;
                  modExerciseData?.values
                      .elementAt(widget.serialNumber! - 1)
                      .reps = newValue!;
                  // Check if exercise is not null before extracting data
                  widget.onExerciseDataChanged?.call(modExerciseData);
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
                color: Color.fromARGB(255, 11, 77, 56),
              ),
              iconSize: 24,
              elevation: 0,
              underline: Container(
                color: Colors.transparent,
              ),
              items: ddRepList!.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    '$value',
                    style: const TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

//ddd set button
          Container(
            width: 60,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: const BorderSide(
                  color: Color.fromARGB(
                      100, 158, 158, 158), // Add your border color here
                  width: 1, // Add your border width here
                ),
              ),
            ),
            child: DropdownButton<int>(
              borderRadius: BorderRadius.circular(9),
              dropdownColor: const Color.fromARGB(220, 255, 255, 255),
              value: selectedSetValue,
              onChanged: (int? newValue) {
                setState(() {
                  selectedSetValue = newValue;

                  modExerciseData?.values
                      .elementAt(widget.serialNumber! - 1)
                      .sets = newValue!;
                  // Check if exercise is not null before extracting data
                  widget.onExerciseDataChanged?.call(modExerciseData);
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
                color: Color.fromARGB(255, 11, 77, 56),
              ),
              iconSize: 24,
              elevation: 0,
              underline: Container(
                color: Colors.transparent,
              ),
              items: ddSetList!.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    '$value',
                    style: const TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
          //weight
//dd weight button
          ,
          Container(
            width: 70,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: const BorderSide(
                  color: Color.fromARGB(
                      100, 158, 158, 158), // Add your border color here
                  width: 1, // Add your border width here
                ),
              ),
            ),
            child: DropdownButton<int>(
              borderRadius: BorderRadius.circular(9),
              dropdownColor: const Color.fromARGB(220, 255, 255, 255),
              value: selectedWeightValue,
              onChanged: (int? newValue) {
                setState(() {
                  selectedWeightValue = newValue;

                  modExerciseData?.values
                      .elementAt(widget.serialNumber! - 1)
                      .weight = newValue!;
                  // Check if exercise is not null before extracting data
                  widget.onExerciseDataChanged?.call(modExerciseData);
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
                color: Color.fromARGB(255, 11, 77, 56),
              ),
              iconSize: 24,
              elevation: 0,
              underline: Container(
                color: Colors.transparent,
              ),
              items: ddWeightList!.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    '$value',
                    style: const TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Container(
          //   clipBehavior: Clip.antiAlias,
          //   width: 32,
          //   height: 30,
          //   padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
          //   decoration: ShapeDecoration(
          //     color: const Color(0xFFF2F2F2),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(6)),
          //   ),
          //   child: const Center(
          //       child: Icon(
          //     Icons.check,
          //     size: 13,
          //   )),
          // ),
        ],
      ),
    );
  }
}

//list view builder
class WorkoutLiveListView extends StatelessWidget {
  final void Function(Map<int, WorkoutDetail>? modifiedData)?
      onExerciseDataChanged; // Callback function
  final Map<int, WorkoutDetail> data;

  const WorkoutLiveListView({
    super.key,
    required this.data,
    this.onExerciseDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 450,
        child: ListView.builder(
          clipBehavior: Clip.antiAlias,
          itemCount: data.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            WorkoutDetail? exercise = data.values.elementAt(index);
            // Check if exercise is not null before extracting data
            String? exerciseName = exercise.name;
            int? reps = exercise.reps;
            int? sets = exercise.sets;
            int? serialNumber = index + 1; // Adjusting serial number
            int? weight = exercise.weight;
            return Column(
              children: [
                WorkoutLiveListTile(
                  onExerciseDataChanged: onExerciseDataChanged,
                  exerciseName: exerciseName,
                  reps: reps,
                  sets: sets,
                  exerciseData: data,
                  //s.no is also the index of the data +1
                  serialNumber: serialNumber,
                  weight: weight,
                  onTap: () {
                    // Add your onTap functionality here
                  },
                ),
                const Divider()
              ],
            );
          },
        ),
      ),
    );
  }
}
