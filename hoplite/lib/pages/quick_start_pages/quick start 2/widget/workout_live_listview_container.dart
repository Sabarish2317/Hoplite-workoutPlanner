import 'package:flutter/material.dart';
import 'package:hoplite/global_widgets/button_small.dart';
import 'package:hoplite/pages/home_page/home_page.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%202/widget/list_view_headings.dart';
import 'package:hoplite/pages/quick_start_pages/quick%20start%202/widget/workout_live_list_tile.dart';
import '../../../../global_widgets/h1_h2.dart';

class LiveWorkoutListView extends StatefulWidget {
  const LiveWorkoutListView({super.key});

  @override
  State<LiveWorkoutListView> createState() => _LiveWorkoutListViewState();
}

class _LiveWorkoutListViewState extends State<LiveWorkoutListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x1927433A)),
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            h1h2("Bros'S Split", "Chest"),
            //using seperae column for different padding for heading and listview contents
            const SizedBox(
              height: 32,
            ),
            workoutLiveListViewHeading(),
            const SizedBox(height: 8),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WorkoutLiveListView(data: {}),
                  ],
                ),
              ),
            ),
            ButtonSmall(
              h2: "Completed",
              context: context,
              navigateTo: const HomePage(),
              snackBarText: "Saved to history",
            )
          ],
        ),
      ),
    );
  }
}
//custom snack bar widget 