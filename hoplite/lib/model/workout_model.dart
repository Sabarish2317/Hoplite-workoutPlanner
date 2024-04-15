// default_workout_templates : {
//   bros_split : {
//     1:{
//       day_name : “chest_day” , workout_list : {
//         1: {
//           name: “bench Press”, target_muscle : ”chest”, img_path : “lib/assets/bench_press.png”, sets : 4 , reps : 13 , weight : 140
//           }
//         }
//       },
//     2{},
//     3{}
//   },
// full_body : {},
// }

// ignore_for_file: avoid_print

//workout list
class WorkoutDetail {
  final String name;
  final String targetMuscle;
  final int sets;
  final int reps;
  final int weight;
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

class TemplateName {
  final String name;
  final Map<int, DayName> dayList;

  TemplateName(this.name, this.dayList);
}

//testing
void main() {
  //list of workouts
  List<WorkoutDetail> workoutDetails = [
    WorkoutDetail(
        'Bench Press', 'Chest', 3, 10, 50, 'lib/assets/bench_press.png'),
    WorkoutDetail('Pull-ups', 'Back', 3, 12, 0, 'lib/assets/pull_ups.png'),
    WorkoutDetail('Push-ups', 'Chest', 3, 13, 0, 'lib/assets/push_ups.png'),
    WorkoutDetail(
        'Cable Pull-ups', 'Back', 3, 10, 0, 'lib/assets/cable_pullups.png'),
    WorkoutDetail('Squats', 'Legs', 4, 8, 100, 'lib/assets/squats.png'),
    WorkoutDetail('Deadlifts', 'Back', 3, 8, 120, 'lib/assets/deadlifts.png'),
    WorkoutDetail(
        'Dumbbell Press', 'Chest', 3, 12, 40, 'lib/assets/dumbbell_press.png'),
    WorkoutDetail(
        'Barbell Rows', 'Back', 3, 10, 60, 'lib/assets/barbell_rows.png'),
    WorkoutDetail('Dips', 'Chest', 3, 10, 0, 'lib/assets/dips.png'),
    WorkoutDetail('Leg Press', 'Legs', 4, 10, 150, 'lib/assets/leg_press.png'),
    WorkoutDetail(
        'Lat Pulldowns', 'Back', 3, 12, 50, 'lib/assets/lat_pulldowns.png'),
    WorkoutDetail('Incline Bench Press', 'Chest', 3, 10, 45,
        'lib/assets/incline_bench_press.png'),
    WorkoutDetail(
        'Hamstring Curls', 'Legs', 3, 12, 40, 'lib/assets/hamstring_curls.png'),
    WorkoutDetail('Pull-up Variations', 'Back', 3, 10, 0,
        'lib/assets/pullup_variations.png'),
    WorkoutDetail(
        'Chest Flys', 'Chest', 3, 12, 25, 'lib/assets/chest_flys.png'),
    WorkoutDetail(
        'Leg Extensions', 'Legs', 3, 12, 30, 'lib/assets/leg_extensions.png'),
    WorkoutDetail('Seated Cable Rows', 'Back', 3, 10, 55,
        'lib/assets/seated_cable_rows.png'),
    WorkoutDetail('Shoulder Press', 'Shoulders', 3, 10, 40,
        'lib/assets/shoulder_press.png'),
    WorkoutDetail('Lunges', 'Legs', 3, 10, 0, 'lib/assets/lunges.png'),
  ];

  //list of workouts to be performed on a day
  // Back Day
  Map<int, WorkoutDetail> backDay = {
    1: workoutDetails[1], // Pull-ups
    2: workoutDetails[3], // Cable Pull-ups
    3: workoutDetails[5], // Deadlifts
    4: workoutDetails[7], // Barbell Rows
    5: workoutDetails[10], // Lat Pulldowns
    6: workoutDetails[16], // Seated Cable Rows
  };

// Leg Day
  Map<int, WorkoutDetail> legDay = {
    1: workoutDetails[4], // Squats
    2: workoutDetails[9], // Leg Press
    3: workoutDetails[11], // Hamstring Curls
    4: workoutDetails[15], // Leg Extensions
    5: workoutDetails[12], // Lunges
    6: workoutDetails[14], // Other leg exercise
  };

//list of day name with dayvariable to pass and give it an index number
  List<DayName> dayNames = [
    DayName('back day', backDay),
    DayName('leg day', legDay),
    // Add more DayNames here...
  ];

//giving index for each day in a split
  Map<int, DayName> brosSplitDays = {
    0: dayNames[0], // chest_day
    1: dayNames[1]
  };

//list of templates containing many splits
  List<TemplateName> templateNames = [
    TemplateName('bros_split', brosSplitDays),
    // Add more TemplateNames
  ];

  //printing all the templates for start workout page
  void getAllSplits() {
    for (var i = 0; i < templateNames.length; i++) {
      print("${i + 1} : ${templateNames[i].name}");
    }
  }

  //printing all the days in a given split
  void getAllDayinSplit(String splitName) {
    final template = templateNames.firstWhere(
        (template) => template.name == splitName,
        orElse: () => TemplateName('null or wrong', {}));
    print("Days in $splitName:");
    template.dayList.forEach((index, dayName) {
      print("  Day $index: ${dayName.dayName}");
    });
  }

  void getAllExerciseinSplitDay(int splitDay) {
    print("split: ${templateNames[splitDay].name}");
    final day = dayNames[splitDay];
    print("Exercises in ${day.dayName}:");
    day.workoutList.forEach((index, workoutDetail) {
      print(
          "  Exercise $index: ${workoutDetail.name} : ${workoutDetail.weight} : ${workoutDetail.reps} : ${workoutDetail.sets}}");
    });
  }

  getAllSplits();
  getAllDayinSplit("bros_split");
  getAllExerciseinSplitDay(0);
}
