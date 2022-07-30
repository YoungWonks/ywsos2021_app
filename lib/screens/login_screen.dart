import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/register_screen.dart';
import 'package:ywsos2021_app/utils/variables.dart';

import 'package:ywsos2021_app/widgets/login_form.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCreateAccountClicked = false;
  final _secureStorage = FlutterSecureStorage();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  var click = 0;

  void postRegister() async {
    print("posting register info");
    print(_emailTextController.text);
    print(_passwordTextController.text);
    var header = {"Content-Type": "application/json;charset=UTF-8"};
    var body = {
      "username": _emailTextController.text,
      "password": _passwordTextController.text
    };
    var response = await http.post(Uri.parse("$indexUrl/api/auth/token"),
        headers: header, body: jsonEncode(body));
    var decodedresponse = jsonDecode(response.body);
    if (decodedresponse["error"] == "0") {
      await _secureStorage.write(key: "token", value: decodedresponse["token"]);
      await _secureStorage.write(key: "username", value: body['username']);
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      Flushbar(
        title: 'Error occured Logging in',
        message: decodedresponse['message'],
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.red[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.red[300],
      )..show(context);
    }
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  void GoLogOn() async {
    print("home");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));

    setState(() {});
    click = 0;
  }

  void GoHome() async {
    print("home");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));

    setState(() {});
    click = 0;
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF64919F),
                Color(0xFF5C745C),
                Color(0xFF97AC94),
              ],
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'assets/images/background_layer_2.png',
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // scale:
                    // fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       'assets/images/',
              //     ),
              //   ],
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Card( child
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 46.78,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF7C9882),
                            Color(0xFFACC9AE),
                            Color(0xFF4F8190),
                          ],
                        ),
                      ),
                      child: Container(
                        child: Container(
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
                          child: LoginForm(
                            formKey: _formKey,
                            emailTextController: _emailTextController,
                            passwordTextController: _passwordTextController,
                            onSubmit: postRegister,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text("New to GeoRepair?"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          child: Text("Create an Account Here."),
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterScreen.routeName);
                          })
                    ],
                  ),
                ],
              ),
              //   Column(
              //   children: [
              //
              //     Column(children: [
              //       Text(
              //         isCreateAccountClicked != true ? 'Sign In' : 'Sign Up',
              //         style: Theme.of(context).textTheme.headline5,
              //       ),
              //       Column(
              //         children: [
              //           SizedBox(
              //             width: 300,
              //             height: 300,
              //             child: isCreateAccountClicked != true
              //                 ? LoginForm(
              //                     formKey: _formKey,
              //                     emailTextController: _emailTextController,
              //                     passwordTextController: _passwordTextController,
              //                   )
              //                 : CreateAccountForm(
              //                     formKey: _formKey,
              //                     emailTextController: _emailTextController,
              //                     passwordTextController: _passwordTextController,
              //                   ),
              //           ),
              //           TextButton.icon(
              //             icon: Icon(Icons.portrait_rounded),
              //             style: TextButton.styleFrom(
              //               primary: Colors.red,
              //               textStyle: TextStyle(
              //                 fontSize: 18,
              //                 fontStyle: FontStyle.italic,
              //               ),
              //             ),
              //             onPressed: () {
              //               setState(() {
              //                 if (!isCreateAccountClicked) {
              //                   isCreateAccountClicked = true;
              //                 } else
              //                   isCreateAccountClicked = false;
              //               });
              //             },
              //             label: Text(
              //               isCreateAccountClicked
              //                   ? 'Already have an account?'
              //                   : 'Create Account',
              //             ),
              //           ),
              //         ],
              //       )
              //     ]),
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
