import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';
import '../widget/button.dart';

class Page14 extends StatelessWidget {
  final OnboardController controller;
  Page14({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(

            children: [
              SizedBox(height: 20),
              Text(
                'What’s holding you back from\nachieving your goal?',
                style: TextStyle(
                  color: AppColors.darkOlive,
                  fontSize: 26,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 50),
              Obx(() => Column(
                children: [
                  CustomButton2(
                    title: 'Lack of knowledge',
                    suffixSvg: 'assets/icons/bullet.svg',
                    svgheight: 12,
                    svgwidth: 12,

                    onPressed: () {
                      controller.selectedholdingback('Balanced');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectedholdingback.value == 'Balanced'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedholdingback.value == 'Balanced'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Bad habits & low motivation',
                    suffixSvg: 'assets/icons/bullet.svg',
                    svgheight: 12,
                    svgwidth: 12,
                    onPressed: () {
                      controller.selectedholdingback('Pescatarian');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectedholdingback.value == 'Pescatarian'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedholdingback.value == 'Pescatarian'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Too busy to plan & prepare',
                    suffixSvg: 'assets/icons/bullet.svg',
                    svgheight: 12,
                    svgwidth: 12,
                    onPressed: () {
                      controller.selectedholdingback('Vegetarian');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectedholdingback.value == 'Vegetarian'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedholdingback.value == 'Vegetarian'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Travel a lot',
                    suffixSvg: 'assets/icons/bullet.svg',
                    svgheight: 12,
                    svgwidth: 12,
                    onPressed: () {
                      controller.selectedholdingback('Vegan');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectedholdingback.value == 'Vegan'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedholdingback.value == 'Vegan'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Digestion or health issues',
                    suffixSvg: 'assets/icons/bullet.svg',
                    svgheight: 12,
                    svgwidth: 12,
                    onPressed: () {
                      controller.selectedholdingback('Flexible eating');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectedholdingback.value == 'Flexible eating'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedholdingback.value == 'Flexible eating'
                        ? AppColors.lightGray
                        : AppColors.darkOlive,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    title: 'Mismanagement',
                    suffixSvg: 'assets/icons/bullet.svg',
                    svgheight: 12,
                    svgwidth: 12,
                    onPressed: () {
                      controller.selectedholdingback('Mismanagement');
                      if(controller.isselected.value==false)
                        controller.isselected.toggle();
                    },
                    backgroundColor: controller.selectedholdingback.value == 'Mismanagement'
                        ? AppColors.darkGreen
                        : AppColors.neutralUltraLight,
                    borderColor: AppColors.lightGray,
                    textColor: controller.selectedholdingback.value == 'Mismanagement'
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