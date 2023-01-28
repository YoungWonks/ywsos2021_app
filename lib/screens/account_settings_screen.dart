import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:ywsos2021_app/utils/variables.dart';
import 'package:ywsos2021_app/widgets/opening_button.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/edit-profile';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _usernameFormKey = GlobalKey<FormState>();

  final _passwordFormKey = GlobalKey<FormState>();

  final TextEditingController _changeUsernameController =
      TextEditingController();

  final TextEditingController _currentPasswordController =
      TextEditingController();

  final TextEditingController _newPasswordController = TextEditingController();

  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  final TextEditingController _confirmDeleteController =
      TextEditingController();

  @override
  void dispose() {
    _changeUsernameController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void changeUsername(String username) async {
      final _secureStorage = FlutterSecureStorage();
      try {
        final token = await _secureStorage.read(key: "token");
        print(token);
        final response = await http.post(
            Uri.parse('$indexUrl/api/change_username'),
            body: json.encode({"username": username}),
            headers: {
              "content-type": "application/json",
              "TOKEN": token.toString()
            });

        final extractedData = json.decode(response.body);
        print(extractedData);
        if (extractedData == null || int.parse(extractedData['error']) != 0) {
          Flushbar(
            title: 'Error occured Changing username',
            message: extractedData['message'],
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.red[300],
            ),
            duration: Duration(seconds: 5),
            leftBarIndicatorColor: Colors.red[300],
          )..show(context);
          return;
        }
        await _secureStorage.write(key: "username", value: username);
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        Flushbar(
          title: "It worked!",
          message: extractedData['message'],
          icon: Icon(
            Icons.check_circle_outline,
            size: 28.0,
            color: Colors.green[300],
          ),
          duration: Duration(seconds: 5),
          leftBarIndicatorColor: Colors.green[300],
        )..show(context);
      } catch (e) {
        Flushbar(
          title: 'Error occured Changing username',
          message: "An error occured.",
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 5),
          leftBarIndicatorColor: Colors.red[300],
        )..show(context);
      }
    }

    void changePassword(String oldPassword, String newPassword) async {
      try {
        final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
        final token = await _secureStorage.read(key: "token");
        final response = await http.post(
            Uri.parse('$indexUrl/api/change_password'),
            body: json.encode({"oldPass": oldPassword, "newPass": newPassword}),
            headers: {
              "content-type": "application/json",
              "TOKEN": token.toString()
            });
        final extractedData = json.decode(response.body);
        if (_newPasswordController.text != _confirmNewPasswordController.text) {
          Flushbar(
            title: 'Error occured Changing password',
            message: 'The new password and confirm new password don\'t match.',
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.red[300],
            ),
            duration: Duration(seconds: 5),
            leftBarIndicatorColor: Colors.red[300],
          )..show(context);
          return;
        }
        if (extractedData == null || extractedData['error'] != 0) {
          Flushbar(
            title: 'Error occured Changing password',
            message: extractedData['message'],
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.red[300],
            ),
            duration: Duration(seconds: 5),
            leftBarIndicatorColor: Colors.red[300],
          )..show(context);
          return;
        }

        Flushbar(
          title: "It worked!",
          message: "Successfully changed the password",
          icon: Icon(Icons.check_circle_outline,
              size: 28.0, color: Colors.green[300]),
          duration: Duration(seconds: 5),
          leftBarIndicatorColor: Colors.green[300],
        );
      } catch (e) {
        Flushbar(
          title: 'Error occured Changing password',
          message: 'An error occured.',
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 5),
        )..show(context);
      }
    }

    void deleteAccount() async {
      try {
        final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
        final token = await _secureStorage.read(key: "token");
        final response = await http.post(Uri.parse('$indexUrl/api/delete_user'),
            headers: {
              "content-type": "application/json",
              "TOKEN": token.toString()
            });
        final extractedData = json.decode(response.body);
        if (extractedData['error'] != 0) {
          Flushbar(
            title: 'Error occured deleting account',
            message: extractedData['message'],
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.red[300],
            ),
            duration: Duration(seconds: 5),
          )..show(context);
          return;
        }
        _secureStorage.deleteAll();
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        Flushbar(
          title: "It worked!",
          message: "You successfully deleted your account",
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 5),
        )..show(context);
      } catch (e) {
        Flushbar(
          title: 'Error occured deleting account',
          message: 'An error occured.',
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.red[300],
          ),
          duration: Duration(seconds: 5),
        )..show(context);
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: AppDrawer(),
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      body: Container(
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
            title: Text(
              'Change Your Account Info',
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Form(
                            key: _usernameFormKey,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Change Username',
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: _changeUsernameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type something as a username';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Change Username',
                                    hintStyle: TextStyle(color: Colors.white),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                OpeningButton(
                                  text: 'Change Username',
                                  onPressed: () {
                                    changeUsername(
                                        _changeUsernameController.text);
                                  },
                                )
                              ],
                            )),
                        const Divider(
                          thickness: 2,
                          height: 20,
                        ),
                        Form(
                            key: _passwordFormKey,
                            child: Column(
                              children: [
                                Text('Current Password'),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _currentPasswordController,
                                  decoration: InputDecoration(
                                    hintText: 'Current Password',
                                    hintStyle: TextStyle(color: Colors.white),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('New Password'),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _newPasswordController,
                                  decoration: InputDecoration(
                                    hintText: 'New Password',
                                    hintStyle: TextStyle(color: Colors.white),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Confirm New Password'),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _confirmNewPasswordController,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(color: Colors.white),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                OpeningButton(
                                    text: 'Change Password',
                                    onPressed: () {
                                      changePassword(
                                          _currentPasswordController.text,
                                          _newPasswordController.text);
                                    })
                              ],
                            )),
                        const Divider(
                          thickness: 2, // thickness of the line

                          height: 20, // The divider's height extent.
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (_confirmDeleteController.text ==
                                            'Delete') {
                                          deleteAccount();
                                          return;
                                        }
                                        Flushbar(
                                          title:
                                              'Please type the word "Delete"',
                                        )..show(context);
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                  ],
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Are you sure you want to delete your account? If yes, please type the word "Delete"',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextField(
                                          controller: _confirmDeleteController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: '',
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ]),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, elevation: 5),
                          child: Text(
                            'Delete Account',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
