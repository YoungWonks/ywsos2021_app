import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static final String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF97AC94),
            Color(0xFF5C745C),
            // Color(0xFFA2C08B),
            // Color(0xFF82C1D6),
            Color(0xFF64919F),
          ],
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // stops: [0.4,0.5,1],
              colors: [
                Color.fromRGBO(201, 227, 181, 0.8),
                Color.fromRGBO(255, 255, 255, 0.6),
                Color.fromRGBO(100, 145, 159, 0.8)
                // Color(0xFFFFFFFF),

                // Color(0xFFA2C08B),
                // Color(0xFF82C1D6),
                // Color(0xFF64919F),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pending Scans:'),
                  Text('Resolved Scans: '),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
