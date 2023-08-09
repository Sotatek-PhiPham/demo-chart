import 'package:demo_chart/chart_utils.dart';
import 'package:flutter/material.dart';

import 'sleep_stage_enum.dart';

class YAxis {
  YAxis._();

  static void drawYAxis({
    required Canvas canvas,
    required Size size,
  }) {
    for (SleepStageEnum item in SleepStageEnum.values) {
      TextPainter tp = _drawYAxisLabel(
        label: item.name,
        color: item.color,
      );
      tp.paint(canvas, _calculatePositionForYAxisLabel(size: size, sleepStage: item));
    }
  }

  static Offset _calculatePositionForYAxisLabel({
    required Size size,
    required SleepStageEnum sleepStage,
  }) {
    double heightOfLabel = _drawYAxisLabel(label: SleepStageEnum.values[0].name, color: sleepStage.color).height;
    const x = 0.0;
    double distanceBetween2labels = (size.height - ChartUtils.xAxisHeight - (heightOfLabel * SleepStageEnum.values.length)) /
        (SleepStageEnum.values.length - 1);
    final y = sleepStage.value * distanceBetween2labels +
        sleepStage.value * heightOfLabel;
    return Offset(x, y);
  }

  static TextPainter _drawYAxisLabel({
    required String label,
    double? maxWidth,
    required Color color,
  }) {
    var textStyle = TextStyle(
      color: color,
      fontSize: 15,
    );
    final textSpan = TextSpan(
      text: label,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.end,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: maxWidth ?? double.infinity);
    return textPainter;
  }
}
