import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';
import '../widget/dounutchart.dart';
import '../widget/healthscorechart.dart';

class Page16 extends StatelessWidget {
  final OnboardController controller;

  Page16({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          SvgPicture.asset('assets/icons/check.svg', width: 50, height: 50),
      SizedBox(height: 10,),
          Text(
            'Great news! Your\npersonalized plan is ready!',
            style: TextStyle(
              color: AppColors.darkOlive,
              fontSize: 30,
              fontFamily: 'Schuyler',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          Text(
            'Your weight gaining schedule:',
            style: TextStyle(
              color: AppColors.darkOlive,
              fontSize: 18,
              fontWeight: FontWeight.w500,

            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          Container(
            width: 200,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.verylightbluishwhite,
            ),
      
            child: Center(child: Text('Lose 8kg by July 25, 2025',style: TextStyle(color: AppColors.darkOlive),)),
            
          ),
          SizedBox(height: 20,),
          Container(
            color: AppColors.verylightbluishwhite,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text(
                  'Your Daily recommendation',
                  style: TextStyle(
                    color: AppColors.darkOlive,
                    fontSize: 20,
                    fontFamily: 'Schuyler',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3,),
                Text(
                  'You can modify anything',
                  style: TextStyle(
                    color: AppColors.darkOlive,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,

                  ),
                  textAlign: TextAlign.center,
                ),
                CustomDonutChart(
                  centerText: '1800\nkcal',
                  data: const [
                    DonutChartData('Carbs', 50, Color(0xFFF28A8A)),
                    DonutChartData('Protein', 30, Color(0xFFFACB7A)),
                    DonutChartData('Fats', 20, Color(0xFF8AD8F2)),
                  ],


                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
              width: 370,
              child: HealthScoreWidget(score: 7)),
          SizedBox(height: 20,),
          SizedBox(
              width: 370,
              child: Image.asset('assets/images/strategies.png')),
          SizedBox(height: 20,),
        ],

      ),

    );
  }
}
