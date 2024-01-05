// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepChartDataImpl _$$SleepChartDataImplFromJson(Map<String, dynamic> json) =>
    _$SleepChartDataImpl(
      dateTime: DateTime.parse(json['dateTime'] as String),
      level: $enumDecode(_$SleepStageEnumEnumMap, json['level']),
      seconds: json['seconds'] as int,
    );

Map<String, dynamic> _$$SleepChartDataImplToJson(
        _$SleepChartDataImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'level': _$SleepStageEnumEnumMap[instance.level]!,
      'seconds': instance.seconds,
    };

const _$SleepStageEnumEnumMap = {
  SleepStageEnum.awake: 'wake',
  SleepStageEnum.rem: 'rem',
  SleepStageEnum.light: 'light',
  SleepStageEnum.deep: 'deep',
};
