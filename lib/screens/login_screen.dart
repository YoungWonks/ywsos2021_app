import 'package:flutter/material.dart';
import 'package:ywsos2021_app/widgets/create_account_form.dart';
import 'package:ywsos2021_app/widgets/login_form.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCreateAccountClicked = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  var click = 0;

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
        drawer: Drawer(
          child: Container(
            color: Colors.blueAccent,
            child: ListView(
              children: [
                ListTile(
                  title: Text("Options"),
                ),
                ListTile(
                  title: Text("Home Screen"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    print("homescreen");
                    //If Click Variable =0, Call function for home screen, set click to 1
                    if (click == 0) GoHome();
                    click = 1;
                  },
                ),
                ListTile(
                  title: Text("Add a Complaint"),
                  leading: Icon(Icons.error),
                  onTap: () {
                    print("Complaint");
                    //If Click Variable =0, Call function for home screen, set click to 1
                  },
                ),
                ListTile(
                  title: Text("Login"),
                  leading: Icon(Icons.login),
                  onTap: () {
                    print("Login");
                    if (click == 0) GoLogOn();
                    click = 1;
                    //If Click Variable =0, Call function for home screen, set click to 1
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.teal,
                ),
              ),
              Column(children: [
                Text(
                  isCreateAccountClicked != true ? 'Sign In' : 'Sign Up',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: isCreateAccountClicked != true
                          ? LoginForm(
                              formKey: _formKey,
                              emailTextController: _emailTextController,
                              passwordTextController: _passwordTextController,
                            )
                          : CreateAccountForm(
                              formKey: _formKey,
                              emailTextController: _emailTextController,
                              passwordTextController: _passwordTextController,
                            ),
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.portrait_rounded),
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (!isCreateAccountClicked) {
                            isCreateAccountClicked = true;
                          } else
                            isCreateAccountClicked = false;
                        });
                      },
                      label: Text(
                        isCreateAccountClicked
                            ? 'Already have an account?'
                            : 'Create Account',
                      ),
                    ),
                  ],
                )
              ]),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
