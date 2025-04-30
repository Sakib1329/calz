import 'package:calzz/entry/onboard/widget/time_entrypopupwidget.dart';
import 'package:calzz/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svgAsset;

  const CustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgAsset, // Path to the SVG asset
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),

      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),// Space between icon and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.borderGray,
                ),
              ),
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) => TimeEntryPopupWidget(
                      mealType: 'Breakfast',   // You can pass any meal
                      onSave: (time) {
                        print('Saved Time: $time');
                        // Do something with the saved time
                      },
                    ),
                  );

                },
                child: SvgPicture.asset(
                  svgAsset, // Provide the path to your SVG asset
                  width: 30, // Set width of the icon
                  height: 30, // Set height of the icon
                  color: AppColors.borderGray, // Optional: Set the color of the SVG icon
                ),
              ),

            ],
          ),
          SizedBox(height: 3,),
         Divider(height: 1,),
         SizedBox(height: 3,)

        ],
      ),
    );
  }
}
