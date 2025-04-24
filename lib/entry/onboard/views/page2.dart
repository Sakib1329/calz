import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';
import '../widget/button.dart';

class Page2 extends StatelessWidget {
  final OnboardController controller;
  Page2({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(

            children: [
              SizedBox(height: 20),
              Text(
                'How many workouts do you do per weeks?',
                style: TextStyle(
                  color: AppColors.darkOlive,
                  fontSize: 28,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.center,
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
              SizedBox(height: 100),
              Obx(() => Column(
                children: [
                  CustomButton2(
                    title: 'Lite',
                    subtitle: 'Physical activity level (1.2 to1.3)',
                    onPressed: () {
                      controller.selectGender('Lite');
                    },
                    backgroundColor: controller.selectedGender.value == 'Lite'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedGender.value == 'Lite'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Moderate',
                    subtitle: 'Physical activity level (1.2 to1.3)',
                    onPressed: () {
                      controller.selectGender('Moderate');
                    },
                    backgroundColor: controller.selectedGender.value == 'Moderate'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedGender.value == 'Moderate'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Heavy',
                    subtitle: 'Physical activity level (1.2 to1.3)',
                    onPressed: () {
                      controller.selectGender('Heavy');
                    },
                    backgroundColor: controller.selectedGender.value == 'Heavy'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedGender.value == 'Heavy'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Rest and Recovery',
                    subtitle: 'Physical activity level (1.2 to1.3)',
                    onPressed: () {
                      controller.selectGender('Rest and Recovery');
                    },
                    backgroundColor: controller.selectedGender.value == 'Rest and Recovery'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedGender.value == 'Rest and Recovery'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 10),

                ],
              )),
            ],
          ),
        )// Your Page2 UI, using `controller`
    );
  }
}