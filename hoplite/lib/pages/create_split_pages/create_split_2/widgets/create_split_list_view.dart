//created custom tile go down to see implementation of listview builder
import 'package:flutter/material.dart';
import 'package:hoplite/data/workoutdata.dart';

class CreateSplitListTile extends StatefulWidget {
  final int serialNumber;
  final Function(int, String) onDropDownChanged;

  final VoidCallback? onTap;

  // ignore: use_key_in_widget_constructors
  const CreateSplitListTile({
    Key? key,
    required this.serialNumber,
    this.onTap,
    required this.onDropDownChanged,
  });

  @override
  State<CreateSplitListTile> createState() => _CreateSplitListTileState();
}

class _CreateSplitListTileState extends State<CreateSplitListTile> {
  String _selectedWorkout = 'Bench Press';

  @override
  Widget build(BuildContext context) {
    List<String> workoutList = [];
    for (int i = 0; i < workoutDetails.length; i++) {
      workoutList.add(workoutDetails[i].name);
    }
    return ListTile(
      onTap: widget.onTap,
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
                "${widget.serialNumber}",
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
            width: 160,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(9),
              dropdownColor: const Color.fromARGB(220, 255, 255, 255),
              value: _selectedWorkout,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedWorkout = newValue!;
                  widget.onDropDownChanged(
                      widget.serialNumber, _selectedWorkout);
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
              items: workoutList.map<DropdownMenuItem<String>>((String value) {
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
          ),
        ],
      ),
    );
  }
}

//list view builder
class CreateSplitListView extends StatelessWidget {
  final int itemCount;
  final Function(int, String) onDropDownChanged; // Define the callback function

  const CreateSplitListView({
    super.key,
    required this.itemCount,
    required this.onDropDownChanged, // Add the required callback function
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        clipBehavior: Clip.antiAlias,
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          int indexes = index + 1;

          return Column(
            children: [
              CreateSplitListTile(
                serialNumber: indexes,
                onDropDownChanged: (index, value) {
                  // Adjusted to accept two arguments
                  // Pass the selected value to the parent
                  onDropDownChanged(index, value);
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
