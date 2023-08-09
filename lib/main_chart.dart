import 'package:demo_chart/chart_utils.dart';
import 'package:demo_chart/sleep_chart_data.dart';
import 'package:demo_chart/sleep_stage.dart';
import 'package:demo_chart/sleep_stage_enum.dart';
import 'package:demo_chart/step_line.dart';
import 'package:demo_chart/x_axis.dart';
import 'package:demo_chart/y_axis.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MainChartWidget extends StatelessWidget {
  final double width;
  final double height;
  final List<SleepChartData> data;

  const MainChartWidget({
    super.key,
    required this.width,
    required this.height,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Color(0xff070E45),
      //color: Colors.white,
      child: CustomPaint(
        painter: MainChartPaint(sleepData),
      ),
    );
  }
}

class MainChartPaint extends CustomPainter {
  final List<SleepChartData> data;

  MainChartPaint(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    XAxis.drawXAxis(canvas: canvas, size: size, startTime: data.first.dateTime, totalTimeInSeconds: ChartUtils.countTotalSleepTimeInSeconds(data));
    YAxis.drawYAxis(canvas: canvas, size: size);

    StepLine(canvas: canvas, size: size, data: data, opacity: 0.2).drawStepLine();

    SleepStage.drawSleepStage(canvas: canvas, size: size, stage: SleepStageEnum.rem, data: data);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
