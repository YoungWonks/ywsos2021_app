// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ywsos2021_app/screens/dashboard_screen.dart';
// import 'package:ywsos2021_app/widgets/custom_appbar.dart';
// import 'package:ywsos2021_app/widgets/opening_button.dart';

// class StatsScreen extends StatefulWidget {
//   static const routeName = '/stats';
//   const StatsScreen({Key? key}) : super(key: key);

//   @override
//   _StatsScreenState createState() => _StatsScreenState();
// }

// void newPosts() {
//   print("new Posts");
// }

// void moveToStats() async {
//   // Navigator.pushNamed(context, "stats");
// }
// void getData() async {
//   // var token = await _secureStorage.read(key: "token");
//   print("Hello WOrld");
//   // var response = await http.get(Uri.parse("http://192.168.0.167:5000/api/auth/token"), headers: {"content-type": "application/json", "TOKEN": token.toString()});
//   // response= jsonDecode(response.body);
//   // print(response);
//   // var decodedresponse = jsonDecode(response.body); use later for token
//   // if (decodedresponse["error"] == "0") {
//   //   await _secureStorage.write(key: "token", value: decodedresponse["token"]);
//   //   Navigator.pushReplacementNamed(context, '/home');
//   // } else {
//   //   print(decodedresponse["message"]);
//   // }
// }

// class _StatsScreenState extends State<StatsScreen> {
//   var NScansResolved = 0;
//   var NscansPending = 0;
//   var NUpvotes = 0;

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       key: _scaffoldKey,
//       appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFFC9982),
//                 Color(0xFF4F8190),
//               ]),
//         ),
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0xFF64919F),
//                       Color(0xFF5C745C),
//                       Color(0xFF97AC94),
//                     ]),
//               ),
//               width: double.infinity,
//               height: double.infinity,
//               child: FittedBox(
//                 fit: BoxFit.fill,
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(35.0),
//             //   child: Container(
//             //     padding: const EdgeInsets.all(5.0),
//             //     decoration: BoxDecoration(
//             //       borderRadius: BorderRadius.circular(20.0),
//             //       gradient: LinearGradient(
//             //         colors: [
//             //           Color(0xFF7C9882),
//             //           Color(0xFFACC9AE),
//             //           Color(0xFF4F8190),
//             //         ],
//             //       ),
//             //     ),
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(top: 25.0, left: 60.0),
//               child: Stack(
//                 children: [
//                   Text(
//                     "User Statistics",
//                     style: TextStyle(
//                       fontSize: 45.83,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 25.0, top: 70),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 560,
//                     width: 360,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         gradient: LinearGradient(
//                           colors: [
//                             Color(0xFF7C9882),
//                             Color(0xFFACC9AE),
//                             Color(0xFF4F8190),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 70, top: 90),
//               child: Column(
//                 children: [
//                   Text(
//                     "Number of Scans Pending: $NscansPending",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Padding(padding: const EdgeInsets.only(top: 165)),
//                   Text(
//                     "Number of Scans Resolved: $NScansResolved",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Padding(padding: const EdgeInsets.only(top: 165)),
//                   Text(
//                     "Number of Upvotes: $NUpvotes",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontFamily: "Inter",
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 OpeningButton(
//                     text: 'Dashboard',
//                     onPressed: () {
//                       Navigator.of(context)
//                           .pushReplacementNamed(DashboardScreen.routeName);
//                     }),
//                 OpeningButton(text: 'Stats', onPressed: () {})
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ywsos2021_app/screens/stats_screen.dart';
import 'package:ywsos2021_app/screens/dashboard_screen.dart';
import 'package:ywsos2021_app/widgets/custom_appbar.dart';
import 'package:ywsos2021_app/widgets/custom_drawer.dart';
import 'package:ywsos2021_app/widgets/opening_button.dart';

class StatsScreen extends StatefulWidget {
  static const routeName = '/dashboard';
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OpeningButton(
                    text: "Dashboard",
                    onPressed: () {},
                  ),
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
