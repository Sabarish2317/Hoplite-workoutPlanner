//creating a list tile
import 'package:flutter/material.dart';

import '../../../model/workout_model.dart';
import 'start_workout_popup.dart';

//created custom tile go down to see implementation of listview builder
class CustomListTile extends StatelessWidget {
  final int serialNumber;
  final String dayName;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.serialNumber,
    required this.dayName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        "$serialNumber",
        style: const TextStyle(
          color: Color(0xFF0B4130),
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Center(
              child: Text(
                dayName,
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
            width: 25,
            height: 27,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: const Center(
                child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 13,
            )),
          ),
        ],
      ),
    );
  }
}

class SplitDaysListView extends StatelessWidget {
  //contains index and instance to the day name class
  final Map<int, DayName> dayListReference;
  final String templateName;
  const SplitDaysListView({
    super.key,
    required this.dayListReference,
    required this.templateName,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dayListReference.length,
      itemBuilder: (context, index) {
        // Check if the index is within bounds
        if (index >= 0 && index < dayListReference.length) {
          //parsing serial numberss as keys from the map and iterating over it
          int serialNumber = index + 1;
          //creating instance of the class for the loop which
          DayName dayNameReference = dayListReference.values.elementAt(index);
          //using the instance to access the day name iteringingly
          String dayName = dayNameReference.dayName;

          return Column(
            children: [
              CustomListTile(
                serialNumber: serialNumber + 1,
                dayName: dayName,
                onTap: () {
                  startWorkoutPopUpBox(
                      templateName, dayName, context, dayNameReference);
                },
              ),
              const Divider(),
            ],
          );
        } else {
          // Handle index out of bounds gracefully, such as returning an empty container
          return const SizedBox(
            child: Center(child: Text("outofbounds or no data")),
          );
        }
      },
    );
  }
}
