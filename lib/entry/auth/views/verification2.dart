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
import 'login.dart';

class Verification2 extends StatelessWidget {
  final Authcontroller authcontroller=Get.find();
RxBool toogle1=false.obs;
RxBool toogle2=false.obs;
  TextEditingController c1=TextEditingController();
  Verification2({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, color: AppColors.darkOlive),
          ),
          title: Text(
            'Reset Password',
            style: TextStyle(color: AppColors.darkOlive, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Obx(
                    () => CustomTextFieldForSetting(
                      label: 'New password *',
                  textInputType: TextInputType.text,
                  hintText: 'Password',
                  isPassword:toogle1.value,
                  suffixicon: toogle1.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  prefixicon: Icons.lock,
                  onSuffixTap: () {
                    toogle1.toggle();
                  },
                ),
              ),
              SizedBox(height: 20,),
              Obx(
                    () => CustomTextFieldForSetting(
                      label: 'Confirm New password *',
                  textInputType: TextInputType.text,
                  hintText: 'Password',
                      isPassword:toogle2.value,
                      suffixicon: toogle2.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                  prefixicon: Icons.lock,
                  onSuffixTap: () {
                    toogle2.toggle();
                  },
                ),
              ),



              SizedBox(height: 30,),
              CustomActionButton(
                text: 'Save Password',
                onPressed: (){ Get.to(LoginPage(),transition: Transition.leftToRight);},
                backgroundColor: AppColors.darkOlive,
                borderColor: AppColors.transparent,
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
