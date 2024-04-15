import 'package:flutter/material.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%201%20widgets/h0_h2.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%202/widget/workout_live_listview_container.dart';

class QuickStartPage2 extends StatefulWidget {
  const QuickStartPage2({super.key});

  @override
  State<QuickStartPage2> createState() => _QuickStartPage2State();
}

class _QuickStartPage2State extends State<QuickStartPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //header wiht back button
              h0_h2("Workout", "Bros Split Day-1", context),
              const SizedBox(height: 32),

              const Expanded(child: LiveWorkoutListView()),

              //white container bg
            ],
          ),
        ),
      ),
    );
  }
}
