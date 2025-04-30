import 'package:calzz/entry/auth/controller/auth_controller.dart';
import 'package:calzz/entry/auth/views/verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../widget/customtextfield.dart';

class Passchange extends StatelessWidget {
  final Authcontroller authcontroller=Get.find();
  TextEditingController c1=TextEditingController();
   Passchange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.darkOlive),
        ),
        title: Text(
          'Forget Password',
          style: TextStyle(color: AppColors.darkOlive, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            SvgPicture.asset(
              'assets/icons/email.svg', // Provide the path to your SVG asset
              width: 80, // Set width of the icon
              height: 80, // Set height of the icon
              // Optional: Set the color of the SVG icon
            ),
            SizedBox(height: 10,),
            Text('Enter your email address to reset your password',style: TextStyle(
              fontSize: 18,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w400,
              color: AppColors.veryDarkGray,
            ),textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomTextFieldForSetting(
           
              textInputType: TextInputType.text,
              hintText: 'Enter your email',
              controller: c1,
              prefixicon: Icons.lock,

            ),
            SizedBox(height: 20),
            Text(
              'We will sent an email to verify.....',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: AppColors.veryDarkGray,
              ),
            ),
SizedBox(height: 30,),
            CustomActionButton(
              text: 'Continue',
              backgroundColor: AppColors.darkOlive,
              borderColor: AppColors.transparent,
              onPressed: (){
                Get.to(Verification(text: c1.text,),transition: Transition.rightToLeft);
                authcontroller.startTimer();
              },

            )
          ],
        ),
      ),
    );
  }
}
