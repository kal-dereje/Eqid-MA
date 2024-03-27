import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test/screens/login.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final topPadding = height * 0.05;
    final horizontalPadding = width * 0.1;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: topPadding,
          left: horizontalPadding,
          right: horizontalPadding,
          bottom: height * 0.07,
        ),
        color: const Color(0XFF052124),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height * 0.65,
              padding: EdgeInsets.symmetric(vertical: height * 0.025),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('images/eqid3d.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/eqidLogo.svg',
                    width: 80.0, // Adjust the width as needed
                    height: 45.0, // Adjust the height as needed
                  ),
                  Expanded(child: Container()),
                  const Text(
                    "Your daily partner.",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Developed By Mrkuz R&D",
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyLoginPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(
                    top: 1, bottom: 4, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: const Color(0xff1EE1A1),
                    borderRadius: BorderRadius.circular(50)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Let's get started",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: Colors.black87,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
