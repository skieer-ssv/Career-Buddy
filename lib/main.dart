import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/onBoardingScreen.dart';
import './screens/loginScreen.dart';
import './screens/registerScreen.dart';
import './screens/homeScreen.dart';
import './screens/animatedLoginScreen.dart';

import './screens/careerPages/doctor.dart';
import './screens/careerPages/Pilot.dart';
import './screens/careerPages/Architect.dart';
import './screens/careerPages/Cricketer.dart';
import './screens/careerPages/doctoRoadMap/physicianRoadMap.dart';
import './screens/careerPages/doctoRoadMap/Cardiology.dart';
import './screens/careerPages/doctoRoadMap/Dermatologist.dart';
import './screens/careerPages/doctoRoadMap/Opthalmologist.dart';
import './screens/careerPages/doctoRoadMap/Gynecologist.dart';
import './screens/careerPages/doctoRoadMap/Gastroenternologist.dart';
import './screens/careerPages/Archeologist.dart';
import './screens/careerPages/pilotRoadMap.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Buddy',
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 32.0,
        ),
        textTheme: TextTheme(
          title: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          subtitle: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          body1: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          body2: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
          ),
          button: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
        canvasColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 32.0,
        ),
        textTheme: TextTheme(
          title: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          subtitle: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          body1: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          body2: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
          ),
          button: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        OnBoardingScreen.route: (ctx) => OnBoardingScreen(),
        MyHomePage.route: (ctx) => MyHomePage(),
        LoginScreen.route: (ctx) => LoginScreen(),
        RegisterScreen.route: (ctx) => RegisterScreen(),
        HomeScreen.route: (ctx) => HomeScreen(),
        DoctorPath.route: (ctx) => DoctorPath(),
        PilotPath.route: (ctx) => PilotPath(),
        CricketerPath.route: (ctx) => CricketerPath(),
        ArchitectPath.route: (ctx) => ArchitectPath(),
        ArcheologistPath.route: (ctx) => ArcheologistPath(),
        PhysicianRoadMap.route: (ctx) => PhysicianRoadMap(),
        CardiologistRoadMap.route: (ctx) => CardiologistRoadMap(),
        DermatologistRoadMap.route: (ctx) => DermatologistRoadMap(),
        OpthalmologistRoadMap.route: (ctx) => OpthalmologistRoadMap(),
        GynecologistRoadMap.route: (ctx) => GastroenterologistRoadMap(),
        GastroenterologistRoadMap.route: (ctx) => GastroenterologistRoadMap(),
        CommercialRoadMap.route: (ctx) => CommercialRoadMap(),
      },
      initialRoute: OnBoardingScreen.route,
    );
  }
}
