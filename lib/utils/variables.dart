import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/add_photo_gallery_screen.dart';
import 'package:ywsos2021_app/screens/dashboard_screen.dart';
import 'package:ywsos2021_app/screens/forum_screen.dart';
import 'package:ywsos2021_app/screens/take_picture_screen.dart';
import 'package:ywsos2021_app/widgets/carosoul_action_item.dart';

final List<Widget> carouselItems = [
  CarouselActionItem(
    onTap: (context) =>
        Navigator.of(context).pushNamed(TakePictureScreen.routeName),
    title: 'New Scan',
    subTitle: '',
    image: Image.asset('./assets/images/bar_code.png'),
  ),
  CarouselActionItem(
    onTap: (context) =>
        Navigator.of(context).pushNamed(AddPhotoGalleryScreen.routeName),
    title: 'Upload',
    subTitle: '',
    image: Icon(Icons.upload, color: Colors.white.withOpacity(.6), size: 110),
  ),
  CarouselActionItem(
    onTap: (context) {
      Navigator.of(context).pushNamed(ForumScreen.routeName);
    },
    title: 'Forum',
    subTitle: '',
    image: Image.asset(
      './assets/images/file_folder.png',
      height: 110,
    ),
  ),
  CarouselActionItem(
      onTap: (context) {
        Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
      },
      title: 'Dashboard',
      subTitle: '',
      image: Icon(
        Icons.dashboard,
        color: Colors.white.withOpacity(.6),
        size: 110,
      )),
  CarouselActionItem(
    title: 'Logout',
    subTitle: '',
    image: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Icon(
        Icons.logout,
        size: 80,
        color: Colors.white.withOpacity(.6),
      ),
    ),
    onTap: (context) {},
  )
];
