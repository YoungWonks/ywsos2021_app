import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? username;

  void getUsername() async {
    final _secureStorage = FlutterSecureStorage();

    username = await _secureStorage.read(key: "username");
    setState(() {});
  }

  @override
  void initState() {
    getUsername();
    super.initState();
  }
  // Map<String, dynamic>? username;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: InkWell(
          onTap: () {
            widget._scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset('assets/images/drawer_icon.png')),
      elevation: 0,
      centerTitle: true,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              username.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  color: Colors.black),
            ),
            Text(
              'Personal profile',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 9.0,
                color: Colors.white.withOpacity(0.77),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          'assets/images/profile_pic.png',
          width: 55,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
