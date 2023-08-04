// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SleepChartData _$$_SleepChartDataFromJson(Map<String, dynamic> json) =>
    _$_SleepChartData(
      dateTime: DateTime.parse(json['dateTime'] as String),
      level: $enumDecode(_$SleepStageEnumEnumMap, json['level']),
      seconds: json['seconds'] as int,
    );

Map<String, dynamic> _$$_SleepChartDataToJson(_$_SleepChartData instance) =>
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
