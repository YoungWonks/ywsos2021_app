import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/login_screen.dart';

import 'package:ywsos2021_app/widgets/create_account_form.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register_screen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isCreateAccountClicked = false;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();

  void postRegister() async {
    var header = {"Content-Type": "application/json;charset=UTF-8"};
    var body = {
      "username": _nameTextController.text,
      "password": _passwordTextController.text
    };
    var response = await http.post(Uri.parse("${serverurl}api/auth/signup"),
        headers: header, body: json.encode(body));

    var decodedresponse = jsonDecode(response.body);
    if (decodedresponse["error"] == "0") {
      if (mounted) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    } else {
      if (mounted) {
        print(decodedresponse);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(decodedresponse["message"]),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20),
        ));
      }
    }
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  var click = 0;
  var serverurl = "https://georepair.herokuapp.com/";

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(177, 222, 186, 1.0),
      Color.fromRGBO(135, 175, 187, 0.71)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
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
                    './assets/images/background_layer_2.png',
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    // scale:
                    // fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Card( child
                  Text(
                    "Sign Up",
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
                          child: CreateAccountForm(
                              formKey: _formKey,
                              passwordTextController: _passwordTextController,
                              confirmPasswordController:
                                  _confirmPasswordController,
                              nameTextController: _nameTextController,
                              onSubmit: () async {
                                postRegister();
                              }),
                        ),
                      ),
                    ),
                  ),
                  //),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text("Already have an account?"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: Text(
                            'Log In Here!',
                            style: TextStyle(
                                fontSize: 21.0,
                                // fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = linearGradient),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
