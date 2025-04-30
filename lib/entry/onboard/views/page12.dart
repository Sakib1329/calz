import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../controller/onboard_controller.dart';
import '../widget/button.dart';
import '../widget/slider.dart';

class Page12 extends StatelessWidget {
  final OnboardController controller;
  Page12({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Obx(()=>Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(

            children: [
              SizedBox(height: 20),
              Text(
                'Please enter how fast you\nwould like to\nachieve your goal?',
                style: TextStyle(
                  color: AppColors.darkOlive,
                  fontSize: 28,
                  fontFamily: 'Schuyler',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 130,),
            Row(

              children: [
                SizedBox(width: 28,),
                Text('Slow',style: TextStyle(color: AppColors.darkOlive,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(width: 90,),
                Text('Normal',style: TextStyle(color: AppColors.darkOlive,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(width: 85,),
                Text('Fast',style: TextStyle(color: AppColors.darkOlive,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ), SizedBox(height: 10,),
              Row(

                children: [
                  SizedBox(width: 25,),
                  GestureDetector(
                    onTap: (){
      final   value=0.0;
      controller.updateValue(value);

                    },
                    child: SvgPicture.asset(
                      'assets/icons/slow.svg', // Provide the path to your SVG asset
                      width: 40, // Set width of the icon
                      height: 40, // Set height of the icon
                      color: controller.sliderValue==0.0? AppColors.darkOlive :AppColors.borderGray, // Optional: Set the color of the SVG icon
                    ),
                  ),
                  SizedBox(width: 10,),
                  SvgPicture.asset(
                    'assets/icons/leftarrow.svg', // Provide the path to your SVG asset
                    width: 10, // Set width of the icon
                    height: 10, // Set height of the icon
                    color: AppColors.darkOlive, // Optional: Set the color of the SVG icon
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                   final   value=1.0;
                      controller.updateValue(value);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/medium.svg', // Provide the path to your SVG asset
                      width: 40, // Set width of the icon
                      height: 40,// Set height of the icon
                      color: controller.sliderValue==1.0? AppColors.darkOlive :AppColors.borderGray, // Optional: Set the color of the SVG icon
                    ),
                  ),
                  SizedBox(width: 10,),
                  SvgPicture.asset(
                    'assets/icons/rightarrow.svg', // Provide the path to your SVG asset
                    width: 10, // Set width of the icon
                    height: 10,
                    // Set height of the icon
                    color: AppColors.darkOlive, // Optional: Set the color of the SVG icon
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      final   value=2.0;
                      controller.updateValue(value);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/fast.svg', // Provide the path to your SVG asset
                      width: 40, // Set width of the icon
                      height: 40, // Set height of the icon
                      color: controller.sliderValue==2.0? AppColors.darkOlive :AppColors.borderGray, // Optional: Set the color of the SVG icon
                    ),
                  ),


                ],
              ),
              Obx(() => Padding(
                padding: const EdgeInsets.only(left:20.0,right: 10),
                child: CustomProgressBar(
                  value: controller.sliderValue.value,
                  onChanged: (value) => controller.updateValue(value),
                ),
              )),

            ],
          ),
        ))
    );
  }
}