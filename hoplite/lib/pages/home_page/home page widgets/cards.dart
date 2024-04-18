//card with header

import 'package:flutter/material.dart';
import 'package:hoplite/data/userdata.dart';

class StatusCards extends StatefulWidget {
  final Map<String, int> cardsData;
  const StatusCards({
    super.key,
    required this.cardsData,
  });

  @override
  State<StatusCards> createState() => _StatusCardsState();
}

class _StatusCardsState extends State<StatusCards> {
  int weight = cardsData.values.elementAt(0);
  int height = cardsData.values.elementAt(1);
  int fat = cardsData.values.elementAt(2);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //heading and subheading
        const SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Status',
                  style: TextStyle(
                    color: Color(0xFF069A6B),
                    fontSize: 22,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Track your body stats ',
                  style: TextStyle(
                    color: Color(0xCC0B4130),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        //actual cards row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Cards(
              iconPath: "lib/assets/exercise_pics/dumbell_icon.png",
              measure: weight,
              unit: "KG",
              type: "Weight",
            ),
            Cards(
              iconPath: "lib/assets/exercise_pics/height_icon.png",
              measure: height,
              unit: "CM",
              type: "Height",
            ),
            Cards(
              iconPath: "lib/assets/exercise_pics/tape_icon.png",
              measure: fat,
              unit: "%",
              type: "BodyFat",
            )
          ],
        )
      ],
    );
  }
}

//cards widget
//cards widget
class Cards extends StatefulWidget {
  final int measure;
  final String type;
  final String iconPath;
  final String unit;
  const Cards(
      {super.key,
      required this.measure,
      required this.type,
      required this.iconPath,
      required this.unit});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialogBox(context);
      },
      child: Container(
        width: 105,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x260B4130)),
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 20,
              offset: Offset(0, 0),
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: Image.asset(
                      'lib/assets/exercise_pics/edit_icon.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Image.asset(
              widget.iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              "${widget.measure} ${widget.unit}",
              style: const TextStyle(
                color: Color(0xFF00111C),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.type,
              style: const TextStyle(
                color: Color(0xFF344054),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  // Display the dialog box method
  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit'),
          content: const TextField(
            decoration: InputDecoration(hintText: 'Enter the value'),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Perform action when
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

//data
