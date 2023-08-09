import 'dart:ui';

import 'package:demo_chart/chart_utils.dart';
import 'package:demo_chart/sleep_chart_data.dart';
import 'package:demo_chart/sleep_stage_enum.dart';

class StepLine {
  final Canvas canvas;
  final Size size;
  final List<SleepChartData> data;
  final double opacity;

  StepLine({
    required this.canvas,
    required this.size,
    required this.data,
    this.opacity = 1,

  }) {
    dxStart = ChartUtils.yAxisWidth;
    dyEnd = size.height - ChartUtils.xAxisHeight;
    totalTimeInSeconds = ChartUtils.countTotalSleepTimeInSeconds(data);
  }

  late double dxStart;
  late double dyEnd;
  late int totalTimeInSeconds;

  void drawStepLine() {
    _drawForFirstData();
    _drawForLastData();

    for (int i = 0; i < data.length; i++) {
      SleepChartData? pItem = i > 0 ? data[i - 1] : null;
      SleepChartData cItem = data[i];
      SleepChartData? nItem = i + 1 < data.length ? data[i + 1] : null;
      if (nItem != null) {
        _drawVerticalLine(cItem, nItem);
      }
      if (pItem != null && nItem != null) {
        _drawULine(pItem: pItem, cItem: cItem, nItem: nItem);
      }
    }
  }

  void _drawForFirstData() {
    final paint = Paint()
      ..color = data.first.level.color.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = ChartUtils.strokeWidth
      ..strokeCap = StrokeCap.square;

    final path = Path();
    List<Offset> o = ChartUtils.calculateOffsetForItem(
      item: data.first,
      data: data,
      size: size,
    );;
    path.moveTo(o[0].dx, o[0].dy);
    path.lineTo(o[1].dx - ChartUtils.borderRadius, o[1].dy);
    if (data[1].level.value > data.first.level.value) {
      // bo xuống
      path.quadraticBezierTo(
          o[1].dx, o[1].dy, o[1].dx, o[1].dy + ChartUtils.borderRadius);
    } else {
      // bo lên
      path.quadraticBezierTo(
          o[1].dx, o[1].dy, o[1].dx, o[1].dy - ChartUtils.borderRadius);
    }
    canvas.drawPath(path, paint);
  }

  void _drawForLastData() {
    final paint = Paint()
      ..color = data.last.level.color.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = ChartUtils.strokeWidth
      ..strokeCap = StrokeCap.square;

    final path = Path();
    List<Offset> o = ChartUtils.calculateOffsetForItem(
      item: data.last,
      data: data,
      size: size,
    );;
    if (data[data.length - 2].level.value > data.last.level.value) {
      // bo xuống
      path.moveTo(o[0].dx, o[0].dy + ChartUtils.borderRadius);
      if (o[1].dx - o[0].dx < ChartUtils.borderRadius) {
        path.quadraticBezierTo(o[0].dx, o[0].dy, o[1].dx, o[1].dy);
      } else {
        path.quadraticBezierTo(
            o[0].dx, o[0].dy, o[0].dx + ChartUtils.borderRadius, o[0].dy);
        path.lineTo(o[1].dx, o[1].dy);
      }
    } else {
      // bo lên
      path.moveTo(o[0].dx, o[0].dy - ChartUtils.borderRadius);
      path.quadraticBezierTo(
          o[0].dx, o[0].dy, o[0].dx + ChartUtils.borderRadius, o[0].dy);
      path.lineTo(o[1].dx, o[1].dy);
    }

    canvas.drawPath(path, paint);
  }

  void _drawVerticalLine(SleepChartData s1, SleepChartData s2) {
    List<Offset> o1 = ChartUtils.calculateOffsetForItem(
      item: s1,
      data: data,
      size: size,
    );
    List<Offset> o2 = ChartUtils.calculateOffsetForItem(
      item: s2,
      data: data,
      size: size,
    );
    late Offset start, end;
    if (s1.level.value < s2.level.value) {
      //awke -> rem
      start = Offset(o1[1].dx, o1[1].dy + ChartUtils.borderRadius + ChartUtils.strokeWidth);
      end = Offset(o2[0].dx, o2[0].dy - ChartUtils.borderRadius - ChartUtils.strokeWidth);
    } else {
      //rem -> awake
      start = Offset(o2[0].dx, o2[0].dy + ChartUtils.borderRadius + ChartUtils.strokeWidth);
      end = Offset(o1[1].dx, o1[1].dy - ChartUtils.borderRadius - ChartUtils.strokeWidth);
    }

    List<Color> colors = s1.level.colorTo(s2.level, opacity: opacity);

    final paint = Paint()
      ..shader = Gradient.linear(
          start, end, colors, ChartUtils.gradientStop(colors.length))
      ..style = PaintingStyle.stroke
      ..strokeWidth = ChartUtils.strokeWidth
      ..strokeCap = StrokeCap.square;
    canvas.drawLine(start, end, paint);
  }

