import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

import '../controller/onboard_controller.dart';
import '../widget/datescroller.dart';

class Page7 extends StatelessWidget {
  final OnboardController controller;

  Page7({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Please enter your \ndate of birth',
          style: TextStyle(
            color: AppColors.darkOlive,
            fontSize: 30,
            fontFamily: 'Schuyler',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5,),
        Text(
          'It will be used to calibrate your custom plan.',
          style: TextStyle(
            color: AppColors.darkOlive,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Trajan Pro',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Material(
                color: AppColors.transparent,
                child: DateScrollerWidget(
                  onDateSelected: (selectedDate) {
                    print("Selected Date: $selectedDate");
                  },
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }


}

