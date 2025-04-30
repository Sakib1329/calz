import 'package:calzz/entry/auth/views/login.dart';
import 'package:calzz/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import 'entry/onboard/controller/onboard_controller.dart';
import 'entry/splash/views.dart';


void main() async{
  Get.put(OnboardController());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    GetMaterialApp(
      theme: ThemeData(
useMaterial3: false,
          scaffoldBackgroundColor: AppColors.lightBlue,
          appBarTheme: AppBarTheme(
            color: AppColors.lightBlue,
            elevation: 0,
            shadowColor: AppColors.lightBlue,
          )
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: LoginPage(),
    ),
  );
}


