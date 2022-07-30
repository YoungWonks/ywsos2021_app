import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ywsos2021_app/screens/account_settings_screen.dart';
import 'package:ywsos2021_app/screens/add_photo_gallery_screen.dart';
import 'package:ywsos2021_app/screens/forum_screen.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:ywsos2021_app/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  final TextStyle drawerTextStyle = TextStyle(
      fontWeight: FontWeight.w700, color: Colors.white, fontSize: 37.0);

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF97AC94),
              Color(0xFF5C745C),
              // Color(0xFFA2C08B),
              // Color(0xFF82C1D6),
              Color(0xFF64919F),
            ],
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Text(
                    'GeoRepair',
                    style: drawerTextStyle,
                  ),
                  SizedBox(
                    width: 18.0,
                  ),
                  Image.asset(
                    'assets/hammer.png',
                    width: 45.96,
                    height: 44.35,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xFFDFF6D8),
                  size: 64,
                ),
                title: Text(
                  'Home',
                  style: drawerTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(EditProfileScreen.routeName);
              },
              child: ListTile(
                leading: Image.asset(
                  'assets/images/profile_pic.png',
                  width: 64,
                ),
                title: Text(
                  'Edit Profile',
                  style: drawerTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(AddPhotoGalleryScreen.routeName);
              },
              child: ListTile(
                leading: Icon(
                  Icons.upload,
                  size: 64,
                  color: Color(0xFFDFF6D8),
                ),
                title: Text(
                  'Upload',
                  style: drawerTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ForumScreen.routeName);
              },
              child: ListTile(
                leading: Icon(
                  Icons.photo_size_select_actual,
                  size: 64,
                  color: Color(0xFFDFF6D8),
                ),
                title: Text(
                  'Gallery',
                  style: drawerTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                _secureStorage.deleteAll();
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color(0xFFDFF6D8),
                  size: 64,
                ),
                title: Text(
                  'Sign Out',
                  style: drawerTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
