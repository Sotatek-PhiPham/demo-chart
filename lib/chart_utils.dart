import 'dart:ui';

import 'package:demo_chart/sleep_chart_data.dart';
import 'package:demo_chart/sleep_stage_enum.dart';

class ChartUtils {
  static const double yAxisWidth = 60.0;
  static const double xAxisHeight = 50.0;
  static const double strokeWidth = 5.0;
  static const double borderRadius = 10.0;
  static const double itemHeight = 40.0;
  static const double paddingWidthXAxis = 7.0;
  static const int numOfXAxisLabel = 9;

  static int countTotalSleepTimeInSeconds(List<SleepChartData> data) {
    DateTime start = data.first.dateTime;
    DateTime end = data.last.dateTime;
    int seconds = end.difference(start).inSeconds + data.last.seconds;
    return seconds;
  }

  static List<double>? gradientStop(int numberOfColor) {
    if (numberOfColor < 3) {
      return null;
    }
    List<double> stops = [];
    double dis = 1 / (numberOfColor - 1);
    for (int i = 0; i < numberOfColor; i ++) {
      stops.add(i * dis);
    }
    return stops;
  }

  /// calculate offset for [SleepChartData]
  /// return list[Offset] with first item is start offset, second item is end offset
  ///
  static List<Offset> calculateOffsetForItem({
    required SleepChartData item,
    required List<SleepChartData> data,
    required Size size,
  }) {
    double dxStart = ChartUtils.yAxisWidth;
    double dyEnd = size.height - ChartUtils.xAxisHeight;
    double pixelPerSecond = (size.width - dxStart - ChartUtils.strokeWidth) / countTotalSleepTimeInSeconds(data);

    double x1 = dxStart + pixelPerSecond * item.dateTime.difference(data.first.dateTime).inSeconds;
    double y1 = item.level.value *
        ((dyEnd - ChartUtils.strokeWidth) / (SleepStageEnum.values.length - 1));

    double x2 = x1 + item.seconds * pixelPerSecond;
    double y2 = item.level.value *
        ((dyEnd - ChartUtils.strokeWidth) / (SleepStageEnum.values.length - 1));

    return [
      Offset(x1 == dxStart ? dxStart + ChartUtils.strokeWidth / 2 : x1, y1 == 0 ? ChartUtils.strokeWidth / 2 : y1),
      Offset(x2 == size.width ? size.width - ChartUtils.strokeWidth / 2 : x2, y2 == 0 ? ChartUtils.strokeWidth / 2 : y2),
    ];
  }

  static List<Offset> calculate4OffsetForItem({
    required SleepChartData item,
    required List<SleepChartData> data,
    required Size size,
  }) {
    double dxStart = ChartUtils.yAxisWidth;
    double dyEnd = size.height - ChartUtils.xAxisHeight - ChartUtils.itemHeight - paddingWidthXAxis;
    double pixelPerSecond = (size.width - dxStart - ChartUtils.strokeWidth) / countTotalSleepTimeInSeconds(data);

    double x1 = dxStart + pixelPerSecond * item.dateTime.difference(data.first.dateTime).inSeconds;
    double y1 = item.level.value *
        ((dyEnd - ChartUtils.strokeWidth) / (SleepStageEnum.values.length - 1));

    double x2 = x1 + item.seconds * pixelPerSecond;
    double y2 = item.level.value *
        ((dyEnd - ChartUtils.strokeWidth) / (SleepStageEnum.values.length - 1));

    return [
      Offset(x1, y1),
      Offset(x2, y2),
      Offset(x2, y2 + itemHeight),
      Offset(x1, y1 + itemHeight),
    ];
  }

  static List<Offset> calculate4OffsetForItemBorder({
    required SleepChartData item,
    required List<SleepChartData> data,
    required Size size,
  }) {
    double dxStart = ChartUtils.yAxisWidth;
    double dyEnd = size.height - ChartUtils.xAxisHeight - itemHeight - paddingWidthXAxis;
    double pixelPerSecond = (size.width - dxStart - ChartUtils.strokeWidth) / countTotalSleepTimeInSeconds(data);

    double x1 = dxStart + pixelPerSecond * item.dateTime.difference(data.first.dateTime).inSeconds;
    double y1 = item.level.value *
        ((dyEnd - ChartUtils.strokeWidth) / (SleepStageEnum.values.length - 1));

    double x2 = x1 + item.seconds * pixelPerSecond;
    double y2 = item.level.value *
        ((dyEnd - ChartUtils.strokeWidth) / (SleepStageEnum.values.length - 1));

    return [
      Offset(x1 -4, y1 -4),
      Offset(x2 + 4, y2 -4),
      Offset(x2 + 4, y2 + 44),
      Offset(x1 - 4, y1 + 44),
    ];
  }

}