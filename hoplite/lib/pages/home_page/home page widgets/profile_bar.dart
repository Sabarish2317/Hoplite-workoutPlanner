//app bar with pfpf
import 'package:flutter/material.dart';

class ProfileBar extends StatefulWidget {
  final String? userName;
  final String? subTitle;
  const ProfileBar({super.key, required this.userName, required this.subTitle});

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  @override
  Widget build(BuildContext context) {
    return
        //main row
        Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //texts column
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello ${widget.userName} 👋🏻,',
                  style: const TextStyle(
                    color: Color(0xFF0E4635),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                    letterSpacing: 0.09,
                  ),
                ),
                Text(
                  //ProfileBar(userName: userData["Name"] ?? "Unknown", subTitle: "Start workout"),

                  "${widget.subTitle}",
                  style: const TextStyle(
                    color: Color(0xFF191A1F),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                )
              ],
            ),
            //pfp
            SizedBox(
              width: 52,
              height: 52,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("lib/assets/exercise_pics/pfp.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0x7F0B4331),
                        ),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
