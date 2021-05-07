import 'package:qmate/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  List<PageViewModel> getpages() {
    return [
      PageViewModel(
        body: "Try to maintain 1 metre social distance with others",
        title: "Maintain Social Distance",
        image: Image.asset(
          "Assets/Distance.png",
        ),
      ),
      PageViewModel(
        body: "Wearing a mask shows Kindness",
        title: "Cover your face",
        image: Image.asset("Assets/Mask.png"),
      ),
      PageViewModel(
        title: "Get Vaccinated",
        body: "Take vaccine when your are in the eligible age category",
        image: Image.asset(
          "Assets/Vaccine.png",
          height: 240,
        ),
      ),
      PageViewModel(
        body:
            "Respect and appreciate the service of doctors and frontline works ",
        title: "Appreciate",
        image: Image.asset("Assets/Doctor.png"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: true,
        next: Text(
          "Next",
          style: GoogleFonts.ubuntu(color: Colors.blue),
        ),
        done: Text(
          "Done",
          style: GoogleFonts.ubuntu(color: Colors.blue),
        ),
        onDone: () {
          Navigator.of(context).push(PageRouteTransition(
              animationType: AnimationType.slide_left,
              builder: (context) => Home()));
        },
        pages: getpages(),
      ),
    );
  }
}
