import 'package:flutter/material.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/note.dart';
import 'package:hoplite/pages/start_workout_page/start_workout_page.dart';
import '../../data/userdata.dart';
import 'home page widgets/big_button.dart';
import 'home page widgets/bottom_nav.dart';
import 'home page widgets/cards.dart';
import 'home page widgets/dashboard_box.dart';
import 'home page widgets/profile_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              ProfileBar(
                  userName: USER_DETAILS["firstName"] ?? "",
                  subTitle: "Hop Lite"),
              //weekly dashboard
              WeeklyDashboard(chartData: chartData),
              note(
                  'higher bars correspond to longer durations of physical activity per day🔥 '),
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
}
