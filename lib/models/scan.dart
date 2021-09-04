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
  final String id;
  final Uint8List fileContents;
  final Map<String, dynamic> position;
  final int upVote;
  final String date;
  final String title;
  final String des;
  final int urgency;

  Scan({
    required this.id,
    required this.fileContents,
    required this.position,
    required this.upVote,
    required this.date,
    required this.title,
    required this.des,
    required this.urgency,
  });

  // [2, 23.5]

}
