import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hoplite/pages/workout_pages/widgets/workoutbuttonsmall.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global_widgets/h1_h2.dart';

class AddWorkoutDialogue extends StatefulWidget {
  const AddWorkoutDialogue({
    super.key,
  });

  @override
  State<AddWorkoutDialogue> createState() => _AddWorkoutDialogueState();
}

class _AddWorkoutDialogueState extends State<AddWorkoutDialogue> {
  TextEditingController workoutNameController = TextEditingController();
  TextEditingController targetMuscleController = TextEditingController();
  TextEditingController setsController = TextEditingController();
  TextEditingController repsController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  //
  File? _image;

  Future<void> _getImageFromUser() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }
  //
  //

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffFFFFFF),
      surfaceTintColor: const Color(0xffFFFFFF),
      title: h1h2("Add Workout", "You can't modify this after creating"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Workout Name',
                    style: TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(controller: workoutNameController),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Target Muscle',
                    style: TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: targetMuscleController,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Sets',
                    style: TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: setsController,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Reps',
                    style: TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(controller: repsController),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Weight (Kg)',
                    style: TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: weightController,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Workout Image *',
                    style: TextStyle(
                      color: Color(0xFF0B4130),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all(24),
                        shape: MaterialStateProperty.all(CircleBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff5AF5C4)),
                      ),
                      onPressed: _getImageFromUser,
                      child: const Icon(
                        Icons.add,
                        color: Color(0xff17352C),
                        size: 26,
                      ),
                    ),
                  ),
                  _image != null
                      ? Image.file(_image!, height: 20, width: 20)
                      : Container(),
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        WorkoutButtonSmall(
          imagePath: _image != null ? _image!.path : null,
          context: context,
          repsController: repsController,
          setsController: setsController,
          weightController: weightController,
          targetMuscleController: targetMuscleController,
          workoutNameController: workoutNameController,
        )
      ],
    );
  }
}
