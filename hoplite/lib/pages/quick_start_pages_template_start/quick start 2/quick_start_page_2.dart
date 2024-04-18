import 'package:flutter/material.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%201%20widgets/h0_h2.dart';
import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%202/widget/workout_live_listview_container.dart';

import '../../../model/workout_model.dart';

class QuickStartPage2 extends StatefulWidget {
  final String templateName;
  final String dayName;
  final Map<int, WorkoutDetail> exerciseList;

  const QuickStartPage2(
      {super.key,
      required this.templateName,
      required this.dayName,
      required this.exerciseList});

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
              h0_h2("Workout", "${widget.templateName} Split ${widget.dayName}",
                  context),
              const SizedBox(height: 32),

              Expanded(
                  child: LiveWorkoutListView(
                      templateName: widget.templateName,
                      dayName: widget.dayName,
                      exerciseList: widget.exerciseList)),

              //white container bg
            ],
          ),
        ),
      ),
    );
  }
}
