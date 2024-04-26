import 'package:flutter/material.dart';
import 'package:hoplite/data/app_data.dart';
import 'package:hoplite/data/hive_history_local_data.dart';
import '../quick_start_pages_template_start/quick start 1 widgets/h0_h2.dart';
import 'widget/history_exercise_listview.dart';
import 'widget/history_listview_heading.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //back button with title
                h0_h2("History", "Your workout history", context),
                const SizedBox(
                  height: 24,
                ),
                //container
                Center(
                  child: MyExpTile(historydata: appWorkoutHistory),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyExpTile extends StatefulWidget {
  final List<History> historydata;

  const MyExpTile({
    super.key,
    required this.historydata,
  });

  @override
  State<MyExpTile> createState() => _MyExpTileState();
}

class _MyExpTileState extends State<MyExpTile> {
  @override
  Widget build(BuildContext context) {
    int? selected;
    return ListView.builder(
//       List<History> appWorkoutHistory = [
//   History("date", currentTime(), "bros split", "chest day", {
//     1: [20, 4, 120],
//     2: [20, 4, 120],
//     3: [20, 4, 120],
//     4: [20, 4, 120],
//     5: [20, 4, 120],
//     6: [20, 4, 120],
//   })
// ];

        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.historydata.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          //parsing the data
          //  WorkoutDetail? exercise = data.values.elementAt(index);
          History historyData = widget.historydata[index];
          String date = historyData.date;
          String time = historyData.time;
          String splitName = historyData.splitName;
          String dayName = historyData.dayName;
          Map<int, List<dynamic>> modifiedExerciseList =
              historyData.completedExerciseDetails;

          return Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border.fromBorderSide(
                        BorderSide(color: Color.fromARGB(28, 39, 67, 58))),
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                child: ListTileTheme(
                  contentPadding: const EdgeInsets.all(12),
                  dense: true,
                  horizontalTitleGap: 13,
                  minLeadingWidth: 0,
                  child: Theme(
                    data: ThemeData(
                      dividerColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      initiallyExpanded: (selected == index) ? true : false,
                      collapsedBackgroundColor:
                          const Color.fromARGB(0, 142, 140, 245),
                      collapsedIconColor: Colors.green,
                      iconColor: Colors.grey,
                      leading: Container(
                        width: 4.31,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Text(
                              date,
                              style: const TextStyle(
                                color: Color(0xFF069A6B),
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0.07,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              time,
                              style: const TextStyle(
                                color: Color(0xFF396457),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            splitName,
                            style: const TextStyle(
                              color: Color(0xFF396457),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                          const Icon(
                            size: 12,
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff242731),
                          ),
                          Text(
                            dayName,
                            style: const TextStyle(
                              color: Color(0xFF396457),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 321.01,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xCcB9B9C3),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                              child: Column(
                                children: [
                                  historyLiveListViewHeading(),
                                  HistoryExerciseListViewLive(
                                    modifiedExerciseList: modifiedExerciseList,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
