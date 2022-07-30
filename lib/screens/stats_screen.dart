import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ywsos2021_app/screens/stats_screen.dart';
import 'package:ywsos2021_app/widgets/custom_appbar.dart';
import 'package:ywsos2021_app/widgets/custom_drawer.dart';
import 'package:ywsos2021_app/widgets/opening_button.dart';

class StatsScreen extends StatefulWidget {
  static const routeName = '/stats';
  const StatsScreen({Key? key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    super.initState();
    // getData();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        backgroundColor: Colors.transparent,
        // extendB odyBehindAppBar: true,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
        // drawer: CustomDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                "Dashboard",
                style: TextStyle(
                  fontSize: 45.83,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Center(
                child: SizedBox(
                  height: 540,
                  width: 360,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7C9882),
                          Color(0xFFACC9AE),
                          Color(0xFF4F8190),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70, top: 90),
                      child: Column(
                        children: [
                          Text(
                            "Number of Scans Pending: ",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 165)),
                          Text(
                            "Number of Scans Resolved: ",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 165)),
                          Text(
                            "Number of Upvotes: ",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OpeningButton(
                    text: "Stats",
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(StatsScreen.routeName);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
