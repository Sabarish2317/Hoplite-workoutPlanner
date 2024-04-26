import 'package:flutter/material.dart';
import 'package:hoplite/data/hive_history_local_data.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/note.dart';
import 'package:hoplite/pages/start_workout_page/start_workout_page.dart';
import 'package:hoplite/pages/welcome%20page/welcom_page.dart';
import '../../data/app_data.dart';
import '../../data/userdata.dart';
import 'home page widgets/big_button.dart';
import 'home page widgets/bottom_nav.dart';
import 'home page widgets/cards.dart';
import 'home page widgets/dashboard_box.dart';
import 'home page widgets/profile_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String> userName;

  @override
  void initState() {
    super.initState();
    // Initialize the future in initState
    userName = UserDetails().getUserDetails();
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //user name and profile avatar

              FutureBuilder<String>(
                future: userName,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.data != null) {
                    String userName = snapshot.data ?? 'Unknown';
                    return ProfileBar(
                        userName: userName, subTitle: "Start workout");
                  }
                  // Check if the username exists

                  return const ProfileBar(
                      userName: "", subTitle: "Start workout");
                },
              ),
              //weekly dashboard
              WeeklyDashboard(chartData: chartData),
              InkWell(
                onDoubleTap: () {
                  UserDetails().deleteUserDetails();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ),
                  );
                },
                onLongPress: () {
                  showApiBox(context);
                },
                child: note(
                    'higher bars correspond to longer durations of physical activity per day🔥 '),
              ),
              //body stats
              StatusCards(
                cardsData: cardsData,
                updateCardData: (String type, int value) {
                  setState(() {
                    cardsData[type.toLowerCase()] = value;
                  });
                },
              ),
              //start workout button
              const ButtonLarge(
                headerrtext: "START WORKOUT",
                subtext: 'Monday',
                navigateTo: StartWorkoutPage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showApiBox(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Api Key'),
          content: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(hintText: 'Enter the key'),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  apiKeys = textEditingController.text;
                });
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}




          // Check if the username exists
          
        