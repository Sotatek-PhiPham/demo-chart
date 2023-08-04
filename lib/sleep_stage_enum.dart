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
}