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
  String? id;
  final Uint8List fileContents;
  final String address;
  int? upVote;
  String? date;
  final String title;
  final String des;
  final int urgency;

  Scan.adding({
    required this.title,
    required this.urgency,
    required this.address,
    required this.des,
    required this.fileContents,
  });

  Scan({
    required this.id,
    required this.fileContents,
    required this.address,
    required this.upVote,
    required this.date,
    required this.title,
    required this.des,
    required this.urgency,
  });

  // [2, 23.5]

}
