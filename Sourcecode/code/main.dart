import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_transitions/route_transitions.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qmate/Screens/info.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'qmate App',
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 6),
      () => Navigator.of(context).push(PageRouteTransition(
          animationType: AnimationType.slide_left,
          builder: (context) => Info())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            Image.asset(
              "Assets/Logo.png",
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'QUARANTINE',
                    style: GoogleFonts.ubuntu(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' MATE',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SpinKitPumpingHeart(
                color: Colors.red,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
