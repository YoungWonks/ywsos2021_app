import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:ywsos2021_app/misc/uini8list_converter.dart';

part 'scan.freezed.dart';
part 'scan.g.dart';
// part 'scan.g.dart';

// class ScanPosition {
//   final double lat;
//   final double long;

//   ScanPosition(this.lat, this.long);
// }

@freezed
class ScanPosition with _$ScanPosition {
  const factory ScanPosition({
    required double lat,
    required double long,
  }) = _ScanPosition;

  factory ScanPosition.fromJson(Map<String, dynamic> json) =>
      _$ScanPositionFromJson(json);
}

@freezed
class Scan with _$Scan {
  const factory Scan({
    @Uint8ListConverter() required Uint8List fileContents,
    @Default(0) int upVote,
    required ScanPosition scanPosition,
    required String scanDate,
    required String title,
    required String urgency,
  }) = _Scan;

  factory Scan.fromJson(Map<String, dynamic> json) => _$ScanFromJson(json);
}

// class Scan {
//   final Uint8List fileContents;
//   final int upVote;
//   final ScanPosition scanPosition;
//   final String scanDate;
//   final String title;
//   final String urgency;

//   Scan({
//     required this.fileContents,
//     required this.upVote,
//     required this.scanPosition,
//     required this.scanDate,
//     required this.title,
//     required this.urgency,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       "filename": fileContents,
//       "upvote": upVote,
//       "scanposition": scanPosition,
//       "scandate": scanDate,
//       "title": title,
//       "urgency": urgency,
//     };
//   }

//   factory Scan.fromMap(Map<String, dynamic> map) {
//     return Scan(
//       upVote: map['upvote'],
//       fileContents: map['filename'],
//       scanDate: map['scandate'],
//       scanPosition: map['scanposition'],
//       title: map['title'],
//       urgency: map['urgency'],
//     );
//   }
// }
