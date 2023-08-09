import 'dart:math';
import 'dart:ui' as ui;

import 'package:demo_chart/chart_utils.dart';
import 'package:demo_chart/sleep_chart_data.dart';
import 'package:demo_chart/sleep_stage_enum.dart';
import 'package:flutter/material.dart';

class SleepStage {
  SleepStage._();

  static void drawSleepStage({
    required Canvas canvas,
    required Size size,
    required SleepStageEnum stage,
    required List<SleepChartData> data,
  }) {
    for (var item in data) {
      if (item.level != stage) continue;
      List<Offset> o =
          ChartUtils.calculateOffsetForItem(size: size, item: item, data: data);

      final paint = Paint()
        // ..shader = ui.Gradient.linear(o[0], Offset(o[1].dx, size.height - (ChartUtils.xAxisHeight * 2 / 3)),
        //     [stage.color, Colors.transparent], [0.5, 1])
        ..shader = LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                stops: const [0, 1],
                //transform: const GradientRotation(pi),
                colors: [Colors.transparent,stage.color])
            .createShader(Rect.fromPoints(
                o[0],
                Offset(o[1].dx, size.height - (ChartUtils.xAxisHeight * 2 / 3))))
        ..style = PaintingStyle.fill
        ..strokeWidth = ChartUtils.strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromPoints(
              o[0],
              Offset(o[1].dx, size.height - (ChartUtils.xAxisHeight * 2 / 3)),
            ),
            topRight: const Radius.circular(ChartUtils.borderRadius),
            topLeft: const Radius.circular(ChartUtils.borderRadius),
          ),
          paint);
    }
  }
}
