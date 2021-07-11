import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarouselActionItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget image;

  CarouselActionItem(
      {required this.title, required this.subTitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(
            colors: [
              Color(0xFFC8E2B3),
              Colors.white.withOpacity(0.66),
              Color(0xFF7BA193)
            ],
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFFF7FFEE),
              fontSize: 16.11,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFFF7FFEE),
              fontSize: 9.88,
            ),
          ),
        ],
      ),
    );
  }
}
