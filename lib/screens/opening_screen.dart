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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                './assets/images/full_image.png',
                width: MediaQuery.of(context).size.width * 0.95,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Click, Calculate',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Text(
                  'and Repair',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => RegisterScreen(),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      primary: Color(0xFF97AC94),
                      padding: EdgeInsets.only(
                          left: 41,
                          right: 41,
                          top: 14,
                          bottom: 20) // foreground
                      ),
                ),
                SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  ),
                  child: Text(
                    "Sign In",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
                  ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
