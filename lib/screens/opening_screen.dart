import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/login_screen.dart';
import 'package:ywsos2021_app/screens/register_screen.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({Key? key}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GeoRepair',
                style: TextStyle(fontSize: 45),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                './assets/hammer.png',
                width: 45.96,
                height: 44.35,
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 400,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 8.0,
                  ),
                ],
                shape: BoxShape.circle,
                color: Color(0xFF97AC94),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 55,
                    left: 81,
                    child: Image.asset(
                      './assets/images/fire_hydrant.png',
                      height: 160.15,
                      width: 199.7,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      './assets/images/holding_phone.png',
                      height: 287.73,
                      width: 264.69,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'Click, Calculate \n and Repair',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text("Sign Up"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    primary: Color(0xFF97AC94), // background
                    onPrimary: Colors.white,
                    padding: EdgeInsets.only(
                      left: 41,
                      right: 41,
                      top: 14,
                      bottom: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text("Sign In"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      primary: Color(0xFF97AC94), // background
                      onPrimary: Colors.white,
                      padding: EdgeInsets.only(
                          left: 41,
                          right: 41,
                          top: 14,
                          bottom: 20) // foreground
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
