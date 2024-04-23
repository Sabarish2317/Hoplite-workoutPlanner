import 'package:intl/intl.dart';

import '../model/workout_model.dart';

//data to be shown in drop down list in sheets
List<int>? ddRepList = List.generate(50, (index) => index);
List<int>? ddSetList = List.generate(6, (index) => index);
List<int>? ddWeightList = [
  0,
  5,
  10,
  15,
  20,
  25,
  30,
  35,
  40,
  45,
  50,
  55,
  60,
  70,
  80,
  90,
  100,
  120,
  140,
  160,
  180
];
//local app data will be defaulted to this when restarted the app
List<History> appWorkoutHistory = [
  History("date", "22:30", "bros split", "chest day", {
    1: ["chest press", 20, 4, 120],
    2: ["chest press", 20, 4, 120],
    3: ["chest press", 20, 4, 120],
    4: ["chest press", 20, 4, 120],
    5: ["chest press", 20, 4, 120],
    6: ["chest press", 20, 4, 120],
  })
];

List<TemplateName> appTemplateNames = [];
