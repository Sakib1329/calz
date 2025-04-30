import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';

class Page9 extends StatelessWidget {
  final OnboardController controller;


  Page9({required this.controller});

  @override
  Widget build(BuildContext context) {
    final image=controller.selectgoal.value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Achieve your desired results in appropriate time',
            style: TextStyle(
              color: AppColors.darkOlive,
              fontSize: 30,
              fontFamily: 'Schuyler',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 60),
         Image.asset('assets/images/$image.png'),
        ],
      ),
    );
  }
}