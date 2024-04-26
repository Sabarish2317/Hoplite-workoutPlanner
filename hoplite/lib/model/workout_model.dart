//workout list

//details of workout
class WorkoutDetail {
  final String name;
  final String targetMuscle;
  late int sets;
  late int reps;
  late int weight;
  final String imgPath;

  WorkoutDetail(this.name, this.targetMuscle, this.sets, this.reps, this.weight,
      this.imgPath);
}

//contains list of workouts
class DayName {
  final String dayName;
  final Map<int, WorkoutDetail> workoutList;

  DayName(this.dayName, this.workoutList);
}

//split name eg bros split and its days
class TemplateName {
  final String name;
  final Map<int, DayName> dayList;

  TemplateName(this.name, this.dayList);
}

class HistoryModel {
  final String date;
  final String time;
  final String splitName;
  final String dayName;
  final Map<int, List<dynamic>> completedExerciseDetails;

  HistoryModel(this.date, this.time, this.splitName, this.dayName,
      this.completedExerciseDetails);
}






//testing
// void main() {
//   //printing all the templates for start workout page
//   void getAllSplits() {
//     for (var i = 0; i < templateNames.length; i++) {
//       print("${i + 1} : ${templateNames[i].name}");
//     }
//   }

//   //printing all the days in a given split
//   void getAllDayinSplit(String splitName) {
//     final template = templateNames.firstWhere(
//         (template) => template.name == splitName,
//         orElse: () => TemplateName('null or wrong', {}));
//     print("Days in $splitName:");
//     template.dayList.forEach((index, dayName) {
//       print("  Day $index: ${dayName.dayName}");
//     });
//   }

//   void getAllExerciseinSplitDay(int splitDay) {
//     print("split: ${templateNames[splitDay].name}");
//     final day = dayNames[splitDay];
//     print("Exercises in ${day.dayName}:");
//     day.workoutList.forEach((index, workoutDetail) {
//       print(
//           "  Exercise $index: ${workoutDetail.name} : ${workoutDetail.weight} : ${workoutDetail.reps} : ${workoutDetail.sets}}");
//     });
//   }

//   getAllSplits();
//   getAllDayinSplit("bros_split");
//   getAllExerciseinSplitDay(0);
// }
