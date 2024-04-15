import 'package:flutter/material.dart';

class ButtonSmall extends StatefulWidget {
  final String h2;
  final BuildContext context;
  final String? snackBarText;
  final Widget navigateTo;
  const ButtonSmall(
      {super.key,
      required this.h2,
      required this.context,
      this.snackBarText,
      required this.navigateTo});

  @override
  State<ButtonSmall> createState() => _ButtonSmallState();
}

class _ButtonSmallState extends State<ButtonSmall> {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.navigateTo,
              ),
            );
            if (widget.snackBarText != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saved to workout History')));
            }
          },
          child: Center(
            child: Text(
              widget.h2,
              style: const TextStyle(
                color: Color(0xFF242731),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.09,
              ),
            ),
          ),
        ));
  }
}
