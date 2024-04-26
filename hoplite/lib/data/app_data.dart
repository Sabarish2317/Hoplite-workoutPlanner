import 'package:hoplite/data/hive_history_local_data.dart';

import '../model/workout_model.dart';

//
//
// KEY FOR CHAT BOT
var apiKeys = "AIzaSyC0aZzTKgZS4Y5QpDNzY6JpMLmUY2BUuOY";
//
//
//data to be shown in drop down list in sheets
List<int>? ddRepList = List.generate(50, (index) => index);
List<int>? ddSetList = List.generate(6, (index) => index);
List<int>? ddWeightList = List.generate(220, (index) => index);
//
//
//local app data will be defaulted to this when restarted the app
//
//VARIABLE WHICH STORES HISTORY PAGE
List<History> appWorkoutHistory = [
  // History("date", "22:30", "bros split", "chest day", {
  //   1: ["chest press", 20, 4, 120],
  //   2: ["chest press", 20, 4, 120],
  //   3: ["chest press", 20, 4, 120],
  //   4: ["chest press", 20, 4, 120],
  //   5: ["chest press", 20, 4, 120],
  //   6: ["chest press", 20, 4, 120],
  // })
];
//
//
//VARIABLE WHICH STORE THE NEWLY CREATED WORKOUT SPLITS
List<TemplateName> appTemplateNames = [];
//
//
//WORKOUT DETAILS VARIABLE WHICH IS COMMON FOR NEW AND PRE DEFINED SPLITS IS IN WORKOUT_DATA_DART
//
//
//
//user details
//
//
//

