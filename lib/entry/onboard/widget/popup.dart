import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String buttonText;
  final TextEditingController controller;
  final VoidCallback onButtonPressed;

  const CustomPopup({
    super.key,
    required this.title,
    required this.buttonText,
    required this.controller,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    RxBool istyping=false.obs;
    return AlertDialog(
      backgroundColor: AppColors.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        title,

        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      content: Obx(()=>Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value){


              if(value.isEmpty){
                istyping.value=false;
              }
              else{
                istyping.value=true;
              }
            },
            controller: controller,
            cursorColor: AppColors.darkOlive,
            decoration: const InputDecoration(

                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.borderGray,
                    )
                ),
                focusedBorder:  UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.borderGray,
                    )
                ),
                hintText: 'Enter text here',
                hintStyle: TextStyle(
                  color: AppColors.borderGray,
                )
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: istyping.value==false ?AppColors.lightGray : AppColors.darkOlive,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
            onPressed: onButtonPressed,
            child: Text(buttonText,style: TextStyle(fontSize: 16,color: istyping.value==false ?AppColors.darkOlive : AppColors.lightGray),),
          ),
        ],
      ),)
    );
  }
}
