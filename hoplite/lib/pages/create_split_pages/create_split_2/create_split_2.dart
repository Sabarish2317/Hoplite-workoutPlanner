import 'package:flutter/material.dart';

import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/creat_split_list_view_heading.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/create_split_list_view.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/mycustom_stepper.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/note.dart';
import 'package:hoplite/pages/start_workout_page/start_workout_page.dart';

import '../../../global_widgets/h1_h2.dart';
import '../../quick_start_pages_template_start/quick start 1 widgets/h0_h2.dart';

class CreateSplit2 extends StatefulWidget {
  const CreateSplit2({super.key});

  @override
  State<CreateSplit2> createState() => _CreateSplit2State();
}

class _CreateSplit2State extends State<CreateSplit2> {
  int selectedIndex = 1;
  int count = 6;
  int itemCount = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
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
                      h1h2("Bros'S Split", "Chest"),
                      //using seperae column for different padding for heading and listview contents
                      const SizedBox(
                        height: 32,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Day Name',
                          style: TextStyle(
                            color: Color(0xFF0B4130),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.10,
                          ),
                        ),
                      ),
                      TextFormField(),
                      const SizedBox(
                        height: 32,
                      ),
                      createSplitListViewHeading(),
                      SizedBox(
                          height: 280,
                          child: CreateSplitListView(
                            data: const {},
                            itemCount: itemCount,
                          )),
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

                          //add button
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
                                selectedIndex += 1;
                                if (selectedIndex > count) {
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
