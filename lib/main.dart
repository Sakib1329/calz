import 'package:calzz/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'entry/onboard/controller/onboard_controller.dart';
import 'entry/splash/views.dart';


void main() {
  Get.put(OnboardController());
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.lightBlue,
          appBarTheme: AppBarTheme(
            color: AppColors.lightBlue,
          )
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: Splashview(),
    ),
  );
}


