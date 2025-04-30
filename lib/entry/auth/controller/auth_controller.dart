import 'dart:async';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  var isremembered = false.obs;
  var ispasswordvisible = true.obs;

  RxInt secondsRemaining = 60.obs;
  RxString formattedTime = '01:00'.obs;

  Timer? _timer;

  void startTimer() {
    stopTimer(); // Cancel existing timer if running
    secondsRemaining.value = 60;
    _updateFormattedTime();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
        _updateFormattedTime();
      } else {
        timer.cancel();
      }
    });
  }

  void _updateFormattedTime() {
    final int minutes = secondsRemaining.value ~/ 60;
    final int seconds = secondsRemaining.value % 60;
    formattedTime.value =
    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}
