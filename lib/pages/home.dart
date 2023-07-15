import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:eye_spy/pages/new_activity.dart';
import 'package:eye_spy/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eye_spy/pages/search.dart';
import 'package:eye_spy/pages/team.dart';
import "package:google_fonts/google_fonts.dart";

import '../main.dart';
import 'feed.dart';
import '../widgets/navigation-bar.dart';
import 'new_group.dart';

Future<void> logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  GoogleSignIn().signOut();
  prefs.setString("photo", "");
  prefs.setString("name", "");
  prefs.setString("loggedIn", "false");
  await FirebaseAuth.instance.signOut();
}

class Home extends StatefulWidget {
  _HomeSplashState createState() => new _HomeSplashState();
}

class _HomeSplashState extends State<Home> {

  @override
  Widget build(BuildContext context) {


    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new HomePage(),
        image: new Image.asset('assets/img/eyespy_icon.png'),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        loaderColor: Color.fromRGBO(80, 100, 172, 1)
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  String URL = "";
  String name = "";
  String location = "unset";

  void setPreferences() async{
    final prefs = await SharedPreferences.getInstance();
    String photo_url = await prefs.getString("photo");
    String profile_name = await prefs.getString("name");
    String home = await prefs.getString("location");
    List<String> profile_split = profile_name.split(" ");
    profile_name = profile_split[0];
    setState(() {
      this.URL = photo_url;
      this.name = profile_name;
      this.location = home;
    });
  }

  @override
  void initState() {
    super.initState();
    setPreferences();
  }

  void refresh (dynamic index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int selectedPage = 0;
  final _pageOptions = [
    Feed(),
    Search(),
    Team(),
    Profile()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Hello, " + name,
          style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        elevation: 0,
        toolbarHeight: 70,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Icon(Icons.settings)
                    )
                  ],
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    'Log Out',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Icon(Icons.arrow_forward_rounded)
                  )
                ],
              ),
              onTap: () {
                logOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: NavigationBar(notifyParent: refresh),
    );
  }
}

// leading: Icon(
// Icons.ac_unit
// ),
// automaticallyImplyLeading: false,
// backgroundColor: Colors.white,
// toolbarHeight: 70,
// title: Image(image: AssetImage("assets/img/logo-valor.png"), width: 50,),
// centerTitle: true,
// elevation: 0,