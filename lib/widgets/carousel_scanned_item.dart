import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:ywsos2021_app/providers/scans.dart';

class CarouselScannedItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  final String daysAgo;
  final List<Placemark> location;
  final bool status;
  final int upVote;
  final bool? ifPersonUpVoted;
  final String id;
  const CarouselScannedItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.daysAgo,
    required this.location,
    required this.status,
    required this.upVote,
    required this.ifPersonUpVoted,
    required this.id,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    widget.subTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.0,
                      color: Color(0xFF979797),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 14.0,
                        color: Color(0xFF6C9794),
                      ),
                      Text(
                        widget.daysAgo,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF6C9794),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.pin_drop),
                      Expanded(
                        child: Text(
                          '${widget.location[0].name}, ${widget.location[0].country}',
                        ),
                      ),
                    ],
                  ),
                  !widget.status
                      ? Text(
                          'Status: Pending',
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(
                          'Status: Resolved',
                          style: TextStyle(color: Colors.green),
                        ),
                  InkWell(
                    onTap: () {
                      Provider.of<Scans>(context, listen: false)
                          .upvotePost(widget.id, context);
                      Provider.of<Scans>(context, listen: false)
                          .getUserScans(context);
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        widget.ifPersonUpVoted!
                            ? Icon(Icons.thumb_up)
                            : Icon(Icons.thumb_up_outlined),
                        Text(' ${widget.upVote} Upvotes')
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.memory(
                  Base64Codec().decode(widget.image),
                ),
              ),
            ),
          ],
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
