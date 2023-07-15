import 'package:eye_spy/pages/profile.dart';
import 'package:eye_spy/pages/test_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'new_activity.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class RemoveHighlight extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class _FeedState extends State<Feed> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ScrollConfiguration(
          behavior: RemoveHighlight(),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(80, 100, 172, 1),
                      elevation: 4
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TestPage()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(80, 100, 172, 1),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                    "Start Test",
                                  style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
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
                        ]
                      )
                    ),
                  ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}


