import 'package:flutter/material.dart';

import 'package:hoplite/global_widgets/button_small.dart';

import 'package:hoplite/pages/quick_start_pages_template_start/quick%20start%201%20widgets/h0_h2.dart';

import '../../../global_widgets/h1_h2.dart';
import '../create_split_2/create_split_2.dart';

class CreateSplit extends StatefulWidget {
  const CreateSplit({super.key});

  @override
  State<CreateSplit> createState() => _CreateSplitState();
}

class _CreateSplitState extends State<CreateSplit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h0_h2("Create Split", "Create your own", context),
              //padding
              const SizedBox(
                height: 24,
              ),

              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                height: null,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0x1927433A)),
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    h1h2("Title", "you cant modify this split after creating"),
                    const SizedBox(
                      height: 32,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Split Name',
                        style: TextStyle(
                          color: Color(0xFF069A6B),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                    TextFormField(),
                    const SizedBox(
                      height: 32,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Training days per week',
                        style: TextStyle(
                          color: Color(0xFF069A6B),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      ),
                    ),
                    TextFormField(),
                    const SizedBox(
                      height: 32,
                    ),
                    ButtonSmall(
                        shouldPop: false,
                        h2: "Confirm",
                        context: context,
                        navigateTo: const CreateSplit2())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
