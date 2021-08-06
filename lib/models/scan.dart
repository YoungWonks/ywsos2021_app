import 'dart:typed_data';

// class ScanPosition {
//   final double lat;
//   final double long;

//   ScanPosition({
//     required this.lat,
//     required this.long,
//   });
// }

class Scan {
  final String? id;
  final Uint8List fileContents;
  final int upVote;
  final double lat;
  final double long;
  final String scanDate;
  final String title;
  final String urgency;

  Scan({
    required this.lat,
    required this.long,
    required this.id,
    required this.fileContents,
    required this.upVote,
    required this.scanDate,
    required this.title,
    required this.urgency,
  });
}
