import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoplite/data/workoutdata.dart';

import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/creat_split_list_view_heading.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/create_split_list_view.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/mycustom_stepper.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/note.dart';
import 'package:hoplite/pages/start_workout_page/start_workout_page.dart';

import '../../../data/appData.dart';
import '../../../global_widgets/h1_h2.dart';
import '../../../model/workout_model.dart';
import '../../quick_start_pages_template_start/quick start 1 widgets/h0_h2.dart';

class CreateSplit2 extends StatefulWidget {
  final String splitNameCont;
  final int perWeekCont;
  const CreateSplit2({
    super.key,
    required this.splitNameCont,
    required this.perWeekCont,
  });

  @override
  State<CreateSplit2> createState() => _CreateSplit2State();
}

class _CreateSplit2State extends State<CreateSplit2> {
  //controller
  TextEditingController dayNameCT = TextEditingController();
  //for day 1 day 2 widget
  int selectedIndex = 1;
  //getting the paramfrom previous page and using it to set the cound of no. od days in day 1 2
  late int count = widget.perWeekCont;
  //total item count of dd button
  int itemCount = 3;
  //list to have all the day name
  List<String> dayNameList = [];
  List<DayName> dayName = [];
  Map<int, DayName> splitDay = {};

  Map<int, DayName> splitDays = {};
  late TemplateName valueHolder = TemplateName(widget.splitNameCont, splitDays);

  List<Map<int, String>> selectedValues =
      []; // Store selected values from drop down

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Your existing code...
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h0_h2("Create Split", "Create your own", context),
              //padding

              //padding

              Container(
                height: 55,
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0x1927433A)),
                      borderRadius: BorderRadius.circular(18),
                    )),
                child: Center(
                  child: MyCustomStepper(
                      selectedIndex: selectedIndex, count: count),
                ),
              ),

              //main container

              Container(
                width: double.infinity,
                height: null,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0x1927433A)),
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      h1h2("${widget.splitNameCont} Split", ""),
                      //using seperae column for different padding for heading and listview contents
                      const SizedBox(
                        height: 32,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter Day Name',
                          style: TextStyle(
                            color: Color(0xFF0B4130),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.10,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: dayNameCT,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      createSplitListViewHeading(),
                      SizedBox(
                        height: 280,
                        child: CreateSplitListView(
                          itemCount: itemCount,
                          onDropDownChanged: (index, value) {
                            // Handle the selected values here
                            setState(() {
                              selectedValues.add({index: value});
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                  side: MaterialStatePropertyAll(BorderSide(
                                      color: Color.fromARGB(50, 39, 67, 58))),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color(0xff5AF5C4),
                                  ),
                                  elevation: MaterialStatePropertyAll(0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (itemCount < 16) {
                                      itemCount += 1;
                                    } else if (itemCount == 16) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('List is full')));
                                    }
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xff242731),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                style: const ButtonStyle(
                                  side: MaterialStatePropertyAll(BorderSide(
                                      color: Color.fromARGB(50, 39, 67, 58))),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color(0xff5AF5C4),
                                  ),
                                  elevation: MaterialStatePropertyAll(0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (itemCount > 2) {
                                      itemCount -= 1;
                                    }
                                  });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  child: Icon(
                                    Icons.delete,
                                    color: Color(0xff242731),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //next
                          ElevatedButton(
                            style: const ButtonStyle(
                              side: MaterialStatePropertyAll(BorderSide(
                                  color: Color.fromARGB(50, 39, 67, 58))),
                              backgroundColor: MaterialStatePropertyAll(
                                Color(0xff5AF5C4),
                              ),
                              elevation: MaterialStatePropertyAll(0),
                            ),
                            onPressed: () {
                              selectedIndex += 1;

                              setState(() {
                                dayNameList.add(dayNameCT.text);
                                dayNameCT.clear();

                                //dont touch its working after clicking confitrm
                                //breakpoint
                                if (selectedIndex > count) {
                                  //looping over selected values from the dd button
                                  //iterating over the list
                                  int countbb = 0;

                                  Map<int, WorkoutDetail> temp1 = {};
                                  Map<int, WorkoutDetail> temp2 = {};
                                  Map<int, WorkoutDetail> temp3 = {};
                                  Map<int, WorkoutDetail> temp4 = {};
                                  Map<int, WorkoutDetail> temp5 = {};
                                  Map<int, WorkoutDetail> temp6 = {};

                                  List<Map<int, WorkoutDetail>> workoutName = [
                                    temp1,
                                    temp2,
                                    temp3,
                                    temp4,
                                    temp5,
                                    temp6
                                  ];

                                  for (int i = 0;
                                      i < selectedValues.length;
                                      i++) {
                                    int key = selectedValues[i].keys.first;
                                    String value =
                                        selectedValues[i].values.first;

                                    WorkoutDetail workoutDetail = WorkoutDetail(
                                      value,
                                      "",
                                      1,
                                      0,
                                      0,
                                      "lib/assets/exercise_pics/exercisePic (8).jpeg",
                                    );
                                    if (key == 1) {
                                      countbb++;
                                    }

                                    switch (countbb) {
                                      case 1:
                                        temp1[i] = workoutDetail;
                                        break;
                                      case 2:
                                        temp2[i] = workoutDetail;
                                        break;
                                      case 3:
                                        temp3[i] = workoutDetail;
                                        break;
                                      case 4:
                                        temp4[i] = workoutDetail;
                                        break;
                                      case 5:
                                        temp5[i] = workoutDetail;
                                        break;
                                      case 6:
                                        temp6[i] = workoutDetail;
                                        break;
                                      default:
                                        // Handle unexpected key values
                                        break;
                                    }
                                  }

                                  //got the workout list now we need to store it in dayyName class with the names we got fro controller
                                  for (int i = 0; i < count; i++) {
                                    DayName day =
                                        DayName(dayNameList[i], workoutName[i]);
                                    // Add the DayName object to the dayName list
                                    dayName.add(day);
                                  }
                                  for (int i = 0; i < dayName.length; i++) {
                                    splitDays.addAll({i: dayName[i]});
                                  }
                                  //
                                  //
                                  //
                                  appTemplateNames.add(valueHolder);

                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const StartWorkoutPage()),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Created Split Successfully')));

                                  // Assuming you have a list of TemplateName objects named templateNames

// Print each TemplateName instance in the list
                                  appTemplateNames.forEach((template) {
                                    print('TemplateName: ${template.name}');
                                    print('Contents:');
                                    template.dayList.forEach((index, dayName) {
                                      print('  Day $index: ${dayName.dayName}');
                                      dayName.workoutList
                                          .forEach((index, workoutDetail) {
                                        print(
                                            '    Workout $index: ${workoutDetail.name}');
                                        // Print other properties of workoutDetail as needed
                                      });
                                    });
                                  });
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              child: Text(
                                (selectedIndex == count) ? 'Save' : 'Next',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF242731),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              note("You can add the sets and reps during the workout")
            ],
          ),
        ),
      ),
    );
  }
}
