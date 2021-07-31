// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScanPosition _$_$_ScanPositionFromJson(Map<String, dynamic> json) {
  return _$_ScanPosition(
    lat: (json['lat'] as num).toDouble(),
    long: (json['long'] as num).toDouble(),
  );
}

Map<String, dynamic> _$_$_ScanPositionToJson(_$_ScanPosition instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

_$_Scan _$_$_ScanFromJson(Map<String, dynamic> json) {
  return _$_Scan(
    fileContents:
        const Uint8ListConverter().fromJson(json['fileContents'] as List<int>),
    upVote: json['upVote'] as int? ?? 0,
    scanPosition:
        ScanPosition.fromJson(json['scanPosition'] as Map<String, dynamic>),
    scanDate: json['scanDate'] as String,
    title: json['title'] as String,
    urgency: json['urgency'] as String,
  );
}

Map<String, dynamic> _$_$_ScanToJson(_$_Scan instance) => <String, dynamic>{
      'fileContents': const Uint8ListConverter().toJson(instance.fileContents),
      'upVote': instance.upVote,
      'scanPosition': instance.scanPosition,
      'scanDate': instance.scanDate,
      'title': instance.title,
      'urgency': instance.urgency,
    };
