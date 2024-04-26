import 'package:flutter/material.dart';

import '../../../data/workoutdata.dart';
import '../../../model/workout_model.dart';
import '../../home_page/home_page.dart';

class WorkoutButtonSmall extends StatefulWidget {
  final BuildContext context;
  final String? imagePath; // Change the type to String
  final TextEditingController? workoutNameController;
  final TextEditingController? targetMuscleController;
  final TextEditingController? setsController;
  final TextEditingController? repsController;
  final TextEditingController? weightController;

  const WorkoutButtonSmall({
    super.key,
    required this.context,
    this.imagePath, // Update the parameter
    this.workoutNameController,
    this.targetMuscleController,
    this.setsController,
    this.repsController,
    this.weightController,
  });

  @override
  State<WorkoutButtonSmall> createState() => _WorkoutButtonSmallState();
}

class _WorkoutButtonSmallState extends State<WorkoutButtonSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFF5AF5C4),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x1E27433A)),
          borderRadius: BorderRadius.circular(13),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 20,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: () {
          Navigator.pop(context);
          // Remove all pages from the stack
          Navigator.of(context).popUntil((route) => route.isFirst);

          // Push a new page onto the stack
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Saved to workout History')));
          setState(() {
            // print("Workout Name: ${widget.workoutNameController!.text}");
            // print("Target Muscle: ${widget.targetMuscleController!.text}");
            // print("Sets: ${widget.setsController!.text}");
            // print("Reps: ${widget.repsController!.text}");
            // print("Weight: ${widget.weightController!.text}");
            // Add the workout with the image path
            workoutDetails.add(WorkoutDetail(
              widget.workoutNameController!.text,
              widget.targetMuscleController!.text,
              int.tryParse(widget.repsController!.text) ?? 0,
              int.tryParse(widget.setsController!.text) ?? 0,
              int.tryParse(widget.weightController!.text) ?? 0,
              widget.imagePath!, // Use the image path here
            ));
          });
        },
        child: const Center(
          child: Text(
            "Add workout",
            style: TextStyle(
              color: Color(0xFF242731),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0.09,
            ),
          ),
        ),
      ),
    );
  }
}
