import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import 'build_input_decoration.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _formKey = formKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email';
                }
                if (!value.contains('@') || !value.contains('.com')) {
                  return 'Please enter a valid email';
                }
              },
              controller: _emailTextController,
              decoration: buildInputDecoration(
                  label: 'Enter Email', hintText: 'john@me.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length <= 8) {
                  return 'Please enter a password that is greater than 8 characters in length';
                }
              },
              controller: _passwordTextController,
              decoration:
                  buildInputDecoration(label: 'Enter Password', hintText: ''),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: Colors.amber,
              textStyle: TextStyle(
                fontSize: 18,
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                );
              }
            },
            child: Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
