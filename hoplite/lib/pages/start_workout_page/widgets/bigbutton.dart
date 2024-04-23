import 'package:flutter/material.dart';

class SplitButtonLarge extends StatefulWidget {
  final String headerrtext;
  final String subtext;
  final Widget navigateTo;
  const SplitButtonLarge({
    super.key,
    required this.headerrtext,
    required this.subtext,
    required this.navigateTo,
  });

  @override
  State<SplitButtonLarge> createState() => _SplitButtonLargeState();
}

class _SplitButtonLargeState extends State<SplitButtonLarge> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => widget.navigateTo));
          },
          child: Container(
            width: double.infinity,
            height: 85,
            padding: const EdgeInsets.all(15),
            decoration: ShapeDecoration(
              color: const Color(0xFF78F4CD),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0x1E27433A)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 22,
                  child: Text(
                    widget.headerrtext,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xCC00111C),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 345,
                  child: Text(
                    widget.subtext,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xCC303E47),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
