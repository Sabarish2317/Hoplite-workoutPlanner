import 'package:flutter/material.dart';
import 'package:hoplite/pages/chatbot.dart';
import 'package:hoplite/pages/history_page.dart';

import '../../start_workout_page/start_workout_page.dart';
import '../home_page.dart'; // Import the home page

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  // Define the pages corresponding to each index
  final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const StartWorkoutPage(), // Assuming you have a StartWorkoutPage
    const ChatBotPage(),
  ];

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });

      // Navigate to the corresponding page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pages[index]),
      );
    }

    return SizedBox(
      height: 75,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        enableFeedback: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "lib/assets/exercise_pics/home_icon.png",
              width: 19,
              height: 19,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "lib/assets/exercise_pics/history_icon.png",
              width: 19,
              height: 19,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "lib/assets/exercise_pics/workout_icon.png",
              width: 19,
              height: 19,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "lib/assets/exercise_pics/chatbot_icon.png",
              width: 19,
              height: 19,
            ),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }
}
