import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  final int? initialValue;
  final List<int>? dropDownItems;
  final double width;
  final int? index;
  final String? keyName;

  const MyDropDownButton(
      {super.key,
      required this.initialValue,
      required this.dropDownItems,
      required this.width,
      required this.index,
      required this.keyName});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  late int? selectedValue;

  late List<int>? dropDownItems;
  //getting global data and not the referenced data

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    dropDownItems = widget.dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F2F2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(
            color: Color.fromARGB(
                100, 158, 158, 158), // Add your border color here
            width: 1, // Add your border width here
          ),
        ),
      ),
      child: DropdownButton<int>(
        borderRadius: BorderRadius.circular(9),
        dropdownColor: const Color.fromARGB(220, 255, 255, 255),
        value: selectedValue,
        onChanged: (int? newValue) {
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
        items: dropDownItems!.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              '$value',
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
