import 'package:calzz/entry/onboard/views/page11.dart';
import 'package:calzz/entry/onboard/views/page12.dart';
import 'package:calzz/entry/onboard/views/page13.dart';
import 'package:calzz/entry/onboard/views/page14.dart';
import 'package:calzz/entry/onboard/views/page15.dart';
import 'package:calzz/entry/onboard/views/page16.dart';
import 'package:calzz/entry/onboard/views/page4.dart';
import 'package:calzz/entry/onboard/views/page5.dart';
import 'package:calzz/entry/onboard/views/page6.dart';
import 'package:calzz/entry/onboard/views/page7.dart';
import 'package:calzz/entry/onboard/views/page8.dart';
import 'package:calzz/entry/onboard/views/page9.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../views/page1.dart';
import '../views/page10.dart';
import '../views/page2.dart';
import '../views/page3.dart';

class OnboardController extends GetxController {
  var currentStep = 0.obs;
  var selectedGender = ''.obs;
  var selectedworkout=''.obs;
  var selectedtrackingapp=''.obs;
  var selectedholdingback=''.obs;
  var selecteddiettype=''.obs;
  var isselected=false.obs;
  RxDouble currentSpeed = 1.0.obs; // RxDouble to manage slider state


  var selectedCountry = Rxn<Country>();
  var selectedUnitIndex = 0.obs;
  var selectweight=0.0.obs;
  var desiredweight=0.0.obs;
  var selectheight=0.0.obs;
  var selectgoal="".obs;
  var sliderValue = 0.0.obs;
  void selectUnit(int index) {
    selectedUnitIndex.value = index;
  }



  late List<Widget> pages;

  @override
  void onInit() {
    super.onInit();
    pages = [
      Page1(controller: this),
      Page2(controller: this),
      Page3(controller: this),
      Page4(controller: this),
      Page5(controller: this),
Page6(controller: this),
      Page7(controller: this),
      Page8(controller: this),
      Page9(controller: this),
      Page10(controller: this),
      Page11(controller: this),
      Page12(controller: this),
      Page13(controller: this),
      Page14(controller: this),
      Page15(controller: this),
Page16(controller: this)
    ];
  }




  void updateValue(double value) {
    sliderValue.value = value;
  }

  void next() {
    if (currentStep.value < pages.length - 1) {
      currentStep++;
      if (currentStep.value == 0 && selectedGender.value.isNotEmpty) {
        isselected.value = true;
      } else if (currentStep.value == 1 && selectedworkout.value.isNotEmpty) {
        isselected.value = true;
      }else if (currentStep.value == 2 && selectedCountry.value!=null) {
        isselected.value = true;
      }
      else if(currentStep.value==3 && selectedtrackingapp.value.isNotEmpty ){
        isselected.value = true;
      }
      else if(currentStep.value==4 && selectheight.value>0 ){
        isselected.value = true;
      }
      else if(currentStep.value==5 && selectweight.value>0 ){
        isselected.value = true;
      }
      else if(currentStep.value==7 && selectgoal.value.isNotEmpty ){
        isselected.value = true;
      }
      else if(currentStep.value==8 ){
        isselected.value = true;
      }
      else if(currentStep.value==10 ){
        isselected.value = true;
      }
      else if(currentStep.value==11 ){
        isselected.value = true;
      }
      else if (currentStep.value == 12 && selecteddiettype.value.isNotEmpty) {
        isselected.value = true;
      }
      else if (currentStep.value == 13 && selectedholdingback.value.isNotEmpty) {
        isselected.value = true;
      }
      else if (currentStep.value == 14 ) {
        isselected.value = true;
      }
      else if (currentStep.value == 15 ) {
        isselected.value = true;
      }


      else {
        isselected.value = false;
      }
    }
  }

  void back() {
    if (currentStep.value > 0) {
      currentStep--;
      if (currentStep.value == 0 && selectedGender.value.isNotEmpty) {
        isselected.value = true;
      } else if (currentStep.value == 1 && selectedworkout.value.isNotEmpty) {
        isselected.value = true;
      }else if (currentStep.value == 2 && selectedCountry.value!=null) {
        isselected.value = true;
      }
      else if(currentStep.value==3 && selectedtrackingapp.value.isNotEmpty ){
        isselected.value = true;
      }
      else if(currentStep.value==4 && selectheight.value>0 ){
        isselected.value = true;
      }
      else if(currentStep.value==5 && selectweight.value>0 ){
        isselected.value = true;
      }
      else if(currentStep.value==7 && selectgoal.value.isNotEmpty ){
        isselected.value = true;
      }
      else if(currentStep.value==8 ){
        isselected.value = true;
      }
      else if(currentStep.value==10 ){
        isselected.value = true;
      }
      else if(currentStep.value==11 ){
        isselected.value = true;
      }
      else if (currentStep.value == 12 && selecteddiettype.value.isNotEmpty) {
        isselected.value = true;
      }
      else if (currentStep.value == 13 && selectedholdingback.value.isNotEmpty) {
        isselected.value = true;
      }
      else if (currentStep.value == 14 ) {
        isselected.value = true;
      }

      else {
        isselected.value = false;
      }
    }
  }
}