import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomDonutChart extends StatelessWidget {

  final String centerText;
  final List<DonutChartData> data;

  const CustomDonutChart({
    Key? key,

    required this.centerText,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        SizedBox(
          height: 250,
          width: 370,
          child: SfCircularChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.right,
              overflowMode: LegendItemOverflowMode.scroll,
              textStyle: const TextStyle(fontSize: 12),
            ),
            series: <CircularSeries>[
              DoughnutSeries<DonutChartData, String>(
                dataSource: data,
                xValueMapper: (DonutChartData d, _) => d.category,
                yValueMapper: (DonutChartData d, _) => d.value,
                pointColorMapper: (DonutChartData d, _) => d.color,
                innerRadius: '60%',
                radius: '80%',
                dataLabelMapper: (DonutChartData d, _) =>
                '${d.category}\n${d.value.toInt()}%',
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.inside,
                  textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Text(
                  centerText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DonutChartData {
  final String category;
  final double value;
  final Color color;

  const DonutChartData(this.category, this.value, this.color);
}
