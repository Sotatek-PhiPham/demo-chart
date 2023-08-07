import 'package:demo_chart/sleep_stage_enum.dart';
import 'package:flutter/material.dart';

class YAxisWidget extends StatelessWidget {
  final double width;
  final double height;

  const YAxisWidget({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.blueGrey,
      child: CustomPaint(
        painter: YAxisPaint(),
      ),
    );
  }
}

class YAxisPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (SleepStageEnum item in SleepStageEnum.values) {
      TextPainter tp = drawYAxisLabel(
        label: item.name,
        color: item.color,
      );
      tp.paint(
          canvas, calculatePositionForYAxisLabel(size: size, sleepStage: item));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Offset calculatePositionForYAxisLabel({
    required Size size,
    required SleepStageEnum sleepStage,
  }) {
    double heightOfLabel = drawYAxisLabel(label: SleepStageEnum.values[0].name, color: sleepStage.color).height;
    const x = 0.0;
    double distanceBetween2labels = (size.height - (heightOfLabel * 4)) / (SleepStageEnum.values.length - 1);
    final y = sleepStage.value * distanceBetween2labels + sleepStage.value * heightOfLabel;
    return Offset(x, y);
  }

  TextPainter drawYAxisLabel({
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
