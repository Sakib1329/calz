import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/colors.dart';

class HealthScoreWidget extends StatelessWidget {
  final double score; // Score out of 10
  final double maxScore; // Maximum score (default 10)

  const HealthScoreWidget({
    Key? key,
    required this.score,
    this.maxScore = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ScoreData> chartData = [
      ScoreData('Score', score),
      ScoreData('Remaining', maxScore - score),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Icon and Text
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.darkOlive
                  )
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/heartbreak.svg', // Provide the path to your SVG asset
                    width: 30, // Set width of the icon
                    height: 30, // Set height of the icon
                    color: AppColors.myRed, // Optional: Set the color of the SVG icon
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Health Score',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${score.toInt().toString().padLeft(2, '0')}/${maxScore.toInt()}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Right side: Circular Progress Chart
          SizedBox(
            width: 60,
            height: 60,
            child: SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<ScoreData, String>(
                  dataSource: chartData,
                  xValueMapper: (ScoreData data, _) => data.label,
                  yValueMapper: (ScoreData data, _) => data.value,
                  pointColorMapper: (ScoreData data, _) =>
                  data.label == 'Score' ? Colors.black : Colors.grey.shade300,
                  innerRadius: '50%', // Makes it a thin ring
                  radius: '200%',
                  startAngle: 0, // Start from the top
                  endAngle: 0, // Full circle
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreData {
  ScoreData(this.label, this.value);
  final String label;
  final double value;
}