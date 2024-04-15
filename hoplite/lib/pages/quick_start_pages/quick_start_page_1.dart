import 'package:flutter/material.dart';
import 'package:hoplite/global_widgets/h1_h2.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%201%20widgets/h0_h2.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%201%20widgets/split_workout_listview.dart';

class QuickStartPage extends StatefulWidget {
  const QuickStartPage({super.key});

  @override
  State<QuickStartPage> createState() => _QuickStartPageState();
}

class _QuickStartPageState extends State<QuickStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //back button with title
              h0_h2("Workout", "Bro's", context),
              const SizedBox(
                height: 24,
              ),
              //container
              Center(
                child: Container(
                  width: double.infinity,
                  height: null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0x1927433A)),
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      h1h2("Workout", "Bro's Split"),
                      const SizedBox(
                        height: 16,
                      ),
                      const SplitDaysListView(
                        data: {
                          1: 'Chest',
                          2: 'Triceps',
                          3: 'Biceps',
                          4: 'Legs',
                          5: 'Shoulder',
                          6: 'Back',
                          // Add more entries as needed
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
