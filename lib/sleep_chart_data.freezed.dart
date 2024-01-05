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
  @JsonKey(includeFromJson: false)
  int get index => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  List<Offset> get mainOffset => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  List<Offset> get borderOffset => throw _privateConstructorUsedError;
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
  $Res call(
      {@JsonKey(includeFromJson: false) int index,
      @JsonKey(includeFromJson: false) List<Offset> mainOffset,
      @JsonKey(includeFromJson: false) List<Offset> borderOffset,
      DateTime dateTime,
      SleepStageEnum level,
      int seconds});
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
    Object? index = null,
    Object? mainOffset = null,
    Object? borderOffset = null,
    Object? dateTime = null,
    Object? level = null,
    Object? seconds = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      mainOffset: null == mainOffset
          ? _value.mainOffset
          : mainOffset // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      borderOffset: null == borderOffset
          ? _value.borderOffset
          : borderOffset // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
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
abstract class _$$SleepChartDataImplCopyWith<$Res>
    implements $SleepChartDataCopyWith<$Res> {
  factory _$$SleepChartDataImplCopyWith(_$SleepChartDataImpl value,
          $Res Function(_$SleepChartDataImpl) then) =
      __$$SleepChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false) int index,
      @JsonKey(includeFromJson: false) List<Offset> mainOffset,
      @JsonKey(includeFromJson: false) List<Offset> borderOffset,
      DateTime dateTime,
      SleepStageEnum level,
      int seconds});
}

/// @nodoc
class __$$SleepChartDataImplCopyWithImpl<$Res>
    extends _$SleepChartDataCopyWithImpl<$Res, _$SleepChartDataImpl>
    implements _$$SleepChartDataImplCopyWith<$Res> {
  __$$SleepChartDataImplCopyWithImpl(
      _$SleepChartDataImpl _value, $Res Function(_$SleepChartDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? mainOffset = null,
    Object? borderOffset = null,
    Object? dateTime = null,
    Object? level = null,
    Object? seconds = null,
  }) {
    return _then(_$SleepChartDataImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      mainOffset: null == mainOffset
          ? _value._mainOffset
          : mainOffset // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      borderOffset: null == borderOffset
          ? _value._borderOffset
          : borderOffset // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
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
class _$SleepChartDataImpl implements _SleepChartData {
  const _$SleepChartDataImpl(
      {@JsonKey(includeFromJson: false) this.index = 0,
      @JsonKey(includeFromJson: false) final List<Offset> mainOffset = const [],
      @JsonKey(includeFromJson: false)
      final List<Offset> borderOffset = const [],
      required this.dateTime,
      required this.level,
      required this.seconds})
      : _mainOffset = mainOffset,
        _borderOffset = borderOffset;

  factory _$SleepChartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SleepChartDataImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false)
  final int index;
  final List<Offset> _mainOffset;
  @override
  @JsonKey(includeFromJson: false)
  List<Offset> get mainOffset {
    if (_mainOffset is EqualUnmodifiableListView) return _mainOffset;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mainOffset);
  }

  final List<Offset> _borderOffset;
  @override
  @JsonKey(includeFromJson: false)
  List<Offset> get borderOffset {
    if (_borderOffset is EqualUnmodifiableListView) return _borderOffset;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_borderOffset);
  }

  @override
  final DateTime dateTime;
  @override
  final SleepStageEnum level;
  @override
  final int seconds;

  @override
  String toString() {
    return 'SleepChartData(index: $index, mainOffset: $mainOffset, borderOffset: $borderOffset, dateTime: $dateTime, level: $level, seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SleepChartDataImpl &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality()
                .equals(other._mainOffset, _mainOffset) &&
            const DeepCollectionEquality()
                .equals(other._borderOffset, _borderOffset) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      const DeepCollectionEquality().hash(_mainOffset),
      const DeepCollectionEquality().hash(_borderOffset),
      dateTime,
      level,
      seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SleepChartDataImplCopyWith<_$SleepChartDataImpl> get copyWith =>
      __$$SleepChartDataImplCopyWithImpl<_$SleepChartDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SleepChartDataImplToJson(
      this,
    );
  }
}

abstract class _SleepChartData implements SleepChartData {
  const factory _SleepChartData(
      {@JsonKey(includeFromJson: false) final int index,
      @JsonKey(includeFromJson: false) final List<Offset> mainOffset,
      @JsonKey(includeFromJson: false) final List<Offset> borderOffset,
      required final DateTime dateTime,
      required final SleepStageEnum level,
      required final int seconds}) = _$SleepChartDataImpl;

  factory _SleepChartData.fromJson(Map<String, dynamic> json) =
      _$SleepChartDataImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false)
  int get index;
  @override
  @JsonKey(includeFromJson: false)
  List<Offset> get mainOffset;
  @override
  @JsonKey(includeFromJson: false)
  List<Offset> get borderOffset;
  @override
  DateTime get dateTime;
  @override
  SleepStageEnum get level;
  @override
  int get seconds;
  @override
  @JsonKey(ignore: true)
  _$$SleepChartDataImplCopyWith<_$SleepChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
