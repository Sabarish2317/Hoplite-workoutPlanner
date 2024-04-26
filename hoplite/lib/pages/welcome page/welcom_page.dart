import 'package:flutter/material.dart';
import 'package:hoplite/data/hive_history_local_data.dart';
import 'package:hoplite/pages/home_page/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController nameTextCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset("lib/assets/exercise_pics/welcom.png"),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/exercise_pics/logo.png",
                      scale: 7,
                    ),
                    const Text(
                      textAlign: TextAlign.left,
                      'Welcome to HopLite\nEnjoy your fitness journey !',
                      style: TextStyle(
                          color: Color(0xFFF2F2F2),
                          fontSize: 27,
                          fontFamily: 'inter',
                          fontWeight: FontWeight.w600,
                          height: 1.3),
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F8F9),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFE8ECF4)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: const TextStyle(
                            color: Color(0xCC0B4130),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your name",
                          ),
                          controller: nameTextCont,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // ignore: avoid_print
                          print("opened app");
                          // USER_DETAILS["firstName"] = nameTextCont.text;
                          UserDetails().putUserDetails(nameTextCont.text);
                        });
                        if (nameTextCont.text.length > 0) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              height: 40,
                              width: 50,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF5AF5C4),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0x1E27433A)),
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
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
