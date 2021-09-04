import 'dart:typed_data';

import 'package:flutter/material.dart';

class CarouselScannedItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final Uint8List image;
  const CarouselScannedItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  @override
  _CarouselScannedItemState createState() => _CarouselScannedItemState();
}

class _CarouselScannedItemState extends State<CarouselScannedItem> {
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
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13.0,
                ),
              ),
              Text(
                widget.subTitle,
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
                widget.image,
                height: 110,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
