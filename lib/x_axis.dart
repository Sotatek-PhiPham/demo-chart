import 'package:intl/intl.dart' as intl;

import 'package:demo_chart/chart_utils.dart';
import 'package:flutter/material.dart';

class XAxis {
  XAxis._();

  static late double dyStart;
  static late double dyEnd;
  static late double dis; // distance between two labels
  static const lineWidth = 1.0;

  static void drawXAxis({
    required Canvas canvas,
    required Size size,
    required DateTime startTime,
    required int totalTimeInSeconds,
  }) {
    dyStart = size.height - ChartUtils.xAxisHeight;
    dyEnd = size.height;
    dis = (size.width -
            ChartUtils.yAxisWidth -
            (ChartUtils.numOfXAxisLabel * lineWidth)) /
        (ChartUtils.numOfXAxisLabel - 1);

    _drawXAxisLine(canvas: canvas, size: size);
    for (int position = 0; position < ChartUtils.numOfXAxisLabel; position++) {
      _drawXAxisLineAtPosition(
        canvas: canvas,
        size: size,
        position: position,
      );

      /// only draw label at position [0], [_numOfLabel] and [_numOfLabel ~/ 2]
      if (_isPositionForMainLabel(position)) {
        _drawXAxisLabelAtPosition(
            canvas: canvas,
            size: size,
            position: position,
            label: _labelForPosition(
              position,
              startTime,
              size,
              totalTimeInSeconds,
            ));
      }
    }
  }

  static String _labelForPosition(int position, DateTime startTime, Size size,
      int totalTimeInSeconds) {
    if (position == 0) {
      return intl.DateFormat('HH:mm').format(startTime);
    }
    double pixelPerSeconds =
        totalTimeInSeconds / (size.width - ChartUtils.yAxisWidth);
    double duration = pixelPerSeconds * position * dis + lineWidth * pixelPerSeconds;
    String label = intl.DateFormat('HH:mm').format(startTime.add(Duration(seconds: duration.toInt())));
    return label;
  }

  static bool _isPositionForMainLabel(int position) {
    return position == 0 ||
        position == ChartUtils.numOfXAxisLabel - 1 ||
        position == ChartUtils.numOfXAxisLabel ~/ 2;
  }

  /// draw XAxis Line At Position
  static void _drawXAxisLineAtPosition({
    required int position,
    required Size size,
    required Canvas canvas,
  }) {
    double p1Y = _isPositionForMainLabel(position) ? dyStart : dyStart + 5;
    final p1 = Offset(ChartUtils.yAxisWidth + position * dis, p1Y);
    final p2 = Offset(ChartUtils.yAxisWidth + position * dis,
        dyStart + (ChartUtils.xAxisHeight / 3));
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = lineWidth;
    canvas.drawLine(p1, p2, paint);
  }

  static void _drawXAxisLabelAtPosition({
    required int position,
    required Size size,
    required Canvas canvas,
    required String label,
  }) {
    double sp = 8.0; // space between label and line
    TextPainter tp = _drawXAxisLabel(label: label);
    double dx = ChartUtils.yAxisWidth + position * dis - tp.width / 2;
    if ((size.width - dx) < tp.width) {
      dx = size.width - tp.width;
    }
    double dy = dyStart + (ChartUtils.xAxisHeight / 3) + sp;
    tp.paint(canvas, Offset(dx, dy));
  }

  static void _drawXAxisLine({
    required Canvas canvas,
    required Size size,
  }) {
    Offset p1 = Offset(0, dyStart + ChartUtils.xAxisHeight / 3);
    final p2 = Offset(size.width, dyStart + ChartUtils.xAxisHeight / 3);
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = lineWidth;

    canvas.drawLine(p1, p2, paint);
  }

  static TextPainter _drawXAxisLabel({
    required String label,
    double? maxWidth,
  }) {
    var textStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontSize: 12,
    );
    final textSpan = TextSpan(
      text: label,
      style: textStyle,
    );
    final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.end,
        textDirection: TextDirection.rtl);
    textPainter.layout(minWidth: 0, maxWidth: maxWidth ?? double.infinity);
    return textPainter;
  }
}
