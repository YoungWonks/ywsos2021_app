import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:jiffy/jiffy.dart';
import 'package:objectid/objectid.dart';
import 'package:ywsos2021_app/widgets/carousel_scanned_item.dart';

class ScanPosition {
  final double lat;
  final double long;

  ScanPosition(this.lat, this.long);
}

class Scan {
  final ObjectId id;
  final Uint8List fileContents;
  final int upVote;
  final ScanPosition scanPosition;
  final String scanDate;
  final String title;
  final String urgency;

  Scan({
    required this.id,
    required this.fileContents,
    required this.upVote,
    required this.scanPosition,
    required this.scanDate,
    required this.title,
    required this.urgency,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "filename": fileContents,
      "upvote": upVote,
      "scanposition": scanPosition,
      "scandate": scanDate,
      "title": title,
      "urgency": urgency,
    };
  }

  factory Scan.fromMap(Map<String, dynamic> map) {
    return Scan(
      id: map['id'],
      upVote: map['upvote'],
      fileContents: map['filename'],
      scanDate: map['scandate'],
      scanPosition: map['scanposition'],
      title: map['title'],
      urgency: map['urgency'],
    );
  }
}
