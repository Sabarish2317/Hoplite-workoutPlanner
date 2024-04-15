//created custom tile go down to see implementation of listview builder
import 'package:flutter/material.dart';
import 'package:hoplite/pages/create_split_pages/create_split_2/widgets/dd_button_for%20_str_exercise.dart';

class CreateSplitListTile extends StatelessWidget {
  final int serialNumber;

  final VoidCallback? onTap;

  const CreateSplitListTile({
    super.key,
    required this.serialNumber,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minVerticalPadding: 0,
      visualDensity: VisualDensity.standard,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 17,
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$serialNumber",
                style: const TextStyle(
                  color: Color(0xFF0B4130),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Container(
              width: 150,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: ShapeDecoration(
                color: const Color(0xFFF2F2F2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: const MyExerciseDropDownButton(
                  initialValue: "Chest",
                  width: 150,
                  dropDownItems: ["Chest", "Back"])),
        ],
      ),
    );
  }
}

//list view builder
class CreateSplitListView extends StatelessWidget {
  final Map<int, String> data;
  final int itemCount;

  const CreateSplitListView(
      {super.key, required this.data, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        clipBehavior: Clip.antiAlias,
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CreateSplitListTile(
                serialNumber: 2,
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const QuickStartPage2()),
                  // );
                  // startWorkoutPopUpBox(context);
                },
              ),
              const Divider()
            ],
          );
        },
      ),
    );
  }
}
