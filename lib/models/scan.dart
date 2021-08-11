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
  final List<double> position;
  final String? scanDate;
  final String title;
  final String fileName;
  final String urgency;
  final String? description;

  // [2, 23.5]

  Scan({
    this.description,
    required this.fileName,
    required this.position,
    this.id,
    required this.fileContents,
    required this.upVote,
    this.scanDate,
    required this.title,
    required this.urgency,
  });
}
