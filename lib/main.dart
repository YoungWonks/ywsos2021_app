import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:ywsos2021_app/screens/opening_screen.dart';
import 'package:ywsos2021_app/screens/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      //add routes:,
      home: OpeningScreen(),
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        CreateAccountScreen.routeName: (_) => CreateAccountScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
    );
  }
}
