//creating a list tile
import 'package:flutter/material.dart';

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
  final Map<int, String> data;

  const SplitDaysListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        int serialNumber = data.keys.elementAt(index);
        String dayName = data.values.elementAt(index);

        return Column(
          children: [
            CustomListTile(
              serialNumber: serialNumber,
              dayName: dayName,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const QuickStartPage2()),
                // );
                startWorkoutPopUpBox(context);
              },
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
