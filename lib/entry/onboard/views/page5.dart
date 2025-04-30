import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/colors.dart';
import '../controller/onboard_controller.dart';
import '../widget/heightpicker.dart';

class Page5 extends StatelessWidget {
  final OnboardController controller;

  Page5({required this.controller});

  final PageController _pageController = PageController();

  void _onSelectUnit(int index) {
    controller.selectUnit(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildUnitButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onSelectUnit(index),
        child: Obx(() {
          final bool isSelected = controller.selectedUnitIndex.value == index;
          return Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.darkOlive : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.transparent),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.darkOlive,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
          );
        }),
      ),
    );
  }

 
  void onHeightChanged(double value) {
    controller.selectheight.value=value;
    controller.isselected.value = true;




  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final RxString selectedUnit = "Centimeters".obs;

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Please enter your height',
          style: TextStyle(
            color: AppColors.darkOlive,
            fontSize: 30,
            fontFamily: 'Schuyler',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'This will be utilized to adjust your tailored plan',
          style: TextStyle(
            color: AppColors.darkOlive,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Trajan Pro',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        // Unit selection
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutralExtraLight),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _buildUnitButton('Centimeters', 0),
              _buildUnitButton('Feet', 1),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // PageView
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: screenHeight * 0.6,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  controller.selectUnit(index);
               
                },
                children: [
                  Row(
                    children: [
                      VerticalScrollPicker(
                        key: ValueKey(selectedUnit),
                        height: screenHeight * 0.48,
                        width: screenWidth * 0.45,
                        bottomValue: 0,
                        topValue: selectedUnit == "Centimeters" ? 300 : 100,
                        interval: selectedUnit == "Centimeters" ? 5 : 12,
                        lineGap: 20,
                        style: const VerticalScrollPickerStyle(
                          backgroundItemColor: Color(0xFFAFAFAF),
                          foregroundItemColor: Color(0xFF010101),
                        ),
                        onChanged: onHeightChanged, // Pass the callback here
                        onPickedValueFormat: (value) {
                          if (selectedUnit == "Centimeters") {

                            return "${value.toStringAsFixed(1)} cm";
                          } else {
                            final feet = (value ~/ 12);
                            final inch = (value % 12).floor();
                            return "$feet ft $inch in";
                          }
                        },
                        onScaleValueFormat: (value) {
                          if (selectedUnit == "Centimeters") {
                            return "${value.toStringAsFixed(0)} cm";
                          } else {
                            final feet = (value ~/ 12);
                            final inch = (value % 12).floor();
                            return "$feet ft $inch in";
                          }
                        },
                      ),

                      Expanded(
                        child: Image.asset(
                          controller.selectedGender.value == 'Male'
                              ? 'assets/images/male.png'
                              : 'assets/images/female.png',
                        ),
                      ),
                    ],
                  ),
                  // Feet Page (change here)
                  Row(
                    children: [
                      VerticalScrollPicker(
                        key: ValueKey("Feet"), // Unique key for Feet page
                        height: screenHeight * 0.48,
                        width: screenWidth * 0.45,
                        bottomValue: 0,
                        topValue: 100, // maximum feet height value
                        interval: 12, // interval of 12 inches per unit
                        lineGap: 20,
                        style: const VerticalScrollPickerStyle(
                          backgroundItemColor: Color(0xFFAFAFAF),
                          foregroundItemColor: Color(0xFF010101),
                        ),
                        onChanged: onHeightChanged, // Pass the callback here
                        onPickedValueFormat: (value) {
                          final feet = (value ~/ 12);
                          final inch = (value % 12).floor();
                          return "$feet ft $inch in";
                        },
                        onScaleValueFormat: (value) {
                          final feet = (value ~/ 12);
                          final inch = (value % 12).floor();
                          return "$feet ft $inch in";
                        },
                      ),
                      Expanded(
                        child: Image.asset(
                          controller.selectedGender.value == 'Male'
                              ? 'assets/images/male.png'
                              : 'assets/images/female.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 20), // 👈 breathing space
      ],
    );
  }
}
