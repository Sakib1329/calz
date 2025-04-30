import 'package:calzz/entry/auth/controller/auth_controller.dart';
import 'package:calzz/entry/auth/views/login.dart';
import 'package:calzz/entry/auth/views/verification2.dart';
import 'package:calzz/entry/onboard/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../theme/colors.dart';
import '../../../widget/custom_button.dart';
import '../widget/customtextfield.dart';

class Verification extends StatelessWidget {
  final String text;
  final Authcontroller authcontroller = Get.find();
RxBool isselected=false.obs;
  Verification({super.key, required this.text});

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
          'Verification',
          style: TextStyle(color: AppColors.darkOlive, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text(
                'We have sent you an activation code.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                'An email has been sent to your $text containing a code to activate your account',
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.veryDarkGray,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Text(
                'Enter verification code',
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: AppColors.darkOlive,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              PinCodeTextField(
                appContext: context,
                length: 4,


                textStyle: TextStyle(fontSize: 30,),

                animationType: AnimationType.fade,

                cursorColor: AppColors.darkOlive,
                pinTheme: PinTheme(

                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 70,
                  fieldWidth: 70,
                  activeColor: AppColors.darkOlive,
                  selectedColor: AppColors.mediumGray
                  ,
                  inactiveColor: AppColors.mediumGray,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: false,
                keyboardType: TextInputType.number,
                onChanged: (value) {
isselected.value=true;
                },
              ),
              SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'if you didn’t receive a code!   ',
                  style: TextStyle(
                    fontSize: 18,

                    fontWeight: FontWeight.w500,
                    color: AppColors.veryDarkGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                Obx(
                      () => InkWell(
                    onTap: () {
                      authcontroller.startTimer();
                    },
                    child: Text(
                      'Click here',
                      style: TextStyle(
                        color:
                        authcontroller.secondsRemaining == 0
                            ? AppColors.darkOlive
                            : AppColors.veryDarkGray,
                        fontWeight:
                        authcontroller.secondsRemaining == 0
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontSize: 18,

                      ),
                    ),
                  ),
                ),
              ],
            ),
              SizedBox(height: 5,),
             Obx(()=> Text(
               'Code will expire soon.  ${authcontroller.formattedTime.value}',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,
             ),),
              SizedBox(height: 50),
        
              Obx(()=>CustomActionButton(
                text: 'Continue',
                backgroundColor: isselected.value==true
                    ? AppColors.darkGreen
                    : AppColors.neutralGray,
                borderColor: AppColors.transparent,
                textColor: isselected.value==true
                    ? AppColors.lightGray
                    : AppColors.pureWhite,
                onPressed: () {
Get.to(Verification2(),transition: Transition.rightToLeft);

                },
              ),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 18, color: AppColors.veryDarkGray),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(LoginPage(),transition: Transition.leftToRight);
                    },
                    child: Text(
                      ' Login',
                      style: TextStyle(fontSize: 19, color: AppColors.darkOlive,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
