import 'package:calzz/entry/auth/controller/auth_controller.dart';
import 'package:calzz/entry/auth/views/login.dart';
import 'package:calzz/entry/auth/widget/customtextfield.dart';
import 'package:calzz/theme/colors.dart';
import 'package:calzz/theme/texfiled.dart';
import 'package:calzz/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Signup extends StatelessWidget {
  final Authcontroller authcontroller=Get.put(Authcontroller());
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body:
         Stack(
          children: [
            // First image (fills screen height)
           Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/img_1.png',
                width: double.infinity,
                // adjust height as needed
              ),
            ),

            // Second image at bottom edge of first image
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              top: isKeyboardOpen ? 50 : 325,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/img_2.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: AppColors.lightBlue,
                  ),
                  Positioned(
                    top: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: 500,
                        width: 400,

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  color: AppColors.darkOlive,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Create your new account',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,

                                  color: AppColors.veryDarkGray,
                                ),
                              ),
                              SizedBox(height: 20),
                              CustomTextFieldForSetting(
                                textInputType: TextInputType.text,
                                hintText: 'user@gmail.com',

                                prefixicon: Icons.email,
                              ),
                              Obx(()=>CustomTextFieldForSetting(
                                textInputType: TextInputType.number,
                                hintText: 'Password',
                                isPassword: authcontroller.ispasswordvisible.value,
                                suffixicon: authcontroller.ispasswordvisible.value==true ? Icons.visibility : Icons.visibility_off,
                                prefixicon: Icons.lock,
                                onSuffixTap: (){authcontroller.ispasswordvisible.toggle();},
                              ),),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        authcontroller.isremembered.toggle();
                                      },
                                      child: Obx(()=>Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: authcontroller.isremembered==true ? AppColors.darkOlive : AppColors.transparent,
                                            border: Border.all(
                                                color: authcontroller.isremembered==true ? AppColors.transparent : AppColors.mediumGray
                                            )
                                        ),
                                        child:

                                        Center(child:
                                        Icon(Icons.check ,color:authcontroller.isremembered==true?AppColors.pureWhite :AppColors.transparent,size: 18,)),
                                      ),)
                                  ),
                                  SizedBox(width: 10,),
                                  Text('Remember Me',style: TextStyle(color: AppColors.veryDarkGray,fontSize: 14),),

                                ],
                              ),
                              SizedBox(height: 30,),
                              CustomActionButton(
                                text: 'Create',
                                onPressed: (){},
                                backgroundColor: AppColors.darkOlive,
                                borderColor: AppColors.transparent,
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(fontSize: 15, color: AppColors.veryDarkGray),
                                    textAlign: TextAlign.center,
                                  ),
                                  InkWell(
                                    onTap: (){
                                     Get.back();
                                    },
                                    child: Text(
                                      ' Login',
                                      style: TextStyle(fontSize: 18, color: AppColors.darkOlive,fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
