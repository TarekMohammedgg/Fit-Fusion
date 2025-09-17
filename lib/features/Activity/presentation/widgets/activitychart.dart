import 'package:fit_fusion/features/Activity/presentation/views_models/activitymodel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityChart extends StatelessWidget {
  ActivityChart({super.key});

  // بيانات النشاط (مثال: آخر 7 أيام)
  final List<ActivityData> chartData = [
    ActivityData("Mon", 1.5),
    ActivityData("Tue", 2.0),
    ActivityData("Wed", 0.5),
    ActivityData("Thu", 3.0),
    ActivityData("Fri", 2.5),
    ActivityData("Sat", 4.0),
    ActivityData("Sun", 1.0),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(title: AxisTitle(text: "Days")),
      primaryYAxis: NumericAxis(title: AxisTitle(text: "Hours"), interval: 1),
      series: <CartesianSeries>[
        ColumnSeries<ActivityData, String>(
          color: Color(0xff33263B),
          dataSource: chartData,
          xValueMapper: (ActivityData data, _) => data.day,
          yValueMapper: (ActivityData data, _) => data.hours,
        ),
      ],
    );
  }
}
