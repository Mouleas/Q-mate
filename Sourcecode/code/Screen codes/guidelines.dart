import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:qmate/Screens/home.dart';
import 'package:qmate/Screens/testingcenters.dart';
import 'package:qmate/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Guidelines extends StatefulWidget {
  @override
  _GuidelinesState createState() => _GuidelinesState();
}

class _GuidelinesState extends State<Guidelines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        backgroundColor: s ? Color.fromRGBO(60, 31, 65, 1) : Colors.blue[900],
        elevation: 0.0,
        leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer())),
        title: Text("14 Days Quarantine"),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 80.0,
                decoration: BoxDecoration(
                  color: s ? Colors.black : Colors.blue[900],
                  image: DecorationImage(
                    image: AssetImage(
                      "Assets/homebg.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  " QMATE",
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                color: s ? Colors.grey[800] : Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(PageRouteTransition(
                        animationType: AnimationType.slide_left,
                        builder: (context) => Home()));
                  },
                  leading: Icon(Icons.home, size: 20.0, color: c),
                  title: Text(
                    "Home",
                    style: GoogleFonts.ubuntu(
                      color: s ? Colors.white : Colors.black,
                    ),
                  ),
                  dense: true,
                ),
              ),
              Container(
                color: s ? Colors.grey[800] : Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(PageRouteTransition(
                        animationType: AnimationType.slide_left,
                        builder: (context) => TestingCentre()));
                  },
                  leading: Icon(Icons.science, size: 20.0, color: c),
                  title: Text(
                    "Testing centres",
                    style: GoogleFonts.ubuntu(
                      color: s ? Colors.white : Colors.black,
                    ),
                  ),
                  dense: true,
                  // padding: EdgeInsets.zero,
                ),
              ),
              Container(
                color: s ? Colors.grey[800] : Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(PageRouteTransition(
                        animationType: AnimationType.slide_left,
                        builder: (context) => Guidelines()));
                  },
                  leading: Icon(Icons.help, size: 20.0, color: c),
                  title: Text(
                    "Why 14 days quarantine ?",
                    style: GoogleFonts.ubuntu(
                      color: s ? Colors.white : Colors.black,
                    ),
                  ),
                  dense: true,
                  // padding: EdgeInsets.zero,
                ),
              ),
              Container(
                height: 10,
                color: s ? Colors.grey[800] : Colors.white,
              ),
              Container(
                color: s ? Colors.grey[800] : Colors.white,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    s
                        ? Icon(
                            Icons.nightlight_round,
                            color: Colors.blue,
                          )
                        : Icon(
                            Icons.wb_sunny,
                            color: Colors.blue,
                          ),
                    Text(
                      "Darkmode",
                      style: GoogleFonts.ubuntu(
                        color: s ? Colors.white : Colors.black,
                      ),
                    ),
                    Switch(
                      value: s,
                      onChanged: (value) {
                        setState(() {
                          s = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                color: s ? Colors.grey[800] : Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset("Assets/1.jpg"),
              ),
              Container(
                child: Image.asset("Assets/2.jpg"),
              ),
              Container(
                child: Image.asset("Assets/3.jpg"),
              ),
              Container(
                child: Image.asset("Assets/4.jpg"),
              ),
              Container(
                child: Image.asset("Assets/5.jpg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
