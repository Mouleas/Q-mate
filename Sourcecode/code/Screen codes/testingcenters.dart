import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:qmate/Screens/home.dart';
import 'package:qmate/constants.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qmate/Screens/guidelines.dart';

class TestingCentre extends StatefulWidget {
  @override
  _TestingCentreState createState() => _TestingCentreState();
}

class _TestingCentreState extends State<TestingCentre> {
  var _centre;
  String _myActivity;

  final formKey = new GlobalKey<FormState>();
  void launchMap(String address) async {
    String query = Uri.encodeQueryComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _centre = <String>[];
  }

  _stateSelector(String st) {
    var State = new Map();

    State["Andra Pradesh"] = [
      "Sri Venkateswara Institute of Medical Sciences,Tripati",
      "Sri Venkateswara Medical College,Tripati",
      "Rangaraya Medical College,Kakinada",
      "Sidhartha Medical College,Vijaywada",
      "Govt. Medical College,Ananthpur",
      "Guntur Medical College,Guntur",
      "Rajiv Gandhi Institute of Medical Sciences,Kadapa",
      "Andhra Medical College,Vishakhapatnam",
      "Govt. Kurnool Medical College,Kurnool",
      "Govt. Medical College,Srikakulam",
      "AIIMS,Mangalagiri",
      "Damien TB Research Centre,Nellore",
      "SVRR Govt. General Hospital,Tripati",
      "Community Health Centre,Gadi Veedhi Saluru,Vizianagaram",
      "Community Health Centre,Bhimavaram,West Godavari District",
      "Community Health Centre,Patapatnam",
      "Community Health Centre,Nandyal,Banaganapalli,Kurnool",
      "GSL Medical College & General Hospital, Rajahnagram, East Godavari District",
      "District Hospital, Madnapalle, Chittoor District",
      "District Hospital, APVVP, Pulivendula, Kadapa District",
      "District Hospital, Rajahmundry, East Godavari District",
      "District Hospital, Noonepalli, Nandyal, Kurnool",
      "District Hospital, Anakapalli, Vishakhapatnam ",
      "District Hospital, Hindupur, Anantpur ",
      "District Hospital, Proddatur ",
      "District Hospital, Machlipatnam ",
      "District Hospital, Atmakur ",
      "District Hospital, Markapur ",
      "District Hospital, Tekkali ",
      "Area Hospital, Rampachodavaram, East Godavari District ",
      "Area Hospital, Palamaner, Chittoor ",
      "Area Hospital, Amalapuram, East Godavari District ",
      "Area Hospital, Adoni, Kurnool ",
      "Area Hospital, Chirala ",
      "Area Hospital, Kandukuru ",
      "Area Hospital, Narsipatnam ",
      "Area Hospital, Parvathipuram ",
      "Area Hospital, Tadepalligudem",
      "Area Hospital, Kavali ",
      "Area Hospital, Tenali ",
      "Area Hospital, Narasaraopet, Guntur ",
      "Area Hospital, Macheria, Guntur",
      "Area Hospital, Kadiri ",
      "Area Hospital, Gandhinagar, Nuzividu ",
      "ACSR Govt. Medical College, Nellore ",
      "Rural Development Trust, Bathalpalli",
      "Govt. General Hospital, Guntur ",
      "Govt. General Hospital/ RIMS, Ongole ",
      "DST Lab Govt. Chest Hospital, Vishakhapatnam",
      "District Hospital, Vizianagram ",
      "District Hospital, Chittoor ",
      "District Hospital, Eluru ",
      "SHAR Hospital, Sriharikota, Nellore "
    ];

    State["Arunachal Pradesh"] = [
      "Tomo Riba Institute of Health & Medical Sciences, Naharlagun ",
      "Intermediate Reference Laboratory, Directorate of Health Sciences, Naharlagun "
    ];

    State["Assam"] = [
      "Gauhati Medical College, Guwahati 57",
      "ICMR-Regional Medical Research Center, Dibrugarh  58",
      "Jorhat Medical College, Jorhat 59",
      "Silchar Medical College, Silchar",
      "Fakkhruddin Ali Ahmed Medical College, Barpeta 61. Tezpur Medical College, Tezpur 62",
      "Assam Medical College, Dibrugarh 63",
      "*CSIR North East Institute of Science and Technology (NEIST), Jorhat 64",
      "*Defence Research Laboratory, Tezpur 65",
      "Diphu Medical College, Karbi Anglong"
    ];

    State["Bihar"] = [
      "ICMR-Rajendra Memorial Research Institute of Medical Sciences, Patna",
      "Indira Gandhi Institute Medical Sciences, Patna",
      "Patna Medical College, Patna",
      "Darbhanga Medical College, Darbhanga",
      "SKMCH, Muzaffarpur",
      "All India Institute of Medical Sciences, Patna ",
      "Narayan Medical College, Sasaram",
      "Anugrah Narayan Magadh Medical College (ANMMC), Gaya",
      "Vardhman Institute of Medical Sciences, Pawapuri, Nalanda",
      "District Hospital, Siwan",
      "District Hospital, Rohtas",
      "JanNayak Karpoori Thakur Medical College and Hospital, Madhepura",
      "Govt.  Medical College, Bettiah",
      "District Hospital, Purnia 79. District Hospital, Katihar",
      "District Hospital, East Champaran",
      "District Hospital, Madhubani",
      "District Hospital, Buxar",
      "District Hospital, Khagaria",
      "District Hospital, Begusarai",
      "District Hospital, Banka, Bihar ",
      "District Hospital, Gopalganj, Bihar",
      "District Hospital, Aurangabad, Bihar",
      "District Hospital, Jehanabad, Bihar",
      "District Hospital, Nawada, Bihar",
      "District Hospital, Arwal",
      "District Hospital, Saharsa, Bihar ",
      "District Hospital, Supaul, Bihar",
      "District Hospital, Kaimur, Bihar",
      "District Hospital, Saran, Bihar",
      "District Hospital, Bhojpur, Bihar",
      "District Hospital, Kishanganj, Bihar ",
      "District Hospital, Jamui, Bihar",
      "District Hospital, Lakhisarai, Bihar",
      "District Hospital, Munger",
      "Jawaharlal Nehru Medical College, Bhagalpur"
    ];

    State["Chandigarh"] = [
      "Post Graduate Institute of Medical Education & Research, Chandigarh"
          "Govt. Medical College, Chandigarh"
          "Institute of Microbial Technology, Chandigarh"
    ];

    State["Chhattisgarh"] = [
      "All India Institute of Medical Sciences, Raipur ",
      "Late Baliram Kashyap M Govt. Medical College, Jagdalpur",
      "JNM Medical College, Raipur ",
      "Late Shri Lakhi Ram Agrawal Memorial Govt. Medical College, Raigarh",
      "Intermediate Reference Laboratory, Lalpur, Raipur"
    ];

    State["Delhi"] = [
      "All India Institute Medical Sciences",
      "Lady Hardinge Medical College",
      "National Centre for Disease Control",
      "Ram Manohar Lohia Hospital",
      "Institute of Liver & Biliary Sciences",
      "Army Hospital Research & Referral",
      "Maulana Azad Medical College",
      "Vardhman Mahavir Medical College & Safdarjung Hospital",
      "University College of Medical Sciences, New Delhi",
      "Army Base Hospital, New Delhi",
      "*IGIB, CSIR, New Delhi",
      "Rajiv Gandhi Super Speciality Hospital, Taharpur, Delhi",
      "Vallabhbhai Patel Chest Institute (VPCI), Delhi",
      "*Defence Institute of Physiology & Allied Sciences (DIPAS), DRDO, Delhi ",
      "ESIC Hospital, Basaidarapur",
      "State TB Training and Demonstration Centre, Jawaharlal Nehru Marg, Delhi Gate",
      "Department of Microbiology, National Institute of TB and Respiratory Diseases (NITRD), New Delhi",
      "Northern Railway Central Hospital, New Delhi"
    ];

    State["Gujarat"] = [
      "BJ Medical College, Ahmedabad",
      "MP Shah Govt Medical College, Jamnagar",
      "Govt. Medical College, Surat",
      "Govt. Medical College, Bhavnagar",
      "Govt. Medical College, Vadodara",
      "Govt. Medical College, Rajkot ",
      "NHL Medical College, Ahmedabad",
      "GMERS Medical College, Ahmedabad",
      "GMERS Medical College, Gandhinagar",
      "GMERS Medical College, Valsad",
      "ICMR-National Institute of Occupational Health, Ahmedabad",
      "Gujarat Cancer & Research Institute, Ahmedabad ",
      "Surat Municipal Institute of Medical Education & Research (SMIMER), Surat ",
      "GMERS Medical College and Hospital, Dharpur-Patan, Gujarat ",
      "Gujarat Adani Institute of Medical Sciences, Bhuj",
      "Gujarat Biotechnology Research Center, Gandhinagar ",
      "Gujarat Forensic Sciences University, Gandhinagar",
      "GMERS Medical College, Gotri, Vadodara",
      "GMERS Medical College, Himmatnagar",
      "Dr. H.L. Trivedi Institute of Transplantation Services, Ahmedabad",
      "GCS Medical College and Hospital, Ahmedabad",
      "AMC MET Medical College and Hospital, Ahmedabad "
    ];

    State["Goa"] = [
      "#Goa Medical College, Goa ",
      "North District Hospital, Mapusa",
      "Subdistrict Hospital, Ponda ",
      "South Goa District Hospital (Hospicio Hospital), Margao",
      "Sub- District Hospital, Chicalim, Vasco Da Gama"
    ];

    State["Haryana"] = [
      "Pt. B.D. Sharma Post Graduate Inst. Of Med. Sciences, Rohtak",
      "Command Hospital, Chandimandir",
      "BPS Govt. Medical College, Sonipat",
      "ESIC Hospital, Faridabad",
      "Kalpana Chawla Govt. Medical College, Karnal",
      "Govt.  Civil Hospital, Panchkula ",
      "ICAR-National Research Centre on Equines, Hisar"
          "*Translational Health Science & Technology Institute, Faridabad",
      "#SHKM, Govt. Medical College, Mewat",
      "#District Civil Hospital, Ambala",
      "Civil Hospital, Gurugram",
      "IRL, Haryana Govt. Public Health Laboratory, Karnal ",
      "Maharaj Agrasen Medical College, Agroha, Hisar"
    ];

    State["Himachal Pradesh"] = [
      "Indira Gandhi Medical College, Shimla",
      "Dr. Rajendra Prasad Govt. Medical College, Tanda ",
      "Central Research Institute, Kasauli",
      "Shri Lal Bahadur Shastri Govt. Medical College, Mandi",
      "*CSIR Institute of Himalayan Bioresource Technology, Palampur",
      "#Dr. Yashwant Singh Parmar Government Medical College, Nahan "
    ];

    State["Jammu & Kashmir"] = [
      "Govt. Medical College, Jammu",
      "Command Hospital (NC) Udhampur",
      "Sher-i-Kashmir Institute of Medical Sciences, Srinagar",
      "Govt. Medical College, Srinagar",
      "Sheri Kashmir Institute of Medical Science Medical College, Bemina, Srinagar",
      "*CSIR Indian Institute of Integrative Medicine (IIIM), Jammu ",
      "Intermediate Reference Laboratory, Chest Disease Hospital, Dalgate, Srinagar "
    ];

    State["Jharkhand"] = [
      "MGM Medical College & Hospital, Jamshedpur",
      "Rajendra Institute of Medical Sciences, Ranchi",
      "Patliputra Medical College & Hospital, Dhanbad",
      "Itki Aarogyashala, Ranchi ",
      "District Hospital, Bokaro",
      "District Hospital, Chatra",
      "District Hospital, Deoghar",
      "District Hospital, Dumka",
      "District Hospital, Garhwa",
      "District Hospital, Giridih",
      "District Hospital, Godda",
      "District Hospital, Hazaribag",
      "District Hospital, Kodarma",
      "District Hospital, Lathehar",
      "District Hospital, Pakur",
      "District Hospital, Palamu",
      "District Hospital, Pashchimi Singhbhum",
      "District Hospital, Ranchi",
      "District Hospital, Sahibganj",
      "District Hospital, Dhanbad",
      "District Hospital, Gumla",
      "District Hospital, Jamtara",
      "District Hospital, Khunti",
      "District Hospital, Lohardaga",
      "District Hospital, Purbi Singhbum",
      "District Hospital, Ramgarh",
      "District Hospital, Saraikela Kharsawan",
      "District Hospital, Simdega",
      "Military Hospital, Namkum, Ranchi"
    ];

    State["Karnataka"] = [
      "Hassan Inst. of Med Science,Hasan",
      "Mysore Medical College & Research Institute, Mysore",
      "Shivamogga Institute of Medical Sciences, Shivamogga",
      "Command Hospital (Air Force), Bengaluru",
      "Bangalore Medical College & Research Institute, Bengaluru",
      "ICMR-National Institute of Virology, Bangalore Field Unit, Bengaluru ",
      "*Indian Institute of Science, Bengaluru (Department of Biochemistry, Centre for Infectious Disease Research)",
      "Gulbarga Institute of Medical Sciences, Gulbarga",
      "Vijaynagar Institute of Medical Sciences, Bellary",
      "National Institute of Mental Health and Neuro-Sciences, Bangalore",
      "Wenlock District Hospital, Mangalore",
      "Karnataka Institute of Medical Sciences, Hubli",
      "National Institute of Traditional Medicine, Belagavi",
      "Dharwad Institute of Mental Health & Neurosciences, Dharwad",
      "Kidwai Memorial Institute of Oncology, Bengaluru ",
      "*Instem, Bengaluru 225. Mandya Institute of Medical Sciences (MIMS), Mandya",
      "Chamarajanagar Institute of Medical Sciences (CIMS), Chamarajanagar District",
      "#Gadag Institute of Medical Sciences, Gadag ",
      "Kodagu Institute of Medical Sciences (KOIMS), Kodagu District",
      "Government Virus Diagnostic Laboratory, Shimoga District ",
      "Raichur Institute of Medical Sciences, Raichur",
      "Bidar Institute of Medical Sciences, Bidar",
      "Koppal Institute of Medical Sciences, Koppal",
      "Karwar Institute of Medical Sciences, Karwar",
      "Tumkur District Hospital, Tumkur",
      "Bowring Lady Curzon Medical College and Research Institute (BLCMRI), Bangalore",
      "SNR District Hospital, Kolar",
      "Public health Laboratory, Chikkaballapur District Hospital, Chikkaballapur",
      "Public Health Laboratory, Chikmagalur District Hospital, Chikmagalur",
      "Udupi District Hospital, Udupi",
      "Yadgiri District Hospital, Yadgiri ",
      "Chitradurga District Hospital, Chitradurga",
      "District Public Health Laboratory, Kolar District",
      "District Public Health Laboratory, Chamarajanagar District ",
      "Bangalore Bruhat Mahanagara Palike (BBMP) Health Centre (Fever Clinic), Adugodi, Bangalore",
      "District Public Health Laboratory, Ramanagara District",
      "Jayadeva Institute of Cardiac Sciences, Bangalore ",
      "Vijayapura District Hospital, Vijayapura",
      "Belgaum Institute of Medical Sciences, Belgaum",
      "Bagalkot District Hospital, Bagalkot "
    ];

    State["Kerala"] = [
      "National Institute of Virology, Field Unit, Allapuzzha",
      "Govt. Medical College, Thiruvanathapuram",
      "Govt. Medical College, Kozhikode ",
      "Govt. Medical College, Thrissur ",
      "Rajiv Gandhi Center for Biotechnology, Thiruvanathapuram ",
      "Sree Chitra Tirunal Institute of Medical Sciences, Thiruvanathapuram ",
      "State Public Health Laboratory, Trivandrum ",
      "Inter University, Kottayam ",
      "Malabar Cancer Center, Thalassery",
      "Central University of Kerala, Periye, Kasaragod ",
      "Govt. Medical College, Ernakulum ",
      "Govt. Medical College, Manjeri",
      "Govt. Medical College, Kottayam ",
      "Govt. Medical College, Kannur ",
      "Indian Institute of Science Education and Research (IISER), Thiruvananthapuram ",
      "Regional Public Health Laboratory, Pathanamthitta",
      "Government Medical College Hospital, Kollam ",
      "Government TD Medical College, Alappuzha",
      "District Public Health Laboratory, Wayanad ",
      "District TB Centre, Palakkad ",
      "INHS Sanjivani, Kochi",
      "Regional Cancer Centre, Thiruvananthapuram "
    ];

    State["Maharastra"] = [
      "ICMR-National Institute of Virology, Pune ",
      "Seth GS Medical College & KEM Hospital, Mumbai ",
      "Kasturba Hospital for Infectious Diseases, Mumbai",
      "National Institute of Virology Field Unit, Mumbai ",
      "Armed Forces Medical College, Pune ",
      "BJ Medical College, Pune ",
      "Command Hospital (SC), Pune ",
      "Indira Gandhi Govt. Medical College, Nagpur",
      "All India Institute of Medical Sciences, Nagpur",
      "Govt. Medical College, Nagpur ",
      "Nagpur Veterinary College, MAFSU, Nagpur",
      "Intermediate Reference Laboratory, Nagpur",
      "Grant Medical College & Sir JJ Hospital, Mumbai",
      "Govt. Medical College, Aurangabad",
      "V. M. Govt.  Medical College, Solapur",
      "Haffkine Institute, Mumbai",
      "Shree Bhausaheb Hire Govt. Medical College, Dhule",
      "Govt.  Medical College, Miraj",
      "Govt. Medical College, Akola",
      "National Institute for Research on Reproductive Health, Mumbai",
      "Rajiv Gandhi Medical College & CSM Hospital, Kalwa, Thane, Mumbai",
      "ICMR-National AIDS Research Institute, Pune",
      "Swami Ramanand Teerth Marathwada University, Nanded",
      "Mahatma Gandhi Institute of Medical Sciences, Sevagram, Wardha",
      "Vilasrao Deshmukh Govt. Institute of Medical Sciences, Latur"
          "INHS Ashvini, Mumbai ",
      "*Tata Memorial Centre ACTREC, Mumbai",
      "*Tata Memorial Hospital, Mumbai ",
      "*National Centre for Cell Sciences, Pune",
      "*National Environmental Engineering Research Institute, Nagpur",
      "Sant Gadge Baba Amravati University, Amravati ",
      "#RCSM Govt. Medical College, Kolhapur",
      "Model Rural Health Research Unit (MRHRU), Sub District Hospital, Agar, Dahanu, Palghar",
      "*Indian Institute of Science Education and Research (IISER), Pune",
      "Govt.  Medical College, Jalgaon ",
      "District General Hospital, Ahmednagar ",
      "Government Medical College, Baramati",
      "#Govt. Medical College, Chandrapur ",
      "#Govt.  Medical College, Yavatmal ",
      "Swami Ramanand Teerth  Rural Government Medical College, Ambajogai",
      "Government Medical College, Gondia ",
      "Agharkar Research Institute, Pune ",
      "District General Hospital, Ratnagiri ",
      "Dr. Shankarrao Chavan Govt. Medical College, Nanded ",
      "Civil Surgeon, District Hospital, Parbhani",
      "District Hospital, Satara ",
      "Daga Memorial Government Women Hospital, Nagpur",
      "Navi Mumbai Municipal Corporation General Hospital, F.R.U. Vashi"
          "District General Hospital, Gadchiroli",
      "Darasha Maternity Home, Solapur Municipal Corporation, Solapur",
      "District Hospital, Amravati",
      "Intermediate Reference Laboratory, Pune",
      "Govt.  Medical College, Baramati",
      "Lokmanya Tilak Municipal General Hospital and Medical College, Mumbai "
    ];

    State["Madhya Pradesh"] = [
      "All India Institute of Medical Sciences, Bhopal",
      "ICMR-National Institute for Research on Tribal Health, Jabalpur",
      "Mahatma Gandhi Memorial Medical College, Indore",
      "Gandhi Medical College, Bhopal ",
      "Bhopal Memorial Hospital & research Centre, Bhopal",
      "Gajra Raja Medical College, Gwalior",
      "Bundelkhand Medical College, Sagar ",
      "SS Medical College, Rewa ",
      "*Defence Research & Development Organization, Gwalior"
          "*ICAR-NIHSAD, Bhopal",
      "Govt.  Medical College, Ratlam ",
      "Netaji Subhash Chandra Bose Medical College, Jabalpur",
      "Govt.  Medical College, Khandwa ",
      "Atal Bihari Vajpayee Government Medical College (ABVGMC), Vidisha",
      "*IISER, Bhopa",
      "District Tuberculosis Centre, Bhopal ",
      "District Hospital Gwalior ",
      "District Hospital Morena ",
      "District Hospital Chhatarpur ",
      "District Hospital Damoh ",
      "District Hospital Sagar ",
      "District Hospital Tikamgarh ",
      "District Hospital, Mandsaur ",
      "District Hospital, Neemuch ",
      "District Tuberculosis Centre, Indore ",
      "District Hospital Chhindwara ",
      "District Hospital, Jabalpur ",
      "District Hospital, Shahdol ",
      "District Hospital, Burhanpur",
      "District Hospital, Singrauli ",
      "District Tuberculosis Centre, Raisen ",
      "District Hospital, Bhind ",
      "District Hospital, Datia ",
      "District Hospital, Sheopur ",
      "District Hospital, Shivpuri ",
      "District Hospital, Alirazpur ",
      "District Hospital, Barwani ",
      "District Hospital, Dhar ",
      "District Hospital, Jhabua ",
      "District Hospital, Khargone ",
      "District Hospital, Agarmalwa ",
      "District Hospital, Shajapur ",
      "District Hospital, Ujjain ",
      "District Hospital, Dindori ",
      "District Tuberculosis Centre, Mandla",
      "District Hospital, Seoni ",
      "District Hospital, Satna ",
      "District Hospital, Sidhi ",
      "District Hospital, Singrauli ",
      "District Hospital, Umaria ",
      "District Hospital, Panna ",
      "District Hospital, Rewa "
    ];

    State["Manipur"] = [
      "Jawaharlal Nehru Institute of Med. Sciences, Imphal-East, Manipur ",
      "Regional Institute of Medical Sciences, Imphal"
    ];

    State["Meghalaya"] = [
      "North Eastern Indira Gandhi Regional Institute of Health & Medical Sciences, Shillong, Meghalaya ",
      "Pasteur Institute, Shillong ",
      "Civil Hospital, Tura"
    ];

    State["Mizoram"] = [
      "Zoram Medical College, Falkawn ",
      "Civil Hospital, Lunglei "
    ];

    State["Nagaland"] = [
      "State Referral BSL-3 Laboratory, Naga Hospital, Kohima ",
      "Imkongliba Memorial District Hospital, Mokokchung",
      "District Hospital, Mon ",
      "District Hospital, Dimapur, Nagaland ",
      "CHC, Jalunkie, Nagaland ",
      "District Hospital, Zunheboto ",
      "District Hospital, Wokha"
    ];

    State["Odisha"] = [
      "ICMR-Regional Medical Research Centre, Bhubaneshwar (High-throughput Laboratory)",
      "All India Institute of Medical Sciences, Bhubaneshwar ",
      "SCB Medical College and Hospital, Cuttack ",
      "MKCG Medical College, Berhampur ",
      "Ispat General Hospital, Rourkela ",
      "Veer Surendra Sai institute of Medical Science & Research, Sambalpur ",
      "*Institute of Life Sciences, Bhubaneshwar ",
      "*ICAR- International Centre for Foot and Mouth Disease, Khordha, Odisha ",
      "*Indian Institute of Science Education and Research (IISER), Berhampur",
      "#Bhima Bhoi Medical College and Hospital, Bolangir ",
      "#Pandit Raghunath Murmu Medical College, Baripada",
      "SLN Medical College and Hospital, Koraput ",
      "Tribal Field Unit of ICMR-RMRC, Bhawanipatna, Kalahandi ",
      "Tribal Field Unit of ICMR-RMRC, Rayagada ",
      "Fakir Mohan Medical College and Hospital, Balasore "
    ];

    State["Puducherry"] = [
      "#Jawaharlal Institute of Postgraduate Medical Education & Research, Puducherry ",
      "Indira Gandhi Medical College, Puducherry",
      "Intermediate Reference Laboratory, Govt.  Hospital for Chest Diseases, Gorimedu, Puducherry"
    ];

    State["Punjab"] = [
      "Govt. Medical College, Amritsar  ",
      "Govt. Medical College, Patiala ",
      "Guru Gobind Singh Medical University, Faridkot",
      "District Hospital, Barnala, Punjab ",
      "District Hospital, Jalandhar, Punjab ",
      "District Hospital, Ludhiana, Punjab ",
      "District Hospital, Mansa, Punjab ",
      "District Hospital, Pathankot, Punjab ",
      "Intermediate Reference Laboratory, Patiala "
    ];

    State["Rajasthan"] = [
      "Sawai Man Singh Medical College, Jaipur ",
      "Rajasthan University of Health Sciences Medical College, Jaipur ",
      "Dr. Sampurnan and Medical College, Jodhpur  ",
      "Jhalawar Medical College, Jhalawar ",
      "RNT Medical College, Udaipur ",
      "SP Medical College, Bikaner ",
      "All India Institute of Medical Sciences, Jodhpur ",
      "JLN Medical College, Ajmer ",
      "Govt. Medical College, Kota ",
      "ICMR-National Institute for Implementation Research on NonCommunicable Diseases, Jodhpur ",
      "RVRS Govt. Medical College, Bhilwara ",
      "Govt.  Medical College, Dungarpur ",
      "Pandit Deendayal Upadhyaya Medical College, Churu ",
      "Govt.  Medical College, Bharatpur ",
      "Govt.  Medical College, Sikar ",
      "Govt.  Medical College, Barmer ",
      "Govt.  Medical College, Pali ",
      "Govt.  BDK District Hospital, Jhunjhunu ",
      "Military Hospital, Jaipur ",
      "District Hospital, Sirohi "
    ];

    State["Tamil Nadu"] = [
      "King Institute of Preventive Medicine & Research, Chennai ",
      "Madras Medical College, Chennai ",
      "Stanley Medical College, Chennai ",
      "Govt. Kilpauk Medical College, Chennai ",
      "ICMR-National Institute for Research in Tuberculosis, Chennai ",
      "State Public Health Laboratory, Chennai ",
      "ICMR-National Institute of Epidemiology, Chennai ",
      "Dr. MGR Medical University, Chennai ",
      "Dr. ALM PG Institute of Basic Medical Sciences, Chennai ",
      "Govt. Medical College & Hospital, Omandurar Govt. Estate, Chennai",
      "Govt. Theni Medical College, Theni ",
      "Tirunelveli Medical College, Tirunelveli ",
      "Govt. Medical College, Thiruvarur ",
      "Kumar Mangalam Govt. Medical College, Salem ",
      "Coimbatore Medical College, Coimbatore ",
      "Govt. Medical College & ESIC Hospital, Coimbatore  ",
      "Govt. Medical College, Villupuram ",
      "Madurai Medical College, Madurai ",
      "K A P Viswanatham Govt. Medical College, Trichy ",
      "Perundurai Medical College, Perundurai ",
      "Govt. Dharmapuri Medical College, Dharmapuri ",
      "Govt. Medical College, Vellore ",
      "Thanjavur Medical College, Thanjavur ",
      "Kanyakumari Govt. Medical College, Nagercoil ",
      "Govt. Thoothukudi Medical College, Thoothukudi ",
      "Institute of Vector Control & Zoonoses, Hosur ",
      "Pasteur Institute of India, Coonoor ",
      "Rajah Muthiah Medical College, Chidambaram ",
      "Govt.  Medical College, Karur ",
      "Govt. Tiruvannamalai Medical College & Hospital, Tiruvannamalai ",
      "Chengalpattu Govt.  Medical College, Kancheepuram ",
      "Govt.  Medical College and Hospital, Pudukkottai ",
      "Govt.  Shivagangai Medical College, Shivagangai ",
      "Govt.  District Headquarters Hospital, Virrudhu Nagar ",
      "Govt.  District Headquarters Hospital, Ramanathapuram ",
      "Govt.  District Headquarters Hospital, Ariyalur ",
      "Govt.  District Headquarters Hospital, Tiruppur ",
      "Govt.  Kallakruichi Hospital, Kallakurichi ",
      "Govt.  District Headquarters Hospital, Tiruvallur ",
      "Govt. District Headquarters Hospital, Namakkal ",
      "*Central Leather Research Institute, Adyar, Chennai ",
      "Government Headquarters Hospital, Dindigul ",
      "C.D Hospital, Greater Chennai Corporation, Chennai ",
      "Government District Head Quarters Hospital, Nagapattinam ",
      "Government Hospital of Thoracic Medicine, Tambaram Sanatorium, Chennai "
    ];

    State["Telangana"] = [
      "Gandhi Medical College, Secunderabad ",
      "Osmania Medical College, Hyderabad ",
      "Sir Ronald Ross of Tropical & Communicable Diseases, Hyderabad. ",
      "Nizam’s Institute of Medical Sciences, Hyderabad ",
      "Institute of Preventive Medicine, Hyderabad ",
      "ESIC Medical College, Hyderabad ",
      "Kakatiya Medical College, Warangal ",
      "*Centre for Cellular & Molecular Biology, Hyderabad ",
      "*Centre for DNA Fingerprinting & Diagnostics, Hyderabad",
      "Rajiv Gandhi Institute of Medical Sciences, Adilabad "
    ];

    State["Tripura"] = ["Govt.  Medical College, Agartala"];

    State["Uttar Pradesh"] = [
      "King George Medical University,Lucknow",
      "Institute of Medical Sciences, Banaras Hindu University, Varanasi ",
      "Jawaharlal Nehru Medical College, Aligarh ",
      "Command Hospital, Lucknow ",
      "Lala Lajpat Rai Memorial Medical College, Meerut ",
      "Sanjay Gandhi Post Graduate Institute, Lucknow ",
      "MLN Medical College, Allahabad",
      "Uttar Pradesh University of Medical Sciences (Formerly Uttar Pradesh RIMS), Saifai ",
      "MLB Medical College, Jhansi ",
      "ICMR-Regional Medical Research Centre, Gorakhpur ",
      "SN Medical College, Agra ",
      "#ICMR-National JALMA Institute for Leprosy & Other Mycobacterial Diseases, Agra ",
      "RML Institute of Medical Sciences, Lucknow ",
      "Govt. Institute of Medical Sciences, Noida ",
      "#GSVM Medical College, Kanpur ",
      "National Institute of Biologicals, Noida (High-throughput Laboratory) ",
      "BRD Medical College, Gorakhpur ",
      "*Indian Institute of Toxicology Research, Lucknow ",
      "*Birbal Sahni Institute of Palaeosciences, Lucknow ",
      "*Central Drug Research Institute, Lucknow ",
      "*ICAR- Indian Veterinary Research Institute (IVRI), Izatnagar ",
      "Super Specialty Pediatric Hospital and Postgraduate Teaching Institute (SSPHPGTI), Noida ",
      "College of Veterinary Sciences and Animal Husbandry, UP Pt. Deen Dayal Upadhyaya Pashu Chikitsa Vishwavidyalaya evam Go Anusandhan Sansthan, Mathura",
      "District Combined Hospital, District Balrampur ",
      "District Combined Hospital, District Basti ",
      "Sarojani Naidu Samarak Hospital, District Firozabad ",
      "Babu Eswar Saran District Hospital, Gonda ",
      "Amar Shahid late Uma Nath Singh District Hospital, Jaunpur ",
      "District Hospital, Bahraich 524. District Male Hospital, Ayodhya ",
      "District Combined Hospital, Mahrajganj ",
      "District Femal Hospital, Muzaffarnagar ",
      "District Male Hospital, Pratapgarh ",
      "District Hospital, Ballia",
      "Pt.Ramprasad Bismil, District Combined Hospital Shahjahanpur ",
      "Bairister Yusuf Emam, Divisional Hospital, Mirzapur ",
      "Mahatama Gandhi, District Combined Hospital, Siddharth Nagar ",
      "Balrampur Hospital, Lucknow ",
      "Malkhan Singh Joint District Hospital, Aligarh ",
      "District Hospital, Ambedkar Nagar ",
      "Pt. Din Dayal Upahadhy, District Combined Hospital, Moradabad ",
      "Motilal Nehru Divisional Hospital, Prayagraj ",
      "Divisional Hospital, Azamgarh ",
      "District Male Hospital, Budaun ",
      "Babu Mohan Singh, Joint District Hospital, Deoria ",
      "Bheemrao Ambedkar Multi Superspeciality District Hospital, G. B Nagar ",
      "Netaji Subhash Chandra Bose District Hospital, Gorakhpur ",
      "Rana Devi Madhav Singh, District Hospital, Raebareli  ",
      "District Hospital, Sultanpur ",
      "Maharana Pratap Joint District Hospital, Bareily ",
      "Rafi Ahmad Kidwai memorial District Hospital, Barabanki ",
      "District Hospital, Etah ",
      "M.M.G District Hospital, Ghaziabad ",
      "Joint District Hospital, Manjhanpur, Kaushambi ",
      "District Male Hospital, Sitapur ",
      "District Male Hospital, Kheri ",
      "Babu Banarasi Das govt. District Hospital, Bulandsahar ",
      "District Hospital, Agra ",
      "Joint District Hospital, Amethi ",
      "District Hospital, Baghpat ",
      "District Male & Eye Hospital, Padrauna, Kushinagar ",
      "U.H.M District Male Hospital, Kanpur Nagar ",
      "P.L. Sharma District Hospital, Meerut ",
      "Shadilal Memorial Community Health Centre, Shamli ",
      "Uma Shankar Dixit Joint District Hospital, Unnao ",
      "S.S.P.G District Hospital, Varanasi  ",
      "100 Beded District Hospital, Aauraiya ",
      "District Hospital, Banda ",
      "District Combined Hospital, Bijnor ",
      "Pt. Kamlapati Tripathi  Joint District Hospital, Chandauli ",
      "Joint District Hospital, Chitrakoot ",
      "Dr. Bheemrao Ambedkar District Hospital, Etawah ",
      "Dr. Ram Manohar Lohia District Hospital, Farrukabad ",
      "District Hospital, Fatehpur ",
      "Dr. Mukhtar Ansari District Hospital, Ghazipur ",
      "Deewan Satrughan District Hospital, Hamirpur ",
      "District Hospital, Hapur ",
      "Pt. Ramdayal Trivedi District Hospital, Hardoi ",
      "Bangla District Hospital, Hathras ",
      "Joint District Hospital, J.P Nagar ",
      "District Male Hospital, Jalaun ",
      "Divisional District Hospital, Jhansi ",
      "100 Beded District Hospital, Kannauj",
      "Joint District Hospital, Akbarpur, Kanpur Dehat ",
      "Joint District Hospital, Kanshiram Nagar ",
      "Manywar Kanshiram Joint District Hospital, Lalitpur ",
      "District Hospital, Mahoba ",
      "Maharaja Tez Singh District Hospital, Mainpur ",
      "Mahrishi Dayanad Saraswati District Hospital, Mathura ",
      "District Hospital, Ghazipur Tiraha, Mau ",
      "Joint District Hospital, Pilibhit ",
      "District Hospital, Rampur ",
      "Seth Baldev Das District Hospital, Saharanpur ",
      "Joint District Hospital, Manjhanpur, Sambhal ",
      "Joint District Hospital, Sant Kabir Nagar ",
      "Maharaja Balwant District Hospital, Santravidas Nagar ",
      "Joint District Hospital, Bhinga, Shrawasti ",
      "Joint District Hospital, Robertsganj, Sonbhadra "
    ];

    State["Uttarkhand"] = [
      "Govt. Medical College, Haldwani  ",
      "All India Institute of Medical Sciences, Rishikesh ",
      "Doon Medical College, Dehradun",
      "Veer Chandra Singh Garhwali Govt. Institute of Medical Science & Research, Srinagar, Pauri, Garhwal ",
      "*CSIR- Indian Institute of Petroleum, Dehradun "
    ];

    State["West Bengal"] = [
      "Institute of Post Graduate Medical Education & Research, Kolkata ",
      "Midnapore Medical College, Midnapore ",
      "North Bengal Medical College, Darjeeling ",
      "School of Tropical Medicine, Kolkata ",
      "Malda Medical College & Hospital, Malda ",
      "Command Hospital, Kolkata ",
      "Chittaranjan National Cancer Institute, Kolkata ",
      "R.G. Kar Medical College & Hospital, Kolkata ",
      "Murshidabad Medical College, Behrampore, Murshidabad",
      "Nil Ratan Sircar Medical College, Kolkata ",
      "Bankura Medical College, Bankura ",
      "Suri Sadar Hospital, Birbhum 611. #Medical College, Kolkata"
          "ICMR-National Institute of Cholera & Enteric Diseases,Kolkata",
      "College of Medicine and JNM Hospital, Kalyani, Nadia ",
      "Calcutta National Medical College and Hospital, Kolkata ",
      "Raiganj Govt.  Medical College and Hospital, Raiganj ",
      "Falakata SSH Hospital, District Alipurduar ",
      "Jhargram District Hospital, Jhargram District ",
      "Rampurhat Govt. Medical College and Hospital, Rampurhat, Birbhum ",
      "Diamond Harbour Govt.  Medical College and Hospital, Diamond Harbour ",
      "Asansol District Hospital, Asansol ",
      "Balurghat District Hospital, Dakshin Dinajpur ",
      "Jangipur Sub-Divisional Hospital, Murshidabad ",
      "Uluberia Sub Divisional Hospital, Howrah ",
      "Serampore Walsh Sub-divisional Hospital, Hugli ",
      "Biswa Bangla Krirangan SARI/qmate Hospital, Jalpaiguri ",
      "Chanchal Sub-divisional Hospital (SDH), Malda ",
      "Purulia Government Medical College and Hospital, Purulia ",
      "M R Bangur District Hospital, Kolkata ",
      "Cooch Behar Government Medical College, Cooch Behar ",
      "Burdwan Medical College, Burdwan ",
      "College of Medicine and Sagore Dutta Hospital, Kolkata "
    ];

    State["Andaman & Nicobar Islands"] = [
      "ICMR-Regional Medical Research Centre, Port Blair ",
      "A&N Islands Institute of Medical Sciences, Port Blair ",
      "GB Pant Hospital, Port Blair"
    ];

    State["Dadra & Nagar Haveli"] = [
      "Shri Vinoba Bhave Civil Hospital, Silvassa "
    ];

    State["Sikkim"] = [
      "Virus Research and Diagnostic Laboratory, STNM Hospital, Gangtok ",
      "Intermediate Reference Laboratory, STNM Hospital, Gangtok "
    ];

    State["Leh-Ladakh"] = ["Sonam Nurboo Memorial Hospital, Leh"];

    return State[st];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: s ? Colors.grey[900] : Colors.white,
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
        title: Text("Testing centres"),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25.0,
                ),
                Text(
                  "Testing Centres",
                  style: GoogleFonts.ubuntu(
                    fontSize: 15,
                    color: s ? Colors.grey[300] : Colors.grey,
                  ),
                ),
              ],
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
                      padding: EdgeInsets.all(16),
                      child: DropDownFormField(
                        titleText: '',
                        hintText: 'Please choose your state',
                        value: _myActivity,
                        onSaved: (value) {
                          setState(() {
                            _myActivity = value;
                            _centre = _stateSelector(_myActivity);
                          });
                          print(_centre);
                        },
                        onChanged: (value) {
                          setState(() {
                            _myActivity = value;
                            _centre = _stateSelector(_myActivity);
                          });
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
              height: 20,
            ),
            Container(
              child: Column(
                children: _centre
                    .map<Widget>((ss) => Card(
                          elevation: 0.0,
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            onTap: () {
                              launchMap(ss);
                            },
                            leading: Icon(
                              Icons.science,
                              color: c,
                            ),
                            trailing: Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                            title: Text(
                              ss,
                              style: GoogleFonts.ubuntu(
                                  color: s ? Colors.white : Colors.black),
                            ),
                            subtitle: Text(
                              "Click here to locate ",
                              style: GoogleFonts.ubuntu(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
