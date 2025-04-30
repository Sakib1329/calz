import 'package:calzz/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../theme/colors.dart';

class HomePage extends StatelessWidget {
  final HomeController controller=Get.find();
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
     appBar: AppBar(
       leadingWidth: 40,
       leading: Padding(
         padding: const EdgeInsets.only(left: 20.0),
         child: Image.asset('assets/images/thunder.png'),
       ),
       title: Text('Cal Z',style: TextStyle(color: AppColors.darkGreen,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Schuyler'),),
       centerTitle: true,
       actions: [
         Padding(
           padding: const EdgeInsets.only(right: 20.0),
           child: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_rounded,color: AppColors.darkGreen,size: 40,)),
         )
       ],
     ),

body: Obx(()=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: Column(
    children: [
      SizedBox(height: 20,),
      TableCalendar(
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          focusedDay: controller.focusedDay.value, // scrolls to this week
          calendarFormat: CalendarFormat.week,
          headerVisible: false,
          daysOfWeekVisible: true,
          onDaySelected: controller.onDaySelected,

          selectedDayPredicate: (day) =>
          isSameDay(day, controller.selectedDay.value),

          calendarStyle: CalendarStyle(

            todayTextStyle: TextStyle(
              color: AppColors.darkGreen,
            ),
            defaultTextStyle: TextStyle(
              color: AppColors.darkGreen,
            ),
          selectedDecoration: BoxDecoration(
          color: AppColors.darkGreen,
          shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
          color: AppColors.pureWhite,
          fontWeight: FontWeight.bold,
          ),
          todayDecoration: BoxDecoration(
          color:AppColors.transparent, // we don’t want today to auto look selected
          shape: BoxShape.circle,
          ),
          ),),
      SizedBox(height: 20,),
      Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // soft shadow
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 4), // shadow position: x, y
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('2300',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                Text('Calories left',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                Text('(intake)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),textAlign: TextAlign.start,),
              ],
            ),
            Image.asset('assets/images/img_3.png',fit: BoxFit.cover,width: 150,height: 150,)
          ],
        ),
      ),
      SizedBox(height: 15,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 125,
            height: 210,
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // soft shadow
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4), // shadow position: x, y
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('75g',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                Text('Carbs left',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),textAlign: TextAlign.start,),
                SizedBox(height: 10,),
                Image.asset('assets/images/img_4.png',fit: BoxFit.cover,width: 100,height: 100,)
              ],
            ),
          ),
          Container(
            width: 125,
            height: 210,
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // soft shadow
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4), // shadow position: x, y
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('50g',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                Text('Carbs left',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),textAlign: TextAlign.start,),
                SizedBox(height: 10,),
                Image.asset('assets/images/img_5.png',fit: BoxFit.cover,width: 100,height: 100,)
              ],
            ),
          ),
          Container(
            width: 125,
            height: 210,
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // soft shadow
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 4), // shadow position: x, y
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('25g',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                Text('Carbs left',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),textAlign: TextAlign.start,),
                SizedBox(height: 10,),
                Image.asset('assets/images/img_6.png',fit: BoxFit.cover,width: 100,height: 100,)
              ],
            ),
          ),
        ],
      )

    ],
  ),
)

   ));
  }
}
