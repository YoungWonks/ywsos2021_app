import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final TextStyle drawerTextStyle = TextStyle(
      fontWeight: FontWeight.w700, color: Colors.white, fontSize: 37.0);

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
                    './assets/hammer.png',
                    width: 45.96,
                    height: 44.35,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ListTile(
              leading: Image.asset(
                './assets/images/profile_pic.png',
                width: 64,
              ),
              title: Text(
                'Account',
                style: drawerTextStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
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
            SizedBox(
              height: 16,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 64,
                color: Color(0xFFDFF6D8),
              ),
              title: Text(
                'Settings',
                style: drawerTextStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
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
          ],
        ),
      ),
    );
  }
}
