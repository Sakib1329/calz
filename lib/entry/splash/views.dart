import 'package:calzz/entry/onboard/views/onboard_views.dart';
import 'package:calzz/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widget/custom_button.dart';

class Splashview extends StatelessWidget {

  const Splashview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Button at the bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0), // adjust as needed
              child: CustomActionButton(
                text: 'Get Started Now',
                onPressed: () {
                  Get.to(OnboardViews(), transition: Transition.rightToLeft);
                },
                backgroundColor: AppColors.darkGreen,
                borderColor: AppColors.transparent,
                textColor: AppColors.lightGray,
              )

            ),
          ),
        ],
      ),
    );
  }
}
