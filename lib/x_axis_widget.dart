import 'package:demo_chart/sleep_chart_data.dart';
import 'package:demo_chart/sleep_stage_enum.dart';
import 'package:flutter/material.dart';

class XAxisWidget extends StatelessWidget {
  final double width;
  final double height;
  final double distanceFromStartToFirstLabel;
  final List<SleepChartData> data;

  const XAxisWidget({
    super.key,
    required this.width,
    required this.height,
    required this.distanceFromStartToFirstLabel,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.blue,
      child: CustomPaint(
        painter: XAxisPaint(distanceFromStartToFirstLabel, data),
      ),
    );
  }
}

class XAxisPaint extends CustomPainter {
  final double distanceFromStartToFirstLabel;
  final List<SleepChartData> data;

  final double _strokeWidth = 2;
  final int _numOfLabel = 9;

  XAxisPaint(this.distanceFromStartToFirstLabel, this.data);

  @override
  void paint(Canvas canvas, Size size) {
    /// divide x-axis into [_numOfLabel - 1] segments (excluding [distanceFromStartToFirstLabel])
    /// distance between two segments
    double ds = (size.width - distanceFromStartToFirstLabel - (_numOfLabel * _strokeWidth)) /
        (_numOfLabel - 1);

    /// divide x-axis into [_numOfLabel - 1] segments (excluding [distanceFromStartToFirstLabel]), draw label and line
    for (int position = 0; position < _numOfLabel; position++) {
      _drawXAxisLineAtPosition(
        canvas: canvas,
        size: size,
        position: position,
        ds: ds,
      );
      /// only draw label at position [0], [_numOfLabel] and [_numOfLabel ~/ 2]
      if (position == 0 || position == _numOfLabel - 1 || position == _numOfLabel ~/ 2) {
        _drawXAxisLabelAtPosition(
            canvas: canvas,
            size: size,
            position: position,
            ds: ds,
            label: '08:00'
        );
      }
    }

    /// draw X axis line
    _drawXAxisLine(canvas: canvas, size: size);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  /// draw XAxis Line At Position
  void _drawXAxisLineAtPosition({
    required int position,
    required double ds, // distance between two labels
    required Size size,
    required Canvas canvas,
  }) {
    int middlePosition = _numOfLabel ~/ 2;
    double p1Y = (position == 0 || position == _numOfLabel - 1 || position == middlePosition) ? 0 : 5;
    final p1 = Offset(distanceFromStartToFirstLabel + position * ds, p1Y);
    final p2 = Offset(distanceFromStartToFirstLabel + position * ds, (size.height / 3));
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = _strokeWidth;
    canvas.drawLine(p1, p2, paint);
  }

  void _drawXAxisLabelAtPosition({
    required int position,
    required double ds, // distance between two labels
    required Size size,
    required Canvas canvas,
    required String label,
  }) {
    TextPainter tp = _drawXAxisLabel(label: label);
    double dx = distanceFromStartToFirstLabel + position * ds - tp.width / 2;
    if ((size.width - dx) < tp.width) {
      dx = size.width - tp.width;
    }
    double dy = size.height - tp.height;
    tp.paint(canvas, Offset(dx, dy));
  }

  void _drawXAxisLine({
    required Canvas canvas,
    required Size size,
  }) {
    final p1 = Offset(0, (size.height / 3));
    final p2 = Offset(size.width, (size.height / 3));
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = _strokeWidth;

    canvas.drawLine(p1, p2, paint);
  }

  TextPainter _drawXAxisLabel({
    required String label,
    double? maxWidth,
  }) {
    const textStyle = TextStyle(
      color: Colors.black,
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

  int _totalTimeInSeconds() {
    DateTime start = data.first.dateTime;
    DateTime end = data.last.dateTime;
    return end.difference(start).inSeconds;
  }
}
