import 'package:ywsos2021_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
// const HomeScreen({Key? key}) : super(key: key);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  var click = 0 ;

  void GoLogOn() async {
    print("home");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen()));

    setState(() {});
    click=0;
  }
  void GoHome() async{
    print("home");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()));

    setState(() {});
    click=0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onTap: (){
                    print("homescreen");
                    //If Click Variable =0, Call function for home screen, set click to 1
                    if(click==0)
                      GoHome();
                      click=1;
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
                    if(click==0)
                      GoLogOn();
                      click=1;
                    //If Click Variable =0, Call function for home screen, set click to 1
                  },
                ),
              ],
            ),
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
        // actions: [
        //   IconButton(
        //     onPr
        // ],
      ),
    );
  }
}
