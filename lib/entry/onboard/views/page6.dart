import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../theme/colors.dart';
import '../controller/onboard_controller.dart';

class Page6 extends StatelessWidget {
  final OnboardController controller;

  Page6({required this.controller});

  Widget _buildUnitButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {

          if (controller.selectedUnitIndex.value != index) {
            if (index == 1) {

              controller.selectweight.value = controller.selectweight.value * 2.20462;
            } else {

              controller.selectweight.value = controller.selectweight.value / 2.20462;
            }
            controller.selectedUnitIndex.value = index;
          }
        },
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
                fontSize: 18,
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Please enter your weight',
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
              _buildUnitButton('Kilograms', 0),
              _buildUnitButton('Pounds', 1),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Obx(() => SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: controller.selectedUnitIndex.value == 1 ? 300 : 180,
              startAngle: 180,
              endAngle: 0,
              interval: controller.selectedUnitIndex.value == 1 ? 30 : 20,
              showLastLabel: true,
              showLabels: true,
              showTicks: false,
              axisLineStyle: AxisLineStyle(
                thickness: 0,
              ),
              axisLabelStyle: GaugeTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.darkOlive,
              ),
              pointers: <GaugePointer>[
                NeedlePointer(value: controller.selectweight.value),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    controller.selectedUnitIndex.value == 0
                        ? '${controller.selectweight.value.toInt()}kg'
                        : '${controller.selectweight.value.toInt()}lbs',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  angle: 90,
                  positionFactor: 0.4,
                ),
              ],
            ),
          ],
        )),

        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.neutralUltraLight,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                blurRadius: 10, // Softness of the shadow
                spreadRadius: 2, // How wide the shadow spreads
                offset: Offset(0, 4), // X and Y offset
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                child: Text(
                  'Weight :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                top: 11,
                left: 11,
              ),
              Positioned(
                left: 95,
                child: Container(
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                    color: AppColors.veryLightGray,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {

                      if (value.isNotEmpty) {
                        controller.isselected.value=true;
                        double parsed = double.tryParse(value) ?? 0;

                        if (controller.selectedUnitIndex.value == 0) {

                          controller.selectweight.value = parsed;
                        } else {

                          controller.selectweight.value = parsed / 2.20462;
                        }
                      } else {
                        controller.isselected.value=false;
                        controller.selectweight.value = 0;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter here",
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintStyle: TextStyle(
                        color: AppColors.neutralMedium,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      fillColor: AppColors.veryLightGray,
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.transparent),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.transparent),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
