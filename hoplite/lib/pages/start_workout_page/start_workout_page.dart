// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hoplite/global_widgets/h1_h2.dart';
import 'package:hoplite/pages/create_split_pages/create_split_1/create_split1.dart';
import 'package:hoplite/pages/home_page/home%20page%20widgets/big_button.dart';
import 'package:hoplite/pages/start_workout_page/widgets/workout_cards.dart';

import '../../data/data.dart';
import '../home_page/home page widgets/profile_bar.dart';
import '../quick_start_pages/quick_start_page_1.dart';

class StartWorkoutPage extends StatefulWidget {
  const StartWorkoutPage({super.key});

  @override
  State<StartWorkoutPage> createState() => _StartWorkoutPageState();
}

class _StartWorkoutPageState extends State<StartWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //user name and profile avatar
              ProfileBar(userName: userData["Name"], subTitle: "Start workout"),
              h1h2("Quick Start", "Preset Workouts"),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                ],
              ),
              h1h2("Templates", "My templates"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                  WorkoutCard(
                    h1: "Bro'S",
                    navigateTo: QuickStartPage(),
                  ),
                ],
              ),
              ButtonLarge(
                headerrtext: "CREATE SPLIT",
                subtext: "Splits",
                navigateTo: CreateSplit(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
