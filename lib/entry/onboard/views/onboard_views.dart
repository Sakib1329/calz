import 'package:calzz/entry/onboard/controller/onboard_controller.dart';
import 'package:calzz/entry/splash/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';

class OnboardViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (controller.currentStep.value == 0) {
                    Get.to(Splashview(), transition: Transition.leftToRight);
                  }
                  controller.back();
                },
                icon: Icon(Icons.arrow_back, color: AppColors.darkOlive),
              ),
              Text(
                'Back',
                style: TextStyle(
                  color: AppColors.darkOlive,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          leadingWidth: 150,
        ),
        body: Column(
          children: [
            Obx(() {
              final step = controller.currentStep.value;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            value: step.toDouble(),
                            min: 0,
                            activeColor: AppColors.darkGreen,
                            inactiveColor: AppColors.gray,
                            max: controller.pages.length - 1.toDouble(),
                            divisions: controller.pages.length - 1,
                            onChanged: (newStep) {
                              controller.currentStep.value = newStep.toInt();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            Expanded(
              child: Obx(() => controller.pages[controller.currentStep.value]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Obx(() => CustomActionButton(
                text: 'Next',
                onPressed: controller.selectedGender.value.isNotEmpty
                    ? () => controller.next()
                    : () {},
                backgroundColor: controller.selectedGender.value.isNotEmpty
                    ? AppColors.darkGreen
                    : AppColors.neutralGray,
                borderColor: AppColors.transparent,
                textColor: controller.selectedGender.value.isNotEmpty
                    ? AppColors.lightGray
                    : AppColors.pureWhite,
              )),
            ),
          ],
        ),
      ),
    );
  }
}