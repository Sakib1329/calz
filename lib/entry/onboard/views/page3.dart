import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboard_controller.dart';

class Page3 extends StatelessWidget {
  final OnboardController controller;
  Page3({required this.controller});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        builder: (controller) => Text('hello')// Your Page3 UI, using `controller`
    );
  }
}