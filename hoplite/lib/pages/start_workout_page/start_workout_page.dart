// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hoplite/data/workoutdata.dart';
import 'package:hoplite/global_widgets/h1_h2.dart';
import 'package:hoplite/pages/create_split_pages/create_split_1/create_split1.dart';
import 'package:hoplite/pages/home_page/home%20page%20widgets/big_button.dart';
import 'package:hoplite/pages/start_workout_page/widgets/workout_cards.dart';
import '../../data/userdata.dart';
import '../../model/workout_model.dart';
import '../home_page/home page widgets/profile_bar.dart';

class StartWorkoutPage extends StatefulWidget {
  const StartWorkoutPage({super.key});

  @override
  State<StartWorkoutPage> createState() => _StartWorkoutPageState();
}

//created a instance so it dosnet get rebuilded when using delete function implement into box later
final List<TemplateName> templateNameInstance = templateNames;

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
              ProfileBar(
                  userName: USER_DETAILS["firstName"],
                  subTitle: "Start workout"),
              h1h2("Quick Start", "Preset Workouts"),
              WorkoutCardsListView(templateName: templateNameInstance),
              h1h2("Templates", "My templates"),
              WorkoutCardsListView(templateName: templateNameInstance),
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

//list view to show in cards
class WorkoutCardsListView extends StatelessWidget {
  final List<TemplateName> templateName;

  const WorkoutCardsListView({
    super.key,
    required this.templateName,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1.5),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: templateName.length,
      itemBuilder: (context, index) {
        //looping over the top class template name to get the instances of classes on by one
        TemplateName singleTemplate = templateName[index];
        //accessing the instance of the current class to get the name of the template eg:bros split
        String singleTemplateName = singleTemplate.name;
        //parsing the instance again to acces the 2nd object dayList which contains the different workout days eg.chest,legs
        Map<int, DayName> dayListReference = singleTemplate.dayList;

        return SizedBox(
          height: 81,
          width: 163,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WorkoutCard(
                h1: singleTemplateName,

                //used to delete
                index: index,
                dayList: dayListReference,
              ),
            ],
          ),
        );
      },
    );
  }
}
