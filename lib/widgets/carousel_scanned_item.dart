import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class CarouselScannedItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final Uint8List image;
  final String daysAgo;
  const CarouselScannedItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.daysAgo,
  }) : super(key: key);

  @override
  _CarouselScannedItemState createState() => _CarouselScannedItemState();
}

class _CarouselScannedItemState extends State<CarouselScannedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.4,0.5,1],
          colors: [
            Color.fromRGBO(201, 227, 181, 0.8),
            Color.fromRGBO(255, 255, 255, 0.6),
            Color.fromRGBO(100, 145, 159, 0.8)
            // Color(0xFFFFFFFF),

            // Color(0xFFA2C08B),
            // Color(0xFF82C1D6),
            // Color(0xFF64919F),
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
                  fontSize: 18.0,
                ),
              ),
              Text(
                widget.subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.daysAgo,
                style: TextStyle(
                  fontSize: 8.0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Image.memory(
                widget.image,
                height: 110,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(16),
    //     gradient: LinearGradient(
    //       colors: [
    //         Color(0xFF97B88D),
    //         Color(0xFFA1C6B8),
    //         Color(0xFF64919F),
    //       ],
    //     ),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Center(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             widget.title,
    //             style: TextStyle(
    //               fontWeight: FontWeight.w700,
    //               fontSize: 18.0,
    //             ),
    //           ),
    //           Text(
    //             widget.subTitle,
    //             style: TextStyle(
    //               fontWeight: FontWeight.w500,
    //               fontSize: 12.0,
    //               color: Colors.white,
    //             ),
    //           ),
    //           Text(
    //             widget.daysAgo,
    //             style: TextStyle(
    //               fontSize: 8.0,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Image.memory(
    //             widget.image,
    //             height: 110,
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
