import 'package:flutter/material.dart';
import 'package:fpmobilelaptop/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

// ignore: camel_case_types
class splashscreen_page extends StatelessWidget {
  const splashscreen_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LoginPage(),
      backgroundColor: Color(0xff0F1722),
      image: Image.asset('images/valorant-red.png'),
      title: new Text('Loading Please Wait',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      photoSize: 150.0,
    );
  }
}
