import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: InkWell(
          onTap: () {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!.openEndDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
          child: Image.asset('./assets/images/drawer_icon.png')),
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
              'TATA',
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
          './assets/images/profile_pic.png',
          width: 55,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40);
}
