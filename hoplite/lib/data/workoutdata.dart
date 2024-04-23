//list of workouts
import 'package:hoplite/model/workout_model.dart';

List<WorkoutDetail> workoutDetails = [
  WorkoutDetail('Bench Press', 'Chest', 3, 10, 50,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Pull-ups', 'Back', 3, 12, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Push-ups', 'Chest', 3, 13, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Cable Pull-ups', 'Back', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Squats', 'Legs', 4, 8, 100,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Deadlifts', 'Back', 3, 8, 120,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Dumbbell Press', 'Chest', 3, 12, 40,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Barbell Rows', 'Back', 3, 10, 60,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Dips', 'Chest', 3, 0, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Leg Press', 'Legs', 4, 10, 160,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Lat Pulldowns', 'Back', 3, 12, 50,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Incline Bench Press', 'Chest', 3, 10, 45,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Hamstring Curls', 'Legs', 3, 12, 40,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Pull-up Variations', 'Back', 3, 10, 0,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Chest Flys', 'Chest', 3, 12, 25,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Leg Extensions', 'Legs', 3, 12, 30,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Seated Cable Rows', 'Back', 3, 10, 55,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Shoulder Press', 'Shoulders', 3, 10, 40,
      'lib/assets/exercise_pics/exercisePic (8).jpeg'),
  WorkoutDetail('Lunges', 'Legs', 3, 10, 0,
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
  TemplateName('Bro\'s', brosSplitDays),
  TemplateName('PPL', brosSplitDays),
  TemplateName('Full Body', brosSplitDays),
  //direct data for visualitionnnn
  TemplateName('Arnold', {
    0: DayName('back day', {
      1: WorkoutDetail('Deadlifts', 'Back', 3, 8, 120,
          'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Pull-ups
      2: WorkoutDetail('Squats', 'Legs', 4, 8, 100,
          'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Cable Pull-ups
      3: WorkoutDetail('Cable Pull-ups', 'Back', 3, 10, 0,
          'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Deadlifts
      4: WorkoutDetail('Push-ups', 'Chest', 3, 13, 0,
          'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Barbell Rows
      5: WorkoutDetail('Pull-ups', 'Back', 3, 12, 0,
          'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Lat Pulldowns
      6: WorkoutDetail('Bench Press', 'Chest', 3, 10, 50,
          'lib/assets/exercise_pics/exercisePic (8).jpeg'), // Seated Cable Rows
    }), // chest_day
    1: DayName('leg day', {
      1: workoutDetails[4], // Squats
      2: workoutDetails[9], // Leg Press
      3: workoutDetails[11], // Hamstring Curls
      4: workoutDetails[15], // Leg Extensions
      5: workoutDetails[12], // Lunges
      6: workoutDetails[14], // Other leg exercise
    }),
  }),
  // Add more TemplateNames
];
