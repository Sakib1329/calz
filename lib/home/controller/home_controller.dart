import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var isOn = false.obs;

  var selectedOption = 0.obs;
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;
  }

  bool isSelectedDay(DateTime day) {
    return isSameDay(day, selectedDay.value);
  }
  void setOption(int? value) {
    if (value != null) {
      selectedOption.value = value;
    }
  }
}

