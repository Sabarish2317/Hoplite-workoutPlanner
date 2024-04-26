//Local hive storage for storing workout history
// ignore_for_file: avoid_print

import 'package:hive/hive.dart';

// Step 1: Define the History class
class History {
  final String date;
  final String time;
  final String splitName;
  final String dayName;
  final Map<int, List<dynamic>> completedExerciseDetails;

  History(
    this.date,
    this.time,
    this.splitName,
    this.dayName,
    this.completedExerciseDetails,
  );
}

// Step 2: Register the adapter for the History class
class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 0; // Unique type ID for History

  @override
  History read(BinaryReader reader) {
    return History(
      reader.readString(),
      reader.readString(),
      reader.readString(),
      reader.readString(),
      // Convert the dynamic map to the expected type Map<int, List<dynamic>>
      (reader.readMap()).map<int, List<dynamic>>(
        (key, value) => MapEntry(
          key as int, // Ensure the key is of type int
          value as List<dynamic>, // Ensure the value is a list of dynamics
        ),
      ),
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer.writeString(obj.date);
    writer.writeString(obj.time);
    writer.writeString(obj.splitName);
    writer.writeString(obj.dayName);
    writer.writeMap(obj.completedExerciseDetails);
  }
}

//save a history to the list of history in a box
void saveHistory(History history) async {
  final historyBox = await Hive.openBox('appWorkoutHistory');
  List? existingHistories = historyBox.get('histories', defaultValue: []);

  // Convert the History object to JSON before saving
  existingHistories!.add(history);

  // Save the updated list to the box
  await historyBox.put('histories', existingHistories);
  historyBox.close();
}

Future<List<History>?> getHistory() async {
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
  final historyBox = await Hive.openBox('appWorkoutHistory');
  Future<List<History>?> historyJsonList =
      historyBox.get('histories', defaultValue: appWorkoutHistory);
  for (History history in appWorkoutHistory) {
    print(history.date);
    print(history.time);
    print(history.splitName);
    print(history.dayName);
    print(history.completedExerciseDetails);
  }
  historyBox.close();
  return historyJsonList;
}

class UserDetails {
  void deleteUserDetails() async {
    final userBox = await Hive.openBox("userBox");
    await userBox.clear();
    userBox.close();
  }

  void putUserDetails(String firstName) async {
    final userBox = await Hive.openBox("userBox");
    await userBox.put("USER_NAME", firstName);
    userBox.close();
  }

  Future<String> getUserDetails() async {
    final userBox = await Hive.openBox("userBox");
    String name = await userBox.get("USER_NAME");
    userBox.close();
    return name;
  }
}
