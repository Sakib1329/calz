
import 'package:calzz/home/views/home.dart';
import 'package:calzz/home/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';
import '../controller/home_controller.dart';
import 'analytical.dart';
import 'meal.dart';


class Navigation extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return [
          HomePage(),
          Analytical(),
          Meal(),
          Settings(),
        ][controller.currentIndex.value];
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0,bottom: 20),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(onPressed: (){},child: SvgPicture.asset(

              'assets/icons/scanner.svg',
            width: 40,
            height: 40,
          ),

          backgroundColor: AppColors.darkGreen,

          ),
        ),
      ),
      bottomNavigationBar: Obx(() => Container(
        margin: EdgeInsets.only( bottom: 40,left: 20,right: 20), // Margin at the bottom for the floating effect
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.circular(40
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final isSelected = controller.currentIndex.value == index;
            return GestureDetector(
              onTap: () => controller.currentIndex.value = index,
              child: Container(
                width: 65,
                height: 62,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      [
                        'assets/icons/home.svg',
                        'assets/icons/analytical.svg',
                        'assets/icons/meal.svg',
                        'assets/icons/settings.svg',
                      ][index],
                      colorFilter: ColorFilter.mode(
                        isSelected ? AppColors.pureWhite : AppColors.lightGray2,
                        BlendMode.srcIn,
                      ),
                      width: 33,
                      height: 33,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      [
                        'Home',
                        'Analytics',
                        'Meal',
                        'Settings',
                      ][index],
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? AppColors.pureWhite : AppColors.lightGray2,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),


                  ],
                ),
              ),
            );
          }),
        ),
      )),
    );
  }
}
