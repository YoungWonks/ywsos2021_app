import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:ywsos2021_app/screens/opening_screen.dart';
import 'package:ywsos2021_app/screens/register_screen.dart';

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
      ),
      //add routes:,
      home: OpeningScreen(),
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
    );
  }
}
