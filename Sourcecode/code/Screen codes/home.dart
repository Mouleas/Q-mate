import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:qmate/Screens/guidelines.dart';
import 'package:qmate/Screens/testingcenters.dart';
import 'package:qmate/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = new GlobalKey<FormState>();
  String state1;
  String num = '1123978046';
  String url;
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ncov2019@gov.in',
      queryParameters: {'subject': 'Need_Help'});
  _makingPhoneCall(String num) async {
    url = 'tel:' + num;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool t = false;
  _helpline(String state) {
    var number = new Map();

    number["Andra Pradesh"] = '0866-2410978';
    number["Arunachal Pradesh"] = '9436055743';
    number["Assam"] = '6913347770';
    number["Bihar"] = '104';
    number["Chhattisgarh"] = '104';
    number["Goa"] = '104';
    number["Gujarat"] = '104';
    number["Haryana"] = '8558893911';
    number["Himachal Pradesh"] = '104';
    number["Jharkhand"] = '104';
    number["Karnataka"] = '104';
    number["Kerala"] = '0471-2552056';
    number["Madhya Pradesh"] = '104';
    number["Maharastra"] = '020-26127394';
    number["Manipur"] = '3852411668';
    number["Meghalaya"] = '108';
    number["Mizoram"] = '102';
    number["Nagaland"] = '7005539653';
    number["Odisha"] = '9439994859';
    number["Punjab"] = '104';
    number["Sikkim"] = '104';
    number["Rajasthan"] = '0141-2225624';
    number["Tamil Nadu"] = '044-29510500';
    number["Telangana"] = '104';
    number["Tripura"] = '0381-2315879';
    number["Uttarkhand"] = '104';
    number["Uttar Pradesh"] = '18001805145';
    number["West Bengal"] = '1800313444222';
    number["Andaman & Nicobar Islands"] = '03192-232102';
    number["Chandigarh"] = '9779558282';
    number["Dadra and Nagar Haveli"] = '104';
    number["Delhi"] = '011-22307145';
    number["Jammu & Kashmir"] = '0194-2440283';
    number["Leh-Ladakh"] = '01982256462';
    number["Puducherry"] = '104';

    return number[state];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: s ? Colors.black : Colors.white,
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
        title: Text("HOME"),
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
        decoration: BoxDecoration(
          color: s ? Color.fromRGBO(60, 31, 65, 1) : Colors.blue[900],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: s ? Color.fromRGBO(60, 31, 65, 1) : Colors.blue[900],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 60),
                alignment: Alignment.topCenter,
                height: 700,
                decoration: BoxDecoration(
                  color: s ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "QUARANTINE MATE",
                        style: GoogleFonts.ubuntu(
                          color: s ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            "Helpline number",
                            style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: s ? Colors.grey[300] : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            num,
                            style: GoogleFonts.ubuntu(
                              color: s ? Colors.white : Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          IconButton(
                            onPressed: () {
                              _makingPhoneCall(num);
                            },
                            icon: Icon(
                              Icons.call,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            "State",
                            style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: s ? Colors.grey[300] : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                // color: s?Colors.transparent:Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: DropDownFormField(
                                titleText: "",
                                hintText: 'Choose your state',
                                value: state1,
                                onSaved: (value) {
                                  setState(() {
                                    state1 = value;
                                  });
                                  num = _helpline(state1);
                                },
                                onChanged: (value) {
                                  setState(() {
                                    state1 = value;
                                  });
                                  num = _helpline(state1);
                                },
                                dataSource: [
                                  {
                                    "display": "Andra Pradesh",
                                    "value": "Andra Pradesh",
                                  },
                                  {
                                    "display": "Arunachal Pradesh",
                                    "value": "Arunachal Pradesh",
                                  },
                                  {
                                    "display": "Assam",
                                    "value": "Assam",
                                  },
                                  {
                                    "display": "Bihar",
                                    "value": "Bihar",
                                  },
                                  {
                                    "display": "Chandigarh",
                                    "value": "Chandigarh",
                                  },
                                  {
                                    "display": "Chhattisgarh",
                                    "value": "Chhattisgarh",
                                  },
                                  {
                                    "display": "Delhi",
                                    "value": "Delhi",
                                  },
                                  {
                                    "display": "Gujarat",
                                    "value": "Gujarat",
                                  },
                                  {
                                    "display": "Goa",
                                    "value": "Goa",
                                  },
                                  {
                                    "display": "Haryana",
                                    "value": "Haryana",
                                  },
                                  {
                                    "display": "Himachal Pradesh",
                                    "value": "Himachal Pradesh",
                                  },
                                  {
                                    "display": "Jammu & Kashmir",
                                    "value": "Jammu & Kashmir",
                                  },
                                  {
                                    "display": "Jharkhand",
                                    "value": "Jharkhand",
                                  },
                                  {
                                    "display": "Karnataka",
                                    "value": "Karnataka",
                                  },
                                  {
                                    "display": "Kerala",
                                    "value": "Kerala",
                                  },
                                  {
                                    "display": "Maharastra",
                                    "value": "Maharastra",
                                  },
                                  {
                                    "display": "Madhya Pradesh",
                                    "value": "Madhya Pradesh",
                                  },
                                  {
                                    "display": "Manipur",
                                    "value": "Manipur",
                                  },
                                  {
                                    "display": "Meghalaya",
                                    "value": "Meghalaya",
                                  },
                                  {
                                    "display": "Mizoram",
                                    "value": "Mizoram",
                                  },
                                  {
                                    "display": "Nagaland",
                                    "value": "Nagaland",
                                  },
                                  {
                                    "display": "Odisha",
                                    "value": "Odisha",
                                  },
                                  {
                                    "display": "Puducherry",
                                    "value": "Puducherry",
                                  },
                                  {
                                    "display": "Punjab",
                                    "value": "Punjab",
                                  },
                                  {
                                    "display": "Rajasthan",
                                    "value": "Rajasthan",
                                  },
                                  {
                                    "display": "Tamil Nadu",
                                    "value": "Tamil Nadu",
                                  },
                                  {
                                    "display": "Telangana",
                                    "value": "Telangana",
                                  },
                                  {
                                    "display": "Tripura",
                                    "value": "Tripura",
                                  },
                                  {
                                    "display": "Uttar Pradesh",
                                    "value": "Uttar Pradesh",
                                  },
                                  {
                                    "display": "Uttarkhand",
                                    "value": "Uttarkhand",
                                  },
                                  {
                                    "display": "West Bengal",
                                    "value": "West Bengal",
                                  },
                                  {
                                    "display": "Andaman & Nicobar Islands",
                                    "value": "Andaman & Nicobar Islands",
                                  },
                                  {
                                    "display": "Dadra & Nagar Haveli",
                                    "value": "Dadra & Nagar Haveli",
                                  },
                                  {
                                    "display": "Sikkim",
                                    "value": "Sikkim",
                                  },
                                  {
                                    "display": "Leh-Ladakh",
                                    "value": "Leh-Ladakh",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            "Helpline Mail",
                            style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: s ? Colors.grey[300] : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          launch(_emailLaunchUri.toString());
                        },
                        child: Container(
                          height: 40.0,
                          width: 150.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Email",
                                  style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            "Book your vaccine",
                            style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: s ? Colors.grey[300] : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          launch("https://www.cowin.gov.in/home");
                        },
                        child: Container(
                          height: 40.0,
                          width: 150,
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              "Vaccine",
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //ayr
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            "For Ayush practioners",
                            style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: s ? Colors.grey[300] : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          launch(
                              "https://www.ayush.gov.in/ayush-guidelines.html");
                        },
                        child: Container(
                          height: 40.0,
                          width: 150,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              "Medicines",
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
