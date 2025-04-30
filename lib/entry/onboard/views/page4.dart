import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../controller/onboard_controller.dart';
import '../widget/button.dart';

class Page4 extends StatelessWidget {
  final OnboardController controller;
  Page4({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Obx(()=>Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(

            children: [
              SizedBox(height: 20),
              Text(
                'Have you Tried any other calorie tracking app?',
                style: TextStyle(
                  color: AppColors.darkOlive,
                  fontSize: 28,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 130,),
              CustomButton2(
                suffixSvg: 'assets/icons/like.svg',
                title: 'Yes',
                onPressed: () {
                  controller.selectedtrackingapp('Yes');
                  if(controller.isselected.value==false)
                    controller.isselected.toggle();
                },
                backgroundColor: controller.selectedtrackingapp.value == 'Yes'
                    ? AppColors.darkGreen
                    : AppColors.neutralUltraLight,
                borderColor: AppColors.lightGray,
                textColor: controller.selectedtrackingapp.value == 'Yes'
                    ? AppColors.lightGray
                    : AppColors.darkOlive,
              ),
              SizedBox(height: 20),
              CustomButton2(
              suffixSvg: 'assets/icons/dislike.svg',
                title: 'No',
                onPressed: () {
                  controller.selectedtrackingapp('No');
                  if(controller.isselected.value==false)
                    controller.isselected.toggle();
                },
                backgroundColor: controller.selectedtrackingapp.value =='No'
                    ? AppColors.darkGreen
                    : AppColors.neutralUltraLight,
                borderColor: AppColors.lightGray,
                textColor: controller.selectedtrackingapp.value == 'No'
                    ? AppColors.lightGray
                    : AppColors.darkOlive,
              ),

            ],
          ),
        ))
    );
  }
}