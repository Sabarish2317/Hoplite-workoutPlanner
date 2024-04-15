import 'package:flutter/material.dart';

class MyCustomStepper extends StatefulWidget {
  final int selectedIndex;
  final int count;
  const MyCustomStepper({
    Key? key,
    required this.selectedIndex,
    required this.count,
  }) : super(key: key);

  @override
  State<MyCustomStepper> createState() => _MyCustomStepperState();
}

class _MyCustomStepperState extends State<MyCustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.count, (index) {
        final day = index + 1;
        final isSelected = day == widget.selectedIndex;
        return Expanded(
          child: textForStepper(day, isSelected),
        );
      }),
    );
  }
}

Widget textForStepper(int day, bool isSelected) {
  return SizedBox(
    height: 20,
    width: 35,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Day-$day",
          style: isSelected
              ? const TextStyle(
                  color: Color(0xFF0B4130),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                )
              : const TextStyle(
                  color: Color(0xFF0B4130),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color:
                          isSelected ? const Color(0xFF78F4CD) : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
