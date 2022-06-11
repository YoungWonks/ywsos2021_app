import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:ywsos2021_app/screens/login_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'register_screen.dart';
import '../widgets/opening_button.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  void didChangeDependencies() async {
    final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
    var _token = await _secureStorage.read(key: "token");
    if (_token != null) {
      bool hasExpired = JwtDecoder.isExpired(_token.toString());
      if (!hasExpired) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }
    }

    super.didChangeDependencies();
  }

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
                style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF).withOpacity(0.53)),
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
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
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
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'and Repair',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OpeningButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginScreen.routeName);
                      },
                      text: "Sign In",
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    OpeningButton(
                      text: "Sign Up",
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RegisterScreen.routeName);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
