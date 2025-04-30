import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';
import '../widget/button.dart'; // CustomButton2
import 'package:country_picker/country_picker.dart';

class Page3 extends StatelessWidget {
  final OnboardController controller;
  Page3({required this.controller});

  void _openCountryPicker(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
      controller.selectedCountry(country);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
      builder: (controller) => Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Please select your country',
            style: TextStyle(
              color: AppColors.darkOlive,
              fontSize: 28,
              fontFamily: 'Schuyler',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 220,),
          Obx(() => CustomActionButton(
            text: controller.selectedCountry.value != null
                ? "${controller.selectedCountry.value!.flagEmoji}  ${controller.selectedCountry.value!.name}"
                : "Tap to select country",
            onPressed: () { _openCountryPicker(context);
            if(controller.isselected.value==false)
              controller.isselected.toggle();
              },
              backgroundColor: controller.selectedCountry.value!=null
                  ? AppColors.darkGreen
                  : AppColors.neutralUltraLight,
              borderColor: AppColors.lightGray,
              textColor: controller.selectedCountry.value!=null
                  ? AppColors.lightGray
                  : AppColors.darkOlive
          )),
        ],
      ),
    );
  }
}
