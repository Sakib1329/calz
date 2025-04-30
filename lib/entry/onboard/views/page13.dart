import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';
import '../widget/button.dart';

class Page13 extends StatelessWidget {
  final OnboardController controller;
  Page13({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(

            children: [
              SizedBox(height: 20),
              Text(
                'Please Select your type of diet',
                style: TextStyle(
                  color: AppColors.darkOlive,
                  fontSize: 26,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 70),
              Obx(() => Column(
                children: [
                  CustomButton2(
                    title: 'Balanced',
                    suffixSvg: 'assets/icons/balanced.svg',
                    onPressed: () {
                      controller.selecteddiettype('Balanced');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selecteddiettype.value == 'Balanced'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selecteddiettype.value == 'Balanced'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Pescatarian',
                    suffixSvg: 'assets/icons/pescatarian.svg',
                    onPressed: () {
                      controller.selecteddiettype('Pescatarian');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selecteddiettype.value == 'Pescatarian'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selecteddiettype.value == 'Pescatarian'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Vegetarian',
                    suffixSvg: 'assets/icons/vegetarian.svg',
                    onPressed: () {
                      controller.selecteddiettype('Vegetarian');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selecteddiettype.value == 'Vegetarian'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selecteddiettype.value == 'Vegetarian'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Vegan',
                    suffixSvg: 'assets/icons/vegan.svg',
                    onPressed: () {
                      controller.selecteddiettype('Vegan');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selecteddiettype.value == 'Vegan'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selecteddiettype.value == 'Vegan'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Flexible eating',
                    suffixSvg: 'assets/icons/flexible.svg',
                    onPressed: () {
                      controller.selecteddiettype('Flexible eating');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selecteddiettype.value == 'Flexible eating'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selecteddiettype.value == 'Flexible eating'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),

                ],
              )),
            ],
          ),
        )// Your Page2 UI, using `controller`
    );
  }
}