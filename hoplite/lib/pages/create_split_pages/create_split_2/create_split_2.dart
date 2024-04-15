import 'package:flutter/material.dart';

import 'package:hoplite/pages/create_split_pages/create_split_1/widgets/stepper.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/creat_split_list_view_heading.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/create_split_list_view.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/mycustom_stepper.dart';
import 'package:hoplite/pages/start_workout_page/start_workout_page.dart';

import '../../../global_widgets/h1_h2.dart';
import '../../quick_start_pages/quick start 1 widgets/h0_h2.dart';

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
              const SizedBox(
                height: 24,
              ),
              const MySmallStepper(nth: 2),
              //padding
              const SizedBox(
                height: 24,
              ),
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
                      borderRadius: BorderRadius.circular(8),
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
                      createSplitListViewHeading(),
                      SizedBox(
                          height: 280,
                          child: CreateSplitListView(
                            data: {},
                            itemCount: itemCount,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                itemCount += 1;
                              });
                            },
                            child: const Text(
                              'Add Row',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF242731),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex += 1;
                                if (selectedIndex > count) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const StartWorkoutPage(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Created Split Successfully')));
                                }
                              });
                            },
                            child: Text(
                              (selectedIndex == count) ? 'Save' : 'Next',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF242731),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
