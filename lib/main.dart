import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/dashboard_screen.dart';
import 'package:ywsos2021_app/screens/forum_screen.dart';

import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:ywsos2021_app/screens/opening_screen.dart';
import 'package:ywsos2021_app/screens/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/scans.dart';
import 'screens/add_photo_gallery_screen.dart';
import 'screens/home_screen.dart';
import 'screens/opening_screen.dart';
import 'screens/register_screen.dart';
import 'screens/take_picture_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/stats_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Scans(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: DashboardScreen(),
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          RegisterScreen.routeName: (_) => RegisterScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          TakePictureScreen.routeName: (_) => TakePictureScreen(),
          AddPhotoGalleryScreen.routeName: (_) => AddPhotoGalleryScreen(),
          ForumScreen.routeName: (_) => ForumScreen(),
          DashboardScreen.routeName: (_) => DashboardScreen(),
          StatsScreen.routeName: (_) => StatsScreen(),
        },
      ),
    );
  }
}
