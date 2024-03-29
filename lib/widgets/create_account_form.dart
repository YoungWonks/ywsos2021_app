import 'package:flutter/material.dart';

class CreateAccountForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordTextController;
  final TextEditingController nameTextController;
  final TextEditingController confirmPasswordController;
  final Function onSubmit;

  CreateAccountForm({
    Key? key,
    required this.formKey,
    required this.passwordTextController,
    required this.nameTextController,
    required this.confirmPasswordController,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.all(
              10.0,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/user.png'),
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please your Full Name';
                          }
                        },
                        controller: widget.nameTextController,
                        // decoration: buildInputDecoration(
                        //     label: 'Enter Email', hintText: 'john@me.com'),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Full Name",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 5,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(151, 184, 141, 1),
                          Color.fromRGBO(172, 201, 174, 1),
                          Color.fromRGBO(100, 145, 155, 1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: 50,
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.all(
          //     10.0,
          //   ),
          //   child: Stack(
          //     alignment: Alignment.center,
          //     children: <Widget>[
          //       Row(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Image.asset('assets/images/email.png'),
          //           ),
          //           Expanded(
          //             child: TextFormField(
          //               validator: (value) {
          //                 if (value!.isEmpty) {
          //                   return 'Please enter an email';
          //                 }
          //               },
          //               controller: widget.emailTextController,
          //               // decoration: buildInputDecoration(
          //               //     label: 'Enter Email', hintText: 'john@me.com'),
          //               decoration: const InputDecoration(
          //                   border: InputBorder.none,
          //                   hintText: "Email/Username",
          //                   hintStyle: TextStyle(color: Colors.white)),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Positioned(
          //         bottom: -1,
          //         child: Container(
          //           alignment: Alignment.center,
          //           height: 5,
          //           width: MediaQuery.of(context).size.width - 100,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.circular(10),
          //               bottomRight: Radius.circular(10),
          //             ),
          //             gradient: LinearGradient(
          //               colors: [
          //                 Color.fromRGBO(151, 184, 141, 1),
          //                 Color.fromRGBO(172, 201, 174, 1),
          //                 Color.fromRGBO(100, 145, 155, 1),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Container(
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.all(
              10.0,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/key.png'),
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                        },
                        controller: widget.passwordTextController,
                        // decoration:
                        //     buildInputDecoration(label: 'Enter Password', hintText: ''),
                        decoration: InputDecoration(
                            // border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(r, g, b, opacity))),
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.white, fontFamily: "Inter")),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 5,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(151, 184, 141, 1),
                          Color.fromRGBO(172, 201, 174, 1),
                          Color.fromRGBO(100, 145, 155, 1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [Text("Must be six or more characters")],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              widget.onSubmit();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 62),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(100, 145, 159, 0.8),
                  Color.fromRGBO(201, 227, 181, 0.8),
                  // Color.fromRGBO(255, 255, 255, 0.6),
                  Color.fromRGBO(100, 145, 159, 0.8),
                ]),
              ),
              child: Text("Register"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/line.png'),
              Text("  OR  "),
              Image.asset('assets/images/line.png'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset('assets/images/facebook.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset("assets/images/google.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Image.asset("assets/images/linkedin.png"),
              ),
            ],
          ),

          // Stack(
          //   children:[
          //     ElevatedButton(
          //     child: Ink(
          //       decoration:BoxDecoration(
          //         gradient: LinearGradient(colors:[
          //           Color.fromRGBO(201, 227, 181, 0.8),
          //           Color.fromRGBO(255, 255, 255, 0.6),
          //           Color.fromRGBO(100, 145, 159, 0.8),
          //         ]),
          //       ),
          //     ),
          //     style: TextButton.styleFrom(
          //       primary: Colors.white,
          //       padding: EdgeInsets.all(15),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(4),
          //       ),
          //       textStyle: TextStyle(
          //         fontSize: 18,
          //       ),
          //
          //     ),
          //     onPressed: () {
          //       if (_formKey.currentState!.validate()) {
          //         Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(
          //             builder: (_) => HomeScreen(),
          //           ),
          //         );
          //       }
          //     },
          //
          //   ),
          //     Text("Log In"),
          //   ],
          // ),
        ],
      ),
    );
  }
}
