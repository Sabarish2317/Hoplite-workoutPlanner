import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String h1;
  final Widget navigateTo;

  const WorkoutCard({super.key, required this.h1, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        },
        child: Container(
          width: 163.50,
          height: 83,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.46000000834465027),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0x1927423A),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "lib/assets/exercise_pics/dumbell_pic_for_card.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Container(
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        h1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xCC00111C),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Splits',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xCC303E47),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
