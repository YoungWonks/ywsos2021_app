// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'scan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScanPosition _$ScanPositionFromJson(Map<String, dynamic> json) {
  return _ScanPosition.fromJson(json);
}

/// @nodoc
class _$ScanPositionTearOff {
  const _$ScanPositionTearOff();

  _ScanPosition call({required double lat, required double long}) {
    return _ScanPosition(
      lat: lat,
      long: long,
    );
  }

  ScanPosition fromJson(Map<String, Object> json) {
    return ScanPosition.fromJson(json);
  }
}

/// @nodoc
const $ScanPosition = _$ScanPositionTearOff();

/// @nodoc
mixin _$ScanPosition {
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanPositionCopyWith<ScanPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanPositionCopyWith<$Res> {
  factory $ScanPositionCopyWith(
          ScanPosition value, $Res Function(ScanPosition) then) =
      _$ScanPositionCopyWithImpl<$Res>;
  $Res call({double lat, double long});
}

/// @nodoc
class _$ScanPositionCopyWithImpl<$Res> implements $ScanPositionCopyWith<$Res> {
  _$ScanPositionCopyWithImpl(this._value, this._then);

  final ScanPosition _value;
  // ignore: unused_field
  final $Res Function(ScanPosition) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ScanPositionCopyWith<$Res>
    implements $ScanPositionCopyWith<$Res> {
  factory _$ScanPositionCopyWith(
          _ScanPosition value, $Res Function(_ScanPosition) then) =
      __$ScanPositionCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double long});
}

