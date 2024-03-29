import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum SleepStageEnum {
  @JsonValue('wake')
  awake,

  @JsonValue('rem')
  rem,

  @JsonValue('light')
  light,

  @JsonValue('deep')
  deep
}

extension SleepStageEnumExtension on SleepStageEnum {
  String get name {
    switch (this) {
      case SleepStageEnum.awake:
        return 'Awake';
      case SleepStageEnum.rem:
        return 'REM';
      case SleepStageEnum.light:
        return 'Light';
      case SleepStageEnum.deep:
        return 'Deep';
    }
  }

  int get value {
    switch (this) {
      case SleepStageEnum.awake:
        return 0;
      case SleepStageEnum.rem:
        return 1;
      case SleepStageEnum.light:
        return 2;
      case SleepStageEnum.deep:
        return 3;
    }
  }

  Color get color {
    switch (this) {
      case SleepStageEnum.awake:
        return Color(0xffFF8F28);
      case SleepStageEnum.rem:
        return Color(0xff9C85F7);
      case SleepStageEnum.light:
        return Color(0xff00AFEB);
      case SleepStageEnum.deep:
        return Color(0xff5C71DB);
    }
  }

  List<Color> colorTo(SleepStageEnum s, {double opacity = 1}) {
    List<Color> result = [];
    int start = value < s.value ? value : s.value;
    int end = value < s.value ? s.value : value;
    for (int i = start ; i <= end; i++) {
      int index = SleepStageEnum.values.indexWhere((item) => item.value == i);
      if (index >= 0) {
        result.add(SleepStageEnum.values[index].color.withOpacity(opacity));
      }
    }
    print(result);
    return result;
  }

}