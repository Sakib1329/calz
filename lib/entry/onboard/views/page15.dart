import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../controller/onboard_controller.dart';
import '../widget/dounutchart.dart';

class Page15 extends StatelessWidget {
  final OnboardController controller;

  Page15({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
SizedBox(height: 200,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              width: 30,
              height: 30,

            ),
          SizedBox(width: 10,),
          Text('All set',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),)
          ],
        ),

        SizedBox(height: 20,),
        Text(
          'Thank you for your\nconfidence in us.',
          style: TextStyle(
            color: AppColors.darkOlive,
            fontSize: 30,
            fontFamily: 'Schuyler',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 80,),
        Text(
          'Your privacy and security are\nour top priorities',
          style: TextStyle(
            color: AppColors.darkOlive,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Trajan Pro',
          ),
          textAlign: TextAlign.center,
        ),


      ],
    );
  }
}