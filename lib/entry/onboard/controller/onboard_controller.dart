import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../views/page1.dart';
import '../views/page2.dart';
import '../views/page3.dart';

class OnboardController extends GetxController {
  var currentStep = 0.obs;
  var selectedGender = ''.obs;
  var selectedworkout=''.obs;

  late List<Widget> pages;

  @override
  void onInit() {
    super.onInit();
    pages = [
      Page1(controller: this),
      Page2(controller: this),
      Page3(controller: this),
    ];
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }
  void selectedworkouttype(String workouttype) {
    selectedworkout.value = workouttype;
  }

  void next() {
    if (currentStep.value < pages.length - 1) {
      currentStep++;
    }
  }

  void back() {
    if (currentStep.value > 0) {
      currentStep--;
    }
  }
}