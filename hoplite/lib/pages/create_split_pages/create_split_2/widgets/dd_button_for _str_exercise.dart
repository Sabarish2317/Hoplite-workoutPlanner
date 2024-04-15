import 'package:flutter/material.dart';

class MyExerciseDropDownButton extends StatefulWidget {
  final String initialValue;
  final List<String> dropDownItems;
  final double width;

  const MyExerciseDropDownButton({
    super.key,
    required this.initialValue,
    required this.dropDownItems,
    required this.width,
  });

  @override
  State<MyExerciseDropDownButton> createState() =>
      _MyExerciseDropDownButtonState();
}

class _MyExerciseDropDownButtonState extends State<MyExerciseDropDownButton> {
  late String? selectedValue;
  late List<String>? dropDownItems;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    dropDownItems = widget.dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(9),
        dropdownColor: const Color.fromARGB(220, 255, 255, 255),
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          color: Color.fromARGB(255, 11, 77, 56),
        ),
        iconSize: 24,
        elevation: 0,
        underline: Container(
          color: Colors.transparent,
        ),
        items: dropDownItems!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF0B4130),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
