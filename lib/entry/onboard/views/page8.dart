import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';
import '../widget/button.dart';

class Page8 extends StatelessWidget {
  final OnboardController controller;
  Page8({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(

            children: [
              SizedBox(height: 20),
              Text(
                'Please Choose what Goal you like to achieve',
                style: TextStyle(
                  color: AppColors.darkOlive,
                  fontSize: 28,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 70),
              Obx(() => Column(
                children: [
                  CustomButton2(
                    title: 'Gain Weight',
                  suffixSvg: 'assets/icons/gainweight.svg',
                    onPressed: () {
                      controller.selectgoal('weightgain');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectgoal.value == 'weightgain'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectgoal.value == 'weightgain'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Lose Weight',
                    suffixSvg: 'assets/icons/loseweight.svg',
                    onPressed: () {
                      controller.selectgoal('weightloss');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectgoal.value == 'weightloss'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectgoal.value == 'weightloss'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Maintain Weight',
                    suffixSvg: 'assets/icons/maintainweight.svg',
                    onPressed: () {
                      controller.selectgoal('maintained');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectgoal.value == 'maintained'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectgoal.value == 'maintained'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'I’m Just exploring',
                    suffixSvg: 'assets/icons/exploring.svg',
                    onPressed: () {
                      controller.selectgoal('weight');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectgoal.value == 'weight'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectgoal.value == 'weight'
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