  void _drawULine({
    required SleepChartData pItem,
    required SleepChartData cItem,
    required SleepChartData nItem,
  }) {
    final paint = Paint()
      ..color = cItem.level.color.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = ChartUtils.strokeWidth
      ..strokeCap = StrokeCap.square;

    List<Offset> o = ChartUtils.calculateOffsetForItem(
      item: cItem,
      data: data,
      size: size,
    );
    final path = Path();
    if (pItem.level.value < cItem.level.value &&
        cItem.level.value > nItem.level.value) {
      //u xuôi
      //  |   |
      //  |___|
      path.moveTo(o[0].dx, o[0].dy - ChartUtils.borderRadius);
      if (o[1].dx - o[0].dx <= ChartUtils.borderRadius) {
        path.cubicTo(
            o[0].dx,
            o[0].dy + ChartUtils.strokeWidth / 2,
            o[1].dx,
            o[1].dy + ChartUtils.strokeWidth / 2,
            o[1].dx,
            o[1].dy - ChartUtils.borderRadius);
      } else {
        path.quadraticBezierTo(
            o[0].dx, o[0].dy, o[0].dx + ChartUtils.borderRadius, o[0].dy);
        path.lineTo(o[1].dx - ChartUtils.borderRadius, o[1].dy);
        path.quadraticBezierTo(
            o[1].dx, o[1].dy, o[1].dx, o[1].dy - ChartUtils.borderRadius);
      }
    } else if (pItem.level.value > cItem.level.value &&
        cItem.level.value < nItem.level.value) {
      //u ngược
      //  |---|
      //  |   |
      path.moveTo(o[0].dx, o[0].dy + ChartUtils.borderRadius);
      if (o[1].dx - o[0].dx <= ChartUtils.borderRadius) {
        path.cubicTo(
            o[0].dx,
            o[0].dy - ChartUtils.strokeWidth / 2,
            o[1].dx,
            o[1].dy - ChartUtils.strokeWidth / 2,
            o[1].dx,
            o[1].dy + ChartUtils.borderRadius);
      } else {
        path.quadraticBezierTo(
            o[0].dx, o[0].dy, o[0].dx + ChartUtils.borderRadius, o[0].dy);
        path.lineTo(o[1].dx - ChartUtils.borderRadius, o[1].dy);
        path.quadraticBezierTo(
            o[1].dx, o[1].dy, o[1].dx, o[1].dy + ChartUtils.borderRadius);
      }
    } else if (pItem.level.value < cItem.level.value &&
        cItem.level.value < nItem.level.value) {
      // S xuôi, S ngược
      path.moveTo(o[0].dx, o[0].dy - ChartUtils.borderRadius);
      path.quadraticBezierTo(
          o[0].dx, o[0].dy, o[0].dx + ChartUtils.borderRadius, o[0].dy);
      path.lineTo(o[1].dx - ChartUtils.borderRadius, o[1].dy);
      path.quadraticBezierTo(
          o[1].dx, o[1].dy, o[1].dx, o[1].dy + ChartUtils.borderRadius);
    } else if (pItem.level.value > cItem.level.value &&
        cItem.level.value > nItem.level.value) {
      // S xuôi, S ngược
      path.moveTo(o[0].dx, o[0].dy + ChartUtils.borderRadius);
      path.quadraticBezierTo(
          o[0].dx, o[0].dy, o[0].dx + ChartUtils.borderRadius, o[0].dy);
      path.lineTo(o[1].dx - ChartUtils.borderRadius, o[1].dy);
      path.quadraticBezierTo(
          o[1].dx, o[1].dy, o[1].dx, o[1].dy - ChartUtils.borderRadius);
    }
    canvas.drawPath(path, paint);
  }
}
