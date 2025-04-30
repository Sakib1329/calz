import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

import '../controller/onboard_controller.dart';
import '../widget/customcontainer.dart';
import '../widget/popup.dart';

class Page11 extends StatelessWidget {
  final OnboardController controller;
  final TextEditingController myController = TextEditingController();

  Page11({required this.controller});

  @override
  Widget build(BuildContext context) {
    final image=controller.selectgoal.value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            'Please Enter your estimated Meal timings',
            style: TextStyle(
              color: AppColors.darkOlive,
              fontSize: 28,
              fontFamily: 'Schuyler',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 400,
            height: 390,
            child: ListView.builder(
              itemCount: 4,  // Total number of items// Divider between items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CustomContainer(
                    title: 'Breakfast',
                    subtitle: '00:00am',
                    svgAsset: 'assets/icons/time.svg', // Path to your SVG file
                  ),
                );
              },
              scrollDirection: Axis.vertical,
            ),
          ),
      Row(
        children: [
          FloatingActionButton(
            elevation: 4,
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) => CustomPopup(
                  title: 'Enter meal name',
                  buttonText: 'Done',
                  controller: myController,
                  onButtonPressed: () {
                    print(myController.text);
                   // Close the popup
                  },
                ),
              );


            },
              shape: CircleBorder(  // Ensures a perfect circle, but you can adjust for more roundness
                side: BorderSide(color: AppColors.transparent),  // Optional: Add border if desired
              ),
            backgroundColor: AppColors.darkLightGray,  // Customize the background color
            child:  Icon(Icons.add,size: 40,color: AppColors.darkOlive,)),
          SizedBox(width: 12,),
          Text('Add Meal',style: TextStyle(color: AppColors.darkOlive,fontSize: 22,fontWeight: FontWeight.bold),)
        ],
      )

        ],
      ),
    );
  }
}