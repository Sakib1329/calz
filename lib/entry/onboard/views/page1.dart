import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';

class Page1 extends StatelessWidget {
  final OnboardController controller;

  Page1({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Choose Your Gender',
          style: TextStyle(
            color: AppColors.darkOlive,
            fontSize: 30,
            fontFamily: 'Schuyler',
          ),
        ),
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
        SizedBox(height: 200),
        Obx(() => Column(
          children: [
            CustomActionButton(
              text: 'Male',
              onPressed: () {
                controller.selectGender('male');
              },
              backgroundColor: controller.selectedGender.value == 'male'
                  ? AppColors.darkGreen
                  : AppColors.neutralUltraLight,
              borderColor: AppColors.lightGray,
              textColor: controller.selectedGender.value == 'male'
                  ? AppColors.lightGray
                  : AppColors.darkOlive,
            ),
            SizedBox(height: 10),
            CustomActionButton(
              text: 'Female',
              onPressed: () {
                controller.selectGender('female');
              },
              backgroundColor: controller.selectedGender.value == 'female'
                  ? AppColors.darkGreen
                  : AppColors.neutralUltraLight,
              borderColor: AppColors.lightGray,
              textColor: controller.selectedGender.value == 'female'
                  ? AppColors.lightGray
                  : AppColors.darkOlive,
            ),
          ],
        )),
      ],
    );
  }
}