import 'dart:math';

import 'package:eye_spy/pages/profile.dart';
import 'package:eye_spy/pages/test_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'feed.dart';
import 'home.dart';
import 'new_activity.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  int clickTime = 0;
  int accuracy = 0;
  int missedTaps = 0;

  @override
  void initState() {
    super.initState();
  }

  void setValues() {
    final random = Random();
    clickTime = random.nextInt(10);
    accuracy = random.nextInt(100);
    missedTaps = random.nextInt(4);
  }

  @override
  Widget build(BuildContext context) {
    setValues();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Your Results",
                style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  Row(
                      children: [
                        Text(
                          "Press Accuracy",
                          style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                            accuracy.toString() + "%",
                            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20)
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Average Click Time (ACT):",
                          style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          clickTime.toString() + "s",
                            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20)
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          "Incorrect Taps",
                          style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                            missedTaps.toString(),
                            style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20)
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(80, 100, 172, 1)
                ),
                  onPressed: ()=> Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home())),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    color: Color.fromRGBO(80, 100, 172, 1),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Return to Menu",
                                  style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20)
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.play_arrow,
                              size: 32,
                            )
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}


