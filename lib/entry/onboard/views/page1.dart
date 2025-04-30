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
                controller.selectedGender('Male');
                if(controller.isselected.value==false)
                controller.isselected.toggle();

              },
              backgroundColor: controller.selectedGender.value == 'Male'
                  ? AppColors.darkGreen
                  : AppColors.neutralUltraLight,
              borderColor: AppColors.lightGray,
              textColor: controller.selectedGender.value == 'Male'
                  ? AppColors.lightGray
                  : AppColors.darkOlive,
            ),
            SizedBox(height: 10),
            CustomActionButton(
              text: 'Female',
              onPressed: () {
                controller.selectedGender('Female');
                if(controller.isselected.value==false)
                  controller.isselected.toggle();
              },
              backgroundColor: controller.selectedGender.value == 'Female'
                  ? AppColors.darkGreen
                  : AppColors.neutralUltraLight,
              borderColor: AppColors.lightGray,
              textColor: controller.selectedGender.value == 'Female'
                  ? AppColors.lightGray
                  : AppColors.darkOlive,
            ),
          ],
        )),
      ],
    );
  }
}