import 'dart:ui' as gradient;

import 'package:collection/collection.dart';
import 'package:demo_chart/chart_utils.dart';
import 'package:demo_chart/sleep_chart_data.dart';
import 'package:demo_chart/sleep_stage_enum.dart';
import 'package:flutter/material.dart';

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

  void drawRectangleFrom4Offset({
    required List<Offset> offset,
    required Color color,
  }) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    RRect rect = RRect.fromRectAndRadius(
        Rect.fromPoints(offset[0], offset[2]), const Radius.circular(10));
    canvas.drawRRect(
      rect,
      paint,
    );
  }

  void drawStepLine() {

    // _drawForFirstData();
    // _drawForLastData();
    for (int i = 0; i < data.length; i++) {
      data[i] = data[i].copyWith(
        index: i,
        mainOffset: ChartUtils.calculate4OffsetForItem(
            item: data[i], data: data, size: size),
        borderOffset: ChartUtils.calculate4OffsetForItemBorder(
            item: data[i], data: data, size: size),
      );
    }

    List<Offset> offsets = [];

    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..strokeWidth = ChartUtils.strokeWidth
      ..strokeCap = StrokeCap.square;
    final path = Path();
    SleepChartData current = data.first;
    path.moveTo(current.borderOffset[0].dx, current.borderOffset[0].dy);

    offsets.add(Offset(current.borderOffset[0].dx, current.borderOffset[0].dy + 10));
    offsets.add(current.borderOffset[0]);

    do {
      SleepChartData? same = data.firstWhereOrNull((element) =>
          element.level.value == current.level.value &&
          element.index > current.index);
      if (same != null) {
        SleepChartData next = data[current.index + 1];
        if (same.borderOffset[0].dx - current.borderOffset[1].dx > 0) {
          _drawFromCurrentToNext(current, next, path, offsets);
          current = next;
        } else {
          if (next.level.value < same.level.value) {
            path.lineTo(next.borderOffset[0].dx, current.borderOffset[1].dy);
            path.lineTo(next.borderOffset[0].dx, next.borderOffset[0].dy);
            path.lineTo(next.borderOffset[1].dx, next.borderOffset[1].dy);

            offsets.removeWhere((e) => e.dx == current.borderOffset[1].dx && e.dy == current.borderOffset[1].dy);
            offsets.add(Offset(next.borderOffset[0].dx, current.borderOffset[1].dy));
            offsets.add(Offset(next.borderOffset[0].dx, next.borderOffset[0].dy));
            offsets.add(Offset(next.borderOffset[1].dx, next.borderOffset[1].dy));

            current = next;
          } else {
            path.lineTo(same.borderOffset[1].dx - 10, same.borderOffset[1].dy);
            path.lineTo(same.borderOffset[1].dx, same.borderOffset[1].dy,);

            offsets.removeWhere((e) => e.dx == current.borderOffset[1].dx && e.dy == current.borderOffset[1].dy);
            offsets.add(Offset(same.borderOffset[1].dx, same.borderOffset[1].dy,));

            current = same;
          }
        }
      } else {
        SleepChartData next = data[current.index + 1];
        _drawFromCurrentToNext(current, next, path, offsets);
        current = next;
      }
    } while (current.index < data.length - 1);

    path.lineTo(current.borderOffset[2].dx, current.borderOffset[2].dy);
    path.lineTo(current.borderOffset[3].dx, current.borderOffset[3].dy);

    offsets.add(Offset(current.borderOffset[2].dx, current.borderOffset[2].dy));
    offsets.add(Offset(current.borderOffset[3].dx, current.borderOffset[3].dy));

    do {
      SleepChartData? same = data.lastWhereOrNull((element) =>
          element.level.value == current.level.value &&
          element.index < current.index);

      SleepChartData next = data[current.index - 1];

      if (next.level.value > current.level.value) {
        path.lineTo(next.borderOffset[1].dx, current.borderOffset[3].dy);
        path.lineTo(next.borderOffset[2].dx, next.borderOffset[2].dy);
        path.lineTo(next.borderOffset[3].dx, next.borderOffset[3].dy);

          offsets.removeWhere((e) => e.dx == current.borderOffset[3].dx && e.dy == current.borderOffset[3].dy);
          offsets.add(Offset(next.borderOffset[1].dx, current.borderOffset[3].dy));
          offsets.add(Offset(next.borderOffset[2].dx, next.borderOffset[2].dy));
          offsets.add(Offset(next.borderOffset[3].dx, next.borderOffset[3].dy));


        current = next;


      } else {
        if (same == null) {
          path.lineTo(current.borderOffset[3].dx, next.borderOffset[3].dy);
          path.lineTo(next.borderOffset[3].dx, next.borderOffset[3].dy);


          offsets.add(Offset(current.borderOffset[3].dx, next.borderOffset[3].dy));
          offsets.add(Offset(next.borderOffset[3].dx, next.borderOffset[3].dy));

          current = next;
        } else {
          if (current.borderOffset[3].dx - same.borderOffset[2].dx > 0) {
            path.lineTo(current.borderOffset[3].dx, next.borderOffset[3].dy);
            path.lineTo(next.borderOffset[3].dx, next.borderOffset[3].dy);

            offsets.add(Offset(current.borderOffset[3].dx, next.borderOffset[3].dy));
            offsets.add(Offset(next.borderOffset[3].dx, next.borderOffset[3].dy));

            current = next;
          } else {

            path.lineTo(same.borderOffset[3].dx, same.borderOffset[3].dy);

            offsets.removeWhere((e) => e.dx == current.borderOffset[3].dx && e.dy == current.borderOffset[3].dy);
            offsets.add(Offset(same.borderOffset[3].dx, same.borderOffset[3].dy));

            current = same;
          }
        }
      }
    } while (current.index != 0);
    offsets.add(Offset(current.borderOffset[0].dx, current.borderOffset[0].dy + 10));
    path.close();
    //canvas.drawPath(path, paint);

    for (int i = 0; i < data.length; i++) {
      drawRectangleFrom4Offset(
          offset: ChartUtils.calculate4OffsetForItem(
              item: data[i], data: data, size: size),
          color: Colors.blue);
    }

    _drawBorder(canvas, offsets);

    // final paintCircle = Paint()
    //   ..color = Colors.blue
    //   ..style = PaintingStyle.stroke
    // ..strokeWidth = 2.0;
    //
    // for (int i = 0; i < offsets.length; i++) {
    //   canvas.drawCircle(offsets[i], 2, paintCircle);
    // }





  }

  void _drawBorder(Canvas canvas, List<Offset> offsets) {
    final paint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..style = PaintingStyle.fill;
      //..strokeWidth = 2.0;




    final path = Path();
    path.moveTo(offsets[0].dx, offsets[0].dy);
    for (int i = 1; i < offsets.length - 1; i++) {
      Offset p = offsets[i - 1];
      Offset c = offsets[i];
      Offset n = offsets[i + 1];
      Offset? n1 = i + 2 == offsets.length ? null : offsets[i + 2];

      if (c.dx == p.dx && c.dy == n.dy && p.dy > c.dy && n.dx > c.dx) {
        if (n1 != null && n.dx -c.dx < 20 && n.dy < n1.dy) {
          //path.moveTo(c.dx, c.dy + 10);
          path.cubicTo(c.dx, c.dy - 3, n.dx, n.dy - 3, n.dx, n.dy + 10);
          path.lineTo(n1.dx, n1.dy - 10);
          i = i + 1;
          continue;
        }
        if (n1 != null && n.dx -c.dx < 20 && n.dy > n1.dy) {
          //path.moveTo(c.dx, c.dy + 10);
          if (n.dx -c.dx <= 10) {
            path.quadraticBezierTo(c.dx, c.dy, n.dx, n.dy);
          } else {
            path.quadraticBezierTo(c.dx, c.dy, c.dx + 10, n.dy);
            path.quadraticBezierTo(n.dx, n.dy, n.dx, n.dy - 10);
          }
          path.lineTo(n1.dx, n1.dy + 10);
          i = i + 1;
          continue;
        }
        //path.moveTo(c.dx, c.dy + 10);
        path.quadraticBezierTo(c.dx, c.dy, c.dx + 10, c.dy);
        path.lineTo(n.dx - 10, n.dy);
        continue;
      }
      if (c.dy == p.dy && c.dx == n.dx && c.dx > p.dx && n.dy > c.dy) {
        //path.moveTo(c.dx - 10, c.dy);
        path.quadraticBezierTo(c.dx, c.dy, c.dx, c.dy + 10);
        path.lineTo(n.dx, n.dy - 10);
        continue;
      }

      if (c.dx == p.dx && c.dy == n.dy && p.dy < c.dy && n.dx > c.dx) {
        if (n1 != null && n.dx - c.dx < 20 && n.dy > n1.dy) {
          //path.moveTo(c.dx, c.dy -10);
          path.cubicTo(c.dx, c.dy + 3, n.dx, n.dy + 3, n.dx, n.dy - 10);
          path.lineTo(n1.dx, n1.dy + 10);
          i = i + 1;
          continue;
        }
        if (n1 != null && n.dx - c.dx < 20 && n.dy < n1.dy) {
          //path.moveTo(c.dx, c.dy - 10);
          if (n.dx -c.dx <= 10) {
            path.lineTo(c.dx, c.dy);
            path.quadraticBezierTo(n.dx, n.dy, n.dx, n.dy + 10);
          } else {
            path.quadraticBezierTo(c.dx, c.dy, c.dx + (n.dx - c.dx - 10) ,c.dy );
            path.quadraticBezierTo(n.dx, n.dy, n.dx, n.dy + 10);
          }
          path.lineTo(n1.dx, n1.dy - 10);
          i = i + 1;
          continue;
        }
        //path.moveTo(c.dx, c.dy -10);
        path.quadraticBezierTo(c.dx, c.dy, c.dx + 10, c.dy);
        path.lineTo(n.dx - 10, n.dy);
        continue;
      }

      if (p.dy == c.dy && c.dx == n.dx && c.dx > p.dx && n.dy < c.dy) {
        //path.moveTo(c.dx - 10, c.dy);
        path.quadraticBezierTo(c.dx, c.dy, c.dx, c.dy - 10);
        path.lineTo(n.dx, n.dy + 10);
        continue;
      }

      if (p.dx == c.dx && c.dy == n.dy && p.dy < c.dy && c.dx > n.dx) {
        if (n1 != null && c.dx - n.dx < 20 && n.dy > n1.dy) {
          //path.moveTo(c.dx, c.dy - 10);
          path.cubicTo(c.dx, c.dy + 3, n.dx, n.dy + 3, n.dx, n.dy - 10);
          path.lineTo(n1.dx, n1.dy + 10);
          i = i + 1;
          continue;
        }
        if (n1 != null && c.dx - n.dx < 20 && n.dy < n1.dy) {
          //path.moveTo(c.dx, c.dy - 10);
          if (c.dx - n.dx <= 10) {
            path.quadraticBezierTo(c.dx, c.dy, n.dx, n.dy);
          } else {
            path.quadraticBezierTo(c.dx, c.dy, c.dx - 10, c.dy);
            path.quadraticBezierTo(n.dx, n.dy, n.dx, n.dy + 10);
          }
          path.lineTo(n1.dx, n1.dy - 10);
          i = i + 1;
          continue;
        }
        //path.moveTo(c.dx, c.dy - 10);
        path.quadraticBezierTo(c.dx, c.dy, c.dx - 10, c.dy);
        path.lineTo(n.dx + 10, n.dy);
        continue;
      }

      if (n.dx == c.dx && n.dy < c.dy && c.dx < p.dx && c.dy == p.dy) {
        //path.moveTo(c.dx + 10, c.dy);
        path.quadraticBezierTo(c.dx, c.dy, c.dx, c.dy - 10);
        path.lineTo(n.dx, n.dy + 10);
        continue;
      }

      if (c.dx == p.dx && c.dy < p.dy && n.dy == c.dy && n.dx < c.dx) {
        if (n1 != null && c.dx - n.dx < 20 && n.dy < n1.dy) {
          //path.moveTo(c.dx, c.dy + 10);
          path.cubicTo(c.dx, c.dy - 3, n.dx, n.dy - 3, n.dx, n.dy + 10);
          path.lineTo(n1.dx, n1.dy - 10);
          i = i + 1;
          continue;
        }
        if (n1 != null && c.dx - n.dx < 20 && n.dy > n1.dy) {
          //path.moveTo(c.dx, c.dy + 10);
          if (c.dx - n.dx <= 10) {
            path.lineTo(c.dx, c.dy);
            path.quadraticBezierTo(n.dx, n.dy, n.dx, n.dy - 10);
          } else {
            path.quadraticBezierTo(c.dx, c.dy, n.dx + 10, n.dy);
            path.quadraticBezierTo(n.dx, n.dy, n.dx, n.dy - 10);
          }
          path.lineTo(n1.dx, n1.dy + 10);
          i = i + 1;
          continue;
        }
        //path.moveTo(c.dx, c.dy + 10);
        path.quadraticBezierTo(c.dx, c.dy, c.dx - 10, c.dy);
        path.lineTo(n.dx + 10, n.dy);
        continue;
      }

      if (p.dy == c.dy && p.dx > c.dx && c.dx == n.dx && c.dy < n.dy) {
        //path.moveTo(c.dx + 10, c.dy);
        path.quadraticBezierTo(c.dx, c.dy, c.dx, c.dy + 10);
        path.lineTo(n.dx, n.dy - 10);
        continue;
      }

    }
    path.lineTo(offsets.last.dx, offsets.last.dy);

    canvas.drawPath(path, paint);
  }

  void _drawFromCurrentToNext(
      SleepChartData current, SleepChartData next, Path path, List<Offset> offsets) {
    if (next.level.value > current.level.value) {
      if (current.index == 0) {
        path.lineTo(current.borderOffset[1].dx, current.borderOffset[1].dy);
        offsets.add(Offset(current.borderOffset[1].dx, current.borderOffset[1].dy));
      }
      path.lineTo(current.borderOffset[1].dx, next.borderOffset[0].dy);
      path.lineTo(next.borderOffset[1].dx, next.borderOffset[1].dy);

      offsets.add(Offset(current.borderOffset[1].dx, next.borderOffset[0].dy));
      offsets.add(Offset(next.borderOffset[1].dx, next.borderOffset[1].dy));
    } else {
      path.lineTo(next.borderOffset[0].dx, current.borderOffset[1].dy);
      path.lineTo(next.borderOffset[0].dx, next.borderOffset[0].dy);
      path.lineTo(next.borderOffset[1].dx, next.borderOffset[1].dy);


      offsets.removeWhere((e) => e.dx == current.borderOffset[1].dx && e.dy == current.borderOffset[1].dy);
      offsets.add(Offset(next.borderOffset[0].dx, current.borderOffset[1].dy));
      offsets.add(Offset(next.borderOffset[0].dx, next.borderOffset[0].dy));
      offsets.add(Offset(next.borderOffset[1].dx, next.borderOffset[1].dy));

    }
  }

  void drawText(Canvas canvas, String text, Offset offset) {
    final textStyle = gradient.TextStyle(
      color: Colors.white,
      fontSize: 5,
    );
    final paragraphStyle = gradient.ParagraphStyle(
      textDirection: TextDirection.ltr,
    );
    final paragraphBuilder = gradient.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(text);
    final constraints = gradient.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build()
      ..layout(constraints);
    canvas.drawParagraph(paragraph, offset);
  }
}
