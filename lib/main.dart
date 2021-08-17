import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'providers/scans.dart';
import 'screens/add_photo_gallery_screen.dart';
import 'screens/home_screen.dart';
import 'screens/opening_screen.dart';
import 'screens/register_screen.dart';
import 'screens/take_picture_screen.dart';
import 'screens/login_screen.dart';

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
        ),
        home: OpeningScreen(),
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          RegisterScreen.routeName: (_) => RegisterScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          TakePictureScreen.routeName: (_) => TakePictureScreen(),
          AddPhotoGalleryScreen.routeName: (_) => AddPhotoGalleryScreen(),
        },
      ),
    );
  }
}
