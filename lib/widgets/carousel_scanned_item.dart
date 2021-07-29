import 'dart:typed_data';

import 'package:flutter/material.dart';

class CarouselScannedItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Uint8List image;
  final String? urgency;
  const CarouselScannedItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.urgency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 199,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Color(0xFF97B88D),
            Color(0xFFA1C6B8),
            Color(0xFF64919F),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13.0,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 8.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.memory(
                image,
                height: 110,
              ),
              SizedBox(
                height: 20,
              ),
              urgencyWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget urgencyWidget() {
    if (urgency == 'Really Urgent') {
      return Text(
        'Needs Urgent Repair',
        style: TextStyle(
          color: Color(0xFFD72F25),
          fontSize: 9.0,
          fontWeight: FontWeight.w700,
        ),
      );
    } else if (urgency == 'Kind of Urgent') {
      return Text(
        'Needs Repair',
        style: TextStyle(
          color: Color(0xFFDDE11F),
          fontSize: 9.0,
          fontWeight: FontWeight.w700,
        ),
      );
    } else {
      return Text(
        'Doesn\'t need repair',
        style: TextStyle(
          color: Color(0xFF9AEF7D),
          fontSize: 9.0,
          fontWeight: FontWeight.w700,
        ),
      );
    }
  }
}
