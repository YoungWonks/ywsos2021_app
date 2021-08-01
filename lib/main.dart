import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ywsos2021_app/providers/scans.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:ywsos2021_app/screens/opening_screen.dart';
import 'package:ywsos2021_app/screens/register_screen.dart';
import 'package:ywsos2021_app/screens/take_picture_screen.dart';

import 'screens/login_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Scans(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //add routes:,
        home: HomeScreen(),
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          RegisterScreen.routeName: (_) => RegisterScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          TakePictureScreen.routeName: (_) => TakePictureScreen(),
        },
      ),
    );
  }
}
