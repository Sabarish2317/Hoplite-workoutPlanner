//list of workouts
import 'package:hoplite/model/workout_model.dart';

List<WorkoutDetail> workoutDetails = [
  // Existing workouts
  WorkoutDetail(
      'Chest Press', 'Chest', 3, 10, 50, 'lib/assets/exercise_pics/ex (2).jpg'),
  WorkoutDetail('Dumbell-Curls', 'Biceps', 3, 12, 0,
      'lib/assets/exercise_pics/ex (4).jpeg'),
  WorkoutDetail(
      'Abdomen-Rolls', 'Abs', 3, 13, 0, 'lib/assets/exercise_pics/ex (3).jpeg'),
  WorkoutDetail('Forearm-Curls', 'ForeArm', 3, 10, 0,
      'lib/assets/exercise_pics/ex (5).jpeg'),
  WorkoutDetail(
      'Squats', 'Legs', 4, 8, 100, 'lib/assets/exercise_pics/ex (7).webp'),
  WorkoutDetail(
      'Push-ups', 'Back', 3, 8, 120, 'lib/assets/exercise_pics/ex (6).webp'),
  WorkoutDetail('Front Rises', 'Shoulder', 3, 12, 40,
      'lib/assets/exercise_pics/ex (4).jpg'),
  WorkoutDetail('Bench Dips', 'Triceps', 3, 10, 60,
      'lib/assets/exercise_pics/ex (4).webp'),
  WorkoutDetail('Face Pulls', 'Rear delts', 3, 0, 0,
      'lib/assets/exercise_pics/ex (11).jpeg'),
  WorkoutDetail('Lateral rises', 'Side Delt', 3, 0, 0,
      'lib/assets/exercise_pics/ex (8).jpg'),
  WorkoutDetail('St. cable Press', 'Shoulder', 4, 10, 160,
      'lib/assets/exercise_pics/exercisePic (9).jpeg'),
  WorkoutDetail('Skull Crusher', 'Triceps', 3, 12, 50,
      'lib/assets/exercise_pics/ex (1).webp'),
  WorkoutDetail('Goblet Squat', 'Quads', 3, 10, 45,
      'lib/assets/exercise_pics/ex (7).jpeg'),
  WorkoutDetail(
      'DB rows', 'Legs', 3, 12, 40, 'lib/assets/exercise_pics/ex (1).jpeg'),
  WorkoutDetail(
      'Seated rows', 'Back', 3, 10, 0, 'lib/assets/exercise_pics/ex (5).jpg'),
  WorkoutDetail(
      'Chest Flys', 'Chest', 3, 12, 25, 'lib/assets/exercise_pics/ex (3).jpg'),
  WorkoutDetail('Leg Extensions', 'Legs', 3, 12, 30,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
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
// chest Day
Map<int, WorkoutDetail> chestDay = {
  1: WorkoutDetail('Bench Press', 'Chest', 3, 10, 50,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Sb
  2: WorkoutDetail('Push-ups', 'Chest', 3, 13, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  3: WorkoutDetail('Dumbbell Press', 'Chest', 3, 12, 40,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  4: WorkoutDetail('Chest Flys', 'Chest', 3, 12, 25,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  5: WorkoutDetail('Incline Bench Press', 'Chest', 3, 10, 45,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Lunges
};
// Leg Day
Map<int, WorkoutDetail> tricepDay = {
  1: WorkoutDetail('Barbell Rows', 'Back', 3, 10, 60,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Squats
  2: WorkoutDetail('Dips', 'Chest', 3, 0, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Leg Press
  3: WorkoutDetail('Standing Calf Raises', 'Calves', 3, 15, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Hamstring Curls
  4: WorkoutDetail('Hanging Windshield Wipers', 'Abs', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Leg Extensions
};
// Leg Day
Map<int, WorkoutDetail> bicepsDay = {
  1: WorkoutDetail('Bicep curls', 'Biceps', 3, 16, 10,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Squats
  2: WorkoutDetail('Inc. DB curls', 'Biceps', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Leg Press
  3: WorkoutDetail('Hanging Windshield Wipers', 'Abs', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Hamstring Curls
  4: WorkoutDetail('Dec. Db curls', 'Abs', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  5: WorkoutDetail('Cable curls', 'Abs', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
};
// Leg Day
Map<int, WorkoutDetail> shoulderDay = {
  1: WorkoutDetail('Dumbell press', 'Biceps', 3, 16, 10,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  2: WorkoutDetail('Lat rises', 'Biceps', 3, 16, 10,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  3: WorkoutDetail('Face pulls', 'Biceps', 3, 16, 10,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  4: WorkoutDetail('Rear delt pulls', 'Biceps', 3, 16, 10,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  5: WorkoutDetail('Arnold press', 'Biceps', 3, 16, 10,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
};

//list of day name with dayvariable to pass and give it an index number
List<DayName> dayNames = [
  DayName('Chest Day', chestDay),
  DayName('back day', backDay),
  DayName('Bice Day', bicepsDay),
  DayName('Shoulder Day', shoulderDay),
  DayName('Triceps Day', tricepDay),
  DayName('Leg day', legDay),
  // Add more DayNames here...
];

//giving index for each day in a split
Map<int, DayName> brosSplitDays = {
  0: dayNames[0], // chest_day
  1: dayNames[1],
  2: dayNames[2],
  3: dayNames[3],
  4: dayNames[4],
  5: dayNames[5]
};

//list of templates containing many splits
List<TemplateName> templateNames = [
  TemplateName('Bro\'s', brosSplitDays),

  TemplateName('Full Body', brosSplitDays),
  //direct data for visualitionnnn

  // Add more TemplateNames
];