/// @nodoc
class __$ScanPositionCopyWithImpl<$Res> extends _$ScanPositionCopyWithImpl<$Res>
    implements _$ScanPositionCopyWith<$Res> {
  __$ScanPositionCopyWithImpl(
      _ScanPosition _value, $Res Function(_ScanPosition) _then)
      : super(_value, (v) => _then(v as _ScanPosition));

  @override
  _ScanPosition get _value => super._value as _ScanPosition;

  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_ScanPosition(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScanPosition with DiagnosticableTreeMixin implements _ScanPosition {
  const _$_ScanPosition({required this.lat, required this.long});

  factory _$_ScanPosition.fromJson(Map<String, dynamic> json) =>
      _$_$_ScanPositionFromJson(json);

  @override
  final double lat;
  @override
  final double long;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ScanPosition(lat: $lat, long: $long)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ScanPosition'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('long', long));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScanPosition &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.long, long) ||
                const DeepCollectionEquality().equals(other.long, long)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(long);

  @JsonKey(ignore: true)
  @override
  _$ScanPositionCopyWith<_ScanPosition> get copyWith =>
      __$ScanPositionCopyWithImpl<_ScanPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ScanPositionToJson(this);
  }
}

abstract class _ScanPosition implements ScanPosition {
  const factory _ScanPosition({required double lat, required double long}) =
      _$_ScanPosition;

  factory _ScanPosition.fromJson(Map<String, dynamic> json) =
      _$_ScanPosition.fromJson;

  @override
  double get lat => throw _privateConstructorUsedError;
  @override
  double get long => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScanPositionCopyWith<_ScanPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

Scan _$ScanFromJson(Map<String, dynamic> json) {
  return _Scan.fromJson(json);
}

/// @nodoc
class _$ScanTearOff {
  const _$ScanTearOff();

  _Scan call(
      {@Uint8ListConverter() required Uint8List fileContents,
      int upVote = 0,
      required ScanPosition scanPosition,
      required String scanDate,
      required String title,
      required String urgency}) {
    return _Scan(
      fileContents: fileContents,
      upVote: upVote,
      scanPosition: scanPosition,
      scanDate: scanDate,
      title: title,
      urgency: urgency,
    );
  }

  Scan fromJson(Map<String, Object> json) {
    return Scan.fromJson(json);
  }
}

/// @nodoc
const $Scan = _$ScanTearOff();

/// @nodoc
mixin _$Scan {
  @Uint8ListConverter()
  Uint8List get fileContents => throw _privateConstructorUsedError;
  int get upVote => throw _privateConstructorUsedError;
  ScanPosition get scanPosition => throw _privateConstructorUsedError;
  String get scanDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get urgency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScanCopyWith<Scan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanCopyWith<$Res> {
  factory $ScanCopyWith(Scan value, $Res Function(Scan) then) =
      _$ScanCopyWithImpl<$Res>;
  $Res call(
      {@Uint8ListConverter() Uint8List fileContents,
      int upVote,
      ScanPosition scanPosition,
      String scanDate,
      String title,
      String urgency});

  $ScanPositionCopyWith<$Res> get scanPosition;
}

/// @nodoc
class _$ScanCopyWithImpl<$Res> implements $ScanCopyWith<$Res> {
  _$ScanCopyWithImpl(this._value, this._then);

  final Scan _value;
  // ignore: unused_field
  final $Res Function(Scan) _then;

  @override
  $Res call({
    Object? fileContents = freezed,
    Object? upVote = freezed,
    Object? scanPosition = freezed,
    Object? scanDate = freezed,
    Object? title = freezed,
    Object? urgency = freezed,
  }) {
    return _then(_value.copyWith(
      fileContents: fileContents == freezed
          ? _value.fileContents
          : fileContents // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      upVote: upVote == freezed
          ? _value.upVote
          : upVote // ignore: cast_nullable_to_non_nullable
              as int,
      scanPosition: scanPosition == freezed
          ? _value.scanPosition
          : scanPosition // ignore: cast_nullable_to_non_nullable
              as ScanPosition,
      scanDate: scanDate == freezed
          ? _value.scanDate
          : scanDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      urgency: urgency == freezed
          ? _value.urgency
          : urgency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ScanPositionCopyWith<$Res> get scanPosition {
    return $ScanPositionCopyWith<$Res>(_value.scanPosition, (value) {
      return _then(_value.copyWith(scanPosition: value));
    });
  }
}

/// @nodoc
abstract class _$ScanCopyWith<$Res> implements $ScanCopyWith<$Res> {
  factory _$ScanCopyWith(_Scan value, $Res Function(_Scan) then) =
      __$ScanCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Uint8ListConverter() Uint8List fileContents,
      int upVote,
      ScanPosition scanPosition,
      String scanDate,
      String title,
      String urgency});

  @override
  $ScanPositionCopyWith<$Res> get scanPosition;
}

/// @nodoc
class __$ScanCopyWithImpl<$Res> extends _$ScanCopyWithImpl<$Res>
    implements _$ScanCopyWith<$Res> {
  __$ScanCopyWithImpl(_Scan _value, $Res Function(_Scan) _then)
      : super(_value, (v) => _then(v as _Scan));

  @override
  _Scan get _value => super._value as _Scan;

  @override
  $Res call({
    Object? fileContents = freezed,
    Object? upVote = freezed,
    Object? scanPosition = freezed,
    Object? scanDate = freezed,
    Object? title = freezed,
    Object? urgency = freezed,
  }) {
    return _then(_Scan(
      fileContents: fileContents == freezed
          ? _value.fileContents
          : fileContents // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      upVote: upVote == freezed
          ? _value.upVote
          : upVote // ignore: cast_nullable_to_non_nullable
              as int,
      scanPosition: scanPosition == freezed
          ? _value.scanPosition
          : scanPosition // ignore: cast_nullable_to_non_nullable
              as ScanPosition,
      scanDate: scanDate == freezed
          ? _value.scanDate
          : scanDate // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      urgency: urgency == freezed
          ? _value.urgency
          : urgency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Scan with DiagnosticableTreeMixin implements _Scan {
  const _$_Scan(
      {@Uint8ListConverter() required this.fileContents,
      this.upVote = 0,
      required this.scanPosition,
      required this.scanDate,
      required this.title,
      required this.urgency});

  factory _$_Scan.fromJson(Map<String, dynamic> json) =>
      _$_$_ScanFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List fileContents;
  @JsonKey(defaultValue: 0)
  @override
  final int upVote;
  @override
  final ScanPosition scanPosition;
  @override
  final String scanDate;
  @override
  final String title;
  @override
  final String urgency;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Scan(fileContents: $fileContents, upVote: $upVote, scanPosition: $scanPosition, scanDate: $scanDate, title: $title, urgency: $urgency)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Scan'))
      ..add(DiagnosticsProperty('fileContents', fileContents))
      ..add(DiagnosticsProperty('upVote', upVote))
      ..add(DiagnosticsProperty('scanPosition', scanPosition))
      ..add(DiagnosticsProperty('scanDate', scanDate))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('urgency', urgency));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Scan &&
            (identical(other.fileContents, fileContents) ||
                const DeepCollectionEquality()
                    .equals(other.fileContents, fileContents)) &&
            (identical(other.upVote, upVote) ||
                const DeepCollectionEquality().equals(other.upVote, upVote)) &&
            (identical(other.scanPosition, scanPosition) ||
                const DeepCollectionEquality()
                    .equals(other.scanPosition, scanPosition)) &&
            (identical(other.scanDate, scanDate) ||
                const DeepCollectionEquality()
                    .equals(other.scanDate, scanDate)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.urgency, urgency) ||
                const DeepCollectionEquality().equals(other.urgency, urgency)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fileContents) ^
      const DeepCollectionEquality().hash(upVote) ^
      const DeepCollectionEquality().hash(scanPosition) ^
      const DeepCollectionEquality().hash(scanDate) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(urgency);

  @JsonKey(ignore: true)
  @override
  _$ScanCopyWith<_Scan> get copyWith =>
      __$ScanCopyWithImpl<_Scan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ScanToJson(this);
  }
}

abstract class _Scan implements Scan {
  const factory _Scan(
      {@Uint8ListConverter() required Uint8List fileContents,
      int upVote,
      required ScanPosition scanPosition,
      required String scanDate,
      required String title,
      required String urgency}) = _$_Scan;

  factory _Scan.fromJson(Map<String, dynamic> json) = _$_Scan.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List get fileContents => throw _privateConstructorUsedError;
  @override
  int get upVote => throw _privateConstructorUsedError;
  @override
  ScanPosition get scanPosition => throw _privateConstructorUsedError;
  @override
  String get scanDate => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get urgency => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScanCopyWith<_Scan> get copyWith => throw _privateConstructorUsedError;
}
