// import 'package:flutter/material.dart';
// import 'package:ywsos2021_app/screens/home_screen.dart';
// import 'package:ywsos2021_app/widgets/build_input_decoration.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool isLogin = true;
//   TextEditingController _emailTextController = TextEditingController();

//   TextEditingController _passwordTextController = TextEditingController();

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     _emailTextController.dispose();
//     _passwordTextController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _emailTextController,
//               decoration: buildInputDecoration(
//                   label: 'Email', hintText: 'john@gmail.com'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _passwordTextController,
//               decoration: buildInputDecoration(label: 'Password', hintText: ''),
//             ),
//           ),
//           TextButton(
//             style: TextButton.styleFrom(
//               primary: Colors.white,
//               padding: EdgeInsets.all(15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               backgroundColor: Colors.amber,
//               textStyle: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (_) => HomeScreen(),
//                   ),
//                 );
//               }
//             },
//             child: Text('Sign In'),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ywsos2021_app/widgets/create_account_form.dart';
import 'package:ywsos2021_app/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
    );
  }
}
