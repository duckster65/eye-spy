import 'dart:math';

import 'package:eye_spy/pages/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double _xPosition = 0;
  double _yPosition = 0;
  int pressed = 0;
  int maxPressed = 5;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this._generateRandomPosition();
    });
  }

  void _generateRandomPosition() {
    final random = Random();
    if (pressed < maxPressed) {
      setState(() {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        _xPosition = random.nextDouble() * MediaQuery.of(context).size.width;
        _yPosition = random.nextDouble() * MediaQuery.of(context).size.height;
        if ((_xPosition < 20 || _xPosition > (width - 20) || _xPosition == 0)) {
          _generateRandomPosition();
        }
        if ((_yPosition < 20 || _yPosition > (height - 20) || _yPosition == 0)) {
          _generateRandomPosition();
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if (pressed < maxPressed) {
      pressed += 1;
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              left: _xPosition,
              top: _yPosition,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    splashFactory: NoSplash.splashFactory
                ),
                onPressed: () =>
                    setState(
                        _generateRandomPosition
                    ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.lightGreenAccent,
                  ),
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ],
        ),
      );
    }
    else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Test is Complete!",
                  style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 30),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(80, 100, 172, 1),
                ),
                  onPressed: ()=> Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Results())),
                  child: Container(
                    color: Color.fromRGBO(80, 100, 172, 1),
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "View Results",
                                style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
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
              Spacer()
            ],
          ),
        ),
      );
    }
  }
}