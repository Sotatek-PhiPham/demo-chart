import 'package:demo_chart/sleep_chart_data.dart';
import 'package:demo_chart/sleep_stage_enum.dart';
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
      //color: Color(0xff070E45),
      color: Colors.white,
      child: CustomPaint(
        painter: MainChartPaint(sleepData),
      ),
    );
  }
}

class MainChartPaint extends CustomPainter {
  final List<SleepChartData> data;

  final double _strokeWidth = 3;
  final int _numOfLabel = 9;

  MainChartPaint(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    _drawForFirstData(canvas, size, data.first.level.color);
    _drawForLastData(canvas, size, data.last.level.color);

    // vẽ item đầu tiên

    for (int i = 0; i < data.length; i++) {
      SleepChartData? pItem = i > 0 ? data[i - 1] : null;
      SleepChartData cItem = data[i];
      SleepChartData? nItem = i + 1 < data.length ? data[i + 1] : null;
      if (nItem != null) {
        _drawVerticalLine(canvas, size, cItem, nItem);
      }
      if (pItem != null && nItem != null) {
        _drawULine(canvas: canvas, size: size, pItem: pItem, cItem: cItem, nItem: nItem);
      }
    }

  }

  void _drawForFirstData(Canvas canvas, Size size, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;
    final path = Path();
    List<Offset> firstItemOffsets = calculateOffsetForItem(size, data.first);
    path.moveTo(firstItemOffsets[0].dx, firstItemOffsets[0].dy);
    path.lineTo(
        firstItemOffsets[1].dx - _strokeWidth * 2, firstItemOffsets[1].dy);
    if (data[1].level.value > data.first.level.value) {
      // bo xuống
      path.quadraticBezierTo(firstItemOffsets[1].dx, firstItemOffsets[1].dy,
          firstItemOffsets[1].dx, firstItemOffsets[1].dy + _strokeWidth * 2);
    } else {
      // bo lên
      path.quadraticBezierTo(firstItemOffsets[1].dx, firstItemOffsets[1].dy,
          firstItemOffsets[1].dx, firstItemOffsets[1].dy - _strokeWidth * 2);
    }
    canvas.drawPath(path, paint);
  }

  void _drawForLastData(Canvas canvas, Size size, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;
    final path = Path();
    List<Offset> lastItemOffsets = calculateOffsetForItem(size, data.last);
    if (data[data.length - 2].level.value > data.last.level.value) {
      // bo xuống
      path.moveTo(
          lastItemOffsets[0].dx, lastItemOffsets[0].dy + _strokeWidth * 2);
      path.quadraticBezierTo(lastItemOffsets[0].dx, lastItemOffsets[0].dy,
          lastItemOffsets[0].dx + _strokeWidth * 2, lastItemOffsets[0].dy);
    } else {
      // bo lên
      path.moveTo(
          lastItemOffsets[0].dx, lastItemOffsets[0].dy - _strokeWidth * 2);
      path.quadraticBezierTo(lastItemOffsets[0].dx, lastItemOffsets[0].dy,
          lastItemOffsets[0].dx + _strokeWidth * 2, lastItemOffsets[0].dy);
    }

    path.lineTo(lastItemOffsets[1].dx, lastItemOffsets[1].dy);
    canvas.drawPath(path, paint);
  }

  void _drawVerticalLine(Canvas canvas, Size size, SleepChartData s1, SleepChartData s2) {
    List<Offset> o1 = calculateOffsetForItem(size, s1);
    List<Offset> o2 =calculateOffsetForItem(size, s2);
    late Offset start, end;
    if (s1.level.value < s2.level.value) {
      start = Offset(o1[1].dx, o1[1].dy + _strokeWidth *2);
      end = Offset(o2[0].dx, o2[0].dy - _strokeWidth *2);
    } else {
      end = Offset(o1[1].dx, o1[1].dy - _strokeWidth *2);
      start = Offset(o2[0].dx, o2[0].dy + _strokeWidth *2);
    }

    List<Color> colors = s1.level.colorTo(s2.level);

    final paint = Paint()
    ..shader = ui.Gradient.linear(start, end, colors, colors.length == 2 ? null : [0.0, 0.5, 1])
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(start, end, paint);
  }

