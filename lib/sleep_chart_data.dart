import 'dart:ui';

import 'package:demo_chart/sleep_stage_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_chart_data.freezed.dart';
part 'sleep_chart_data.g.dart';

@freezed
class SleepChartData with _$SleepChartData {
  const factory SleepChartData({
    @Default(0)
    @JsonKey(includeFromJson: false)
    int index,
    @Default([])
    @JsonKey(includeFromJson: false)
    List<Offset> mainOffset,
    @Default([])
    @JsonKey(includeFromJson: false)
    List<Offset> borderOffset,
    required DateTime dateTime,
    required SleepStageEnum level,
    required int seconds,

  }) = _SleepChartData;

  factory SleepChartData.fromJson(Map<String, Object?> json) => _$SleepChartDataFromJson(json);
}

List<SleepChartData> sleepData = (tmp['data'] as List<dynamic>).map((e) => SleepChartData.fromJson(e)).toList();

Map<String, dynamic> tmp = {
  "data": [
    {"dateTime": "2023-07-20T23:36:30.000", "level": "wake", "seconds": 510},
    {"dateTime": "2023-07-20T23:45:00.000", "level": "light", "seconds": 420},
    {"dateTime": "2023-07-20T23:52:00.000", "level": "wake", "seconds": 330},
    {"dateTime": "2023-07-20T23:57:30.000", "level": "light", "seconds": 810},
    {"dateTime": "2023-07-21T00:11:00.000", "level": "deep", "seconds": 540},
    {"dateTime": "2023-07-21T00:20:00.000", "level": "light", "seconds": 3720},
    {"dateTime": "2023-07-21T01:22:00.000", "level": "rem", "seconds": 1260},
    {"dateTime": "2023-07-21T01:43:00.000", "level": "light", "seconds": 720},
    {"dateTime": "2023-07-21T01:55:00.000", "level": "deep", "seconds": 390},
    {"dateTime": "2023-07-21T02:01:30.000", "level": "light", "seconds": 780},
    {"dateTime": "2023-07-21T02:14:30.000", "level": "deep", "seconds": 1980},
    {"dateTime": "2023-07-21T02:47:30.000", "level": "light", "seconds": 1470},
    {"dateTime": "2023-07-21T03:12:00.000", "level": "rem", "seconds": 1110},
    {"dateTime": "2023-07-21T03:30:30.000", "level": "light", "seconds": 1920},
    {"dateTime": "2023-07-21T04:02:30.000", "level": "deep", "seconds": 390},
    {"dateTime": "2023-07-21T04:09:00.000", "level": "light", "seconds": 4080},
    {"dateTime": "2023-07-21T05:17:00.000", "level": "rem", "seconds": 2550},
    {"dateTime": "2023-07-21T05:59:30.000", "level": "light", "seconds": 420},
    {"dateTime": "2023-07-21T06:06:30.000", "level": "rem", "seconds": 300},
    {"dateTime": "2023-07-21T06:11:30.000", "level": "light", "seconds": 1920},
    {"dateTime": "2023-07-21T06:43:30.000", "level": "wake", "seconds": 330},
    {"dateTime": "2023-07-21T06:49:00.000", "level": "light", "seconds": 660},
    {"dateTime": "2023-07-21T07:00:00.000", "level": "wake", "seconds": 390}
  ],
  "shortData": [
    {"dateTime": "2023-07-21T00:20:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T00:44:00.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T00:52:30.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T01:07:30.000", "level": "wake", "seconds": 90},
    {"dateTime": "2023-07-21T01:11:00.000", "level": "wake", "seconds": 150},
    {"dateTime": "2023-07-21T01:15:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T01:20:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T01:42:30.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T02:01:30.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T02:46:30.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T02:58:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T03:00:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T03:02:30.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T03:17:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T03:19:00.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T03:29:30.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T03:32:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T03:40:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T03:49:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T03:53:00.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T04:11:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T04:15:00.000", "level": "wake", "seconds": 180},
    {"dateTime": "2023-07-21T04:28:30.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T04:32:30.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T04:35:30.000", "level": "wake", "seconds": 90},
    {"dateTime": "2023-07-21T04:39:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T04:52:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T05:05:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T05:08:30.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T05:14:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T05:25:00.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T05:33:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T05:39:30.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T05:43:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T05:45:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T06:00:00.000", "level": "wake", "seconds": 120},
    {"dateTime": "2023-07-21T06:06:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T06:15:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T06:23:00.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T06:27:00.000", "level": "wake", "seconds": 60},
    {"dateTime": "2023-07-21T06:29:30.000", "level": "wake", "seconds": 150},
    {"dateTime": "2023-07-21T06:53:00.000", "level": "wake", "seconds": 30},
    {"dateTime": "2023-07-21T06:57:00.000", "level": "wake", "seconds": 60}
  ]
};
