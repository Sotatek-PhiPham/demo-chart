// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sleep_chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SleepChartData _$SleepChartDataFromJson(Map<String, dynamic> json) {
  return _SleepChartData.fromJson(json);
}

/// @nodoc
mixin _$SleepChartData {
  DateTime get dateTime => throw _privateConstructorUsedError;
  SleepStageEnum get level => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SleepChartDataCopyWith<SleepChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SleepChartDataCopyWith<$Res> {
  factory $SleepChartDataCopyWith(
          SleepChartData value, $Res Function(SleepChartData) then) =
      _$SleepChartDataCopyWithImpl<$Res, SleepChartData>;
  @useResult
  $Res call({DateTime dateTime, SleepStageEnum level, int seconds});
}

/// @nodoc
class _$SleepChartDataCopyWithImpl<$Res, $Val extends SleepChartData>
    implements $SleepChartDataCopyWith<$Res> {
  _$SleepChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? level = null,
    Object? seconds = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as SleepStageEnum,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SleepChartDataCopyWith<$Res>
    implements $SleepChartDataCopyWith<$Res> {
  factory _$$_SleepChartDataCopyWith(
          _$_SleepChartData value, $Res Function(_$_SleepChartData) then) =
      __$$_SleepChartDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime dateTime, SleepStageEnum level, int seconds});
}

/// @nodoc
class __$$_SleepChartDataCopyWithImpl<$Res>
    extends _$SleepChartDataCopyWithImpl<$Res, _$_SleepChartData>
    implements _$$_SleepChartDataCopyWith<$Res> {
  __$$_SleepChartDataCopyWithImpl(
      _$_SleepChartData _value, $Res Function(_$_SleepChartData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? level = null,
    Object? seconds = null,
  }) {
    return _then(_$_SleepChartData(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as SleepStageEnum,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SleepChartData implements _SleepChartData {
  const _$_SleepChartData(
      {required this.dateTime, required this.level, required this.seconds});

  factory _$_SleepChartData.fromJson(Map<String, dynamic> json) =>
      _$$_SleepChartDataFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final SleepStageEnum level;
  @override
  final int seconds;

  @override
  String toString() {
    return 'SleepChartData(dateTime: $dateTime, level: $level, seconds: $seconds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SleepChartData &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, level, seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SleepChartDataCopyWith<_$_SleepChartData> get copyWith =>
      __$$_SleepChartDataCopyWithImpl<_$_SleepChartData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SleepChartDataToJson(
      this,
    );
  }
}

abstract class _SleepChartData implements SleepChartData {
  const factory _SleepChartData(
      {required final DateTime dateTime,
      required final SleepStageEnum level,
      required final int seconds}) = _$_SleepChartData;

  factory _SleepChartData.fromJson(Map<String, dynamic> json) =
      _$_SleepChartData.fromJson;

  @override
  DateTime get dateTime;
  @override
  SleepStageEnum get level;
  @override
  int get seconds;
  @override
  @JsonKey(ignore: true)
  _$$_SleepChartDataCopyWith<_$_SleepChartData> get copyWith =>
      throw _privateConstructorUsedError;
}
