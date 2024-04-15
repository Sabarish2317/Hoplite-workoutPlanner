import 'package:flutter/material.dart';

class MySmallStepper extends StatefulWidget {
  final int nth;
  const MySmallStepper({super.key, required this.nth});

  @override
  State<MySmallStepper> createState() => _MySmallStepperState();
}

class _MySmallStepperState extends State<MySmallStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: ShapeDecoration(
              color: (widget.nth == 1) ? const Color(0xFF5AF5C4) : Colors.white,
              shape: const OvalBorder(
                side: BorderSide(color: Color(0xFFD9D9DE)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 1,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFB8B8C3),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 12,
            height: 12,
            decoration: ShapeDecoration(
              color: (widget.nth == 2) ? const Color(0xFF5AF5C4) : Colors.white,
              shape: const OvalBorder(
                side: BorderSide(color: Color(0xFFD9D9DE)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 1,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFB8B8C3),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 12,
            height: 12,
            decoration: ShapeDecoration(
              color: (widget.nth == 3) ? const Color(0xFF5AF5C4) : Colors.white,
              shape: const OvalBorder(
                side: BorderSide(color: Color(0xFFD9D9DE)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
