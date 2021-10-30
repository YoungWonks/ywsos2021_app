import 'package:flutter/material.dart';
import 'package:ywsos2021_app/screens/add_photo_gallery_screen.dart';
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
    onTap: (context) {
      Navigator.of(context).pushNamed(AddPhotoGalleryScreen.routeName);
    },
    title: 'Gallery',
    subTitle: '',
    image: Image.asset(
      './assets/images/file_folder.png',
      height: 110,
    ),
  ),
  CarouselActionItem(
    onTap: (context) {
      Navigator.of(context).pushNamed(AddPhotoGalleryScreen.routeName);
    },
    title: 'Share',
    subTitle: '',
    image: Icon(
      Icons.share,
      color: Colors.white.withOpacity(.6),
      size: 110,
    ),
  ),
  CarouselActionItem(
      onTap: (context) {
        Navigator.of(context).pushNamed(AddPhotoGalleryScreen.routeName);
      },
      title: 'Edit Profile',
      subTitle: '',
      image: Icon(
        Icons.person,
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
