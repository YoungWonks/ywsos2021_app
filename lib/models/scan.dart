import 'dart:io';
import 'dart:typed_data';

import 'package:geocoding/geocoding.dart';

// class ScanPosition {
//   final double lat;
//   final double long;

//   ScanPosition({
//     required this.lat,
//     required this.long,
//   });
// }

enum ScansResolved { resolved, pending }

class Scan {
  String? id;
  final String fileContents;
  final List<Placemark> location;
  int? upVote;
  String? date;
  final String title;
  final String? des;
  final int urgency;
  final bool status;

  Scan({
    required this.id,
    required this.fileContents,
    required this.location,
    required this.upVote,
    required this.date,
    required this.title,
    required this.des,
    required this.urgency,
    required this.status,
  });

  // [2, 23.5]

}
