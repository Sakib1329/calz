import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../theme/colors.dart';
import '../controller/onboard_controller.dart';

class Page10 extends StatelessWidget {
  final OnboardController controller;

  Page10({required this.controller});

  Widget _buildUnitButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {

          if (controller.selectedUnitIndex.value != index) {
            if (index == 1) {

              controller.desiredweight.value = controller.desiredweight.value * 2.20462;
            } else {

              controller.desiredweight.value = controller.desiredweight.value / 2.20462;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            ' Please Enter your Desired weight',
            style: TextStyle(
              color: AppColors.darkOlive,
              fontSize: 30,
              fontFamily: 'Schuyler',
            ),
            textAlign: TextAlign.center,
          ),


          const SizedBox(height: 30),

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

          const SizedBox(height: 50),

         Obx(()=> Padding(
           padding: const EdgeInsets.only(left: 12.0),
           child: SfLinearGauge(
             orientation: LinearGaugeOrientation.horizontal,
             minimum: 0.0,
             maximum: 200.0,
             interval: 25,
             showTicks: true,
             showLabels: true,
             animateAxis: true,
             axisTrackStyle: const LinearAxisTrackStyle(
               thickness: 20,
               color: Colors.grey,
               edgeStyle: LinearEdgeStyle.bothFlat,
             ),
             markerPointers: [
               LinearShapePointer(
                 value: controller.desiredweight.value,
                 color: AppColors.darkOlive,
                 shapeType: LinearShapePointerType.invertedTriangle,
                 elevation: 3,
               ),
             ],
             barPointers:  [
               LinearBarPointer(
                 value: controller.desiredweight.value,
                 thickness: 20,
                 color:  AppColors.darkOlive,
               ),
             ],
             axisLabelStyle: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 16
             ),

           ),
         ),),
          const SizedBox(height:20),
          Obx(()=> Text(
            controller.selectedUnitIndex.value == 0
                ? '${controller.desiredweight.value.toInt()}kg'
                : '${controller.desiredweight.value.toInt()}lbs',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),),
          const SizedBox(height:60),

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

                            controller.desiredweight.value = parsed;
                          } else {

                            controller.desiredweight.value = parsed / 2.20462;
                          }
                        } else {
                          controller.isselected.value=false;
                          controller.desiredweight.value = 0;
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
      ),
    );
  }
}