  void _drawULine({
    required Canvas canvas,
    required Size size,
    required SleepChartData pItem,
    required SleepChartData cItem,
    required SleepChartData nItem,
}) {
    final paint = Paint()
      ..color = cItem.level.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round;
    List<Offset> o =calculateOffsetForItem(size, cItem);
    final path = Path();
    if (pItem.level.value < cItem.level.value && cItem.level.value > nItem.level.value) {
      //u xuôi
      //  |   |
      //  |___|
      print('============${o[1].dx - o[0].dx}');
      path.moveTo(o[0].dx, o[0].dy - _strokeWidth * 2);
      if (o[1].dx - o[0].dx <= _strokeWidth * 2) {
        path.cubicTo(o[0].dx, o[0].dy, o[1].dx, o[1].dy, o[1].dx, o[1].dy - _strokeWidth * 2);
       } else {
        path.quadraticBezierTo(o[0].dx, o[0].dy, o[0].dx + _strokeWidth * 2, o[0].dy);
        path.lineTo(o[1].dx - _strokeWidth * 2, o[1].dy);
        path.quadraticBezierTo(o[1].dx, o[1].dy, o[1].dx, o[1].dy - _strokeWidth * 2);
      }

    } else if (pItem.level.value > cItem.level.value && cItem.level.value < nItem.level.value) {
      //u ngược
      //  |---|
      //  |   |
      path.moveTo(o[0].dx, o[0].dy + _strokeWidth * 2);
      if (o[1].dx - o[0].dx <= _strokeWidth * 2) {
        path.cubicTo(o[0].dx, o[0].dy, o[1].dx, o[1].dy, o[1].dx, o[1].dy + _strokeWidth * 2);
      } else {
        path.quadraticBezierTo(o[0].dx, o[0].dy, o[0].dx + _strokeWidth * 2, o[0].dy);
        path.lineTo(o[1].dx - _strokeWidth * 2, o[1].dy);
        path.quadraticBezierTo(o[1].dx, o[1].dy, o[1].dx, o[1].dy + _strokeWidth * 2);
      }

    } else if (pItem.level.value < cItem.level.value && cItem.level.value < nItem.level.value) {
      // S xuôi, S ngược
      path.moveTo(o[0].dx, o[0].dy - _strokeWidth * 2);
      path.quadraticBezierTo(o[0].dx, o[0].dy, o[0].dx + _strokeWidth * 2, o[0].dy);
      path.lineTo(o[1].dx - _strokeWidth * 2, o[1].dy);
      path.quadraticBezierTo(o[1].dx, o[1].dy, o[1].dx, o[1].dy + _strokeWidth * 2);
    } else if (pItem.level.value > cItem.level.value && cItem.level.value > nItem.level.value) {
      // S xuôi, S ngược
      path.moveTo(o[0].dx, o[0].dy + _strokeWidth * 2);
      path.quadraticBezierTo(o[0].dx, o[0].dy, o[0].dx + _strokeWidth * 2, o[0].dy);
      path.lineTo(o[1].dx - _strokeWidth * 2, o[1].dy);
      path.quadraticBezierTo(o[1].dx, o[1].dy, o[1].dx, o[1].dy - _strokeWidth * 2);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  List<Offset> calculateOffsetForItem(Size size, SleepChartData item) {
    DateTime start = data.first.dateTime;
    DateTime end = data.last.dateTime;
    int seconds = end.difference(start).inSeconds;
    double pixelPerSecond = size.width / seconds;

    double x1 = pixelPerSecond * item.dateTime.difference(start).inSeconds;
    double y1 =
        item.level.value * ((size.height) / (SleepStageEnum.values.length - 1));

    double x2 = x1 + item.seconds * pixelPerSecond;
    double y2 =
        item.level.value * ((size.height) / (SleepStageEnum.values.length - 1));

    return [
      Offset(x1, y1),
      Offset(x2, y2),
    ];
  }
}
