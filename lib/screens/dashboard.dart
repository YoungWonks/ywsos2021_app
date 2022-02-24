import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ywsos2021_app/screens/stats.dart';
import "package:ywsos2021_app/screens/dashboard.dart";

class Dashboard extends StatefulWidget {
  static const routeName = '/Dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}
void NewPosts(){
  print("new Posts");
}
// void moveToStats()async{
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) => stats()));
//
//   setState(() {});
//   print("hello World");
// }
void GetData() async{
  // var token = await _secureStorage.read(key: "token");
  print("Hello WOrld");
  // var response = await http.get(Uri.parse("http://192.168.0.167:5000/api/auth/token"), headers: {"content-type": "application/json", "TOKEN": token.toString()});
  // response= jsonDecode(response.body);
  // print(response);
  // var decodedresponse = jsonDecode(response.body); use later for token
  // if (decodedresponse["error"] == "0") {
  //   await _secureStorage.write(key: "token", value: decodedresponse["token"]);
  //   Navigator.pushReplacementNamed(context, '/home');
  // } else {
  //   print(decodedresponse["message"]);
  // }
}
class _DashboardState extends State<Dashboard> {
  @override
  void initState(){
    super.initState();
    GetData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFC9982),
                Color(0xFF4F8190),
              ]),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF64919F),
                      Color(0xFF5C745C),
                      Color(0xFF97AC94),
                    ]),
              ),
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                fit: BoxFit.fill,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(35.0),
            //   child: Container(
            //     padding: const EdgeInsets.all(5.0),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20.0),
            //       gradient: LinearGradient(
            //         colors: [
            //           Color(0xFF7C9882),
            //           Color(0xFFACC9AE),
            //           Color(0xFF4F8190),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 100.0),
              child: Stack(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 560,
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
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 90),
              child: Column(
                children: [
                  Text(
                    "New Scans:",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 640),
              child: Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                      height: 30,
                      width: 120,
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
                      ),
                    ),
                      Padding(padding: const EdgeInsets.only(left: 25,top: 5),child: Text("Dashboard")),
              ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              // onTap: moveToStats(),
              child: Padding(
                padding: const EdgeInsets.only(left: 225.0, top: 640),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 120,
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
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 40,top: 5),child: Text("Stats")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}