import 'package:calzz/entry/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';

class DateScrollerWidget extends StatefulWidget {
  final Function(String) onDateSelected;
  final OnboardController controller = Get.find();

  DateScrollerWidget({required this.onDateSelected});

  @override
  _DateScrollerWidgetState createState() => _DateScrollerWidgetState();
}

class _DateScrollerWidgetState extends State<DateScrollerWidget> {
  final FixedExtentScrollController _monthController = FixedExtentScrollController(initialItem: DateTime.now().month - 1);
  final FixedExtentScrollController _dayController = FixedExtentScrollController(initialItem: DateTime.now().day - 1);
  final FixedExtentScrollController _yearController = FixedExtentScrollController(initialItem: yeargap);

  static int yeargap = DateTime.now().year - 1980;

  static List<String> _months = _generateMonthsList(DateTime.now().year);
  static List<String> _days = _generateDaysList(DateTime.now().year);
  static List<String> _years = List.generate(yeargap + 1, (index) => (1980 + index).toString());

  String _selectedMonth = DateTime.now().month <= 9
      ? _months[DateTime.now().month - 1]
      : _months[DateTime.now().month - 1];

  static String _selectedDay = DateTime.now().day.toString().padLeft(2, '0');
  static String _selectedYear = DateTime.now().year.toString();

  // Generate months list based on selected year
  static List<String> _generateMonthsList(int year) {
    if (year == 2025) {
      return _fullMonthsList().sublist(0, DateTime.now().month); // Only up to current month
    } else {
      return _fullMonthsList(); // All 12 months
    }
  }

  // Full months list
  static List<String> _fullMonthsList() {
    return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  }

  // Generate days list based on selected year
  static List<String> _generateDaysList(int year) {
    if (year == 2025) {
      int maxDay = (DateTime.now().month == 4) ? 27 : DateTime.now().day;
      return List.generate(maxDay, (index) => (index + 1).toString().padLeft(2, '0'));
    } else {
      return List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
    }
  }

  @override
  void dispose() {
    _monthController.dispose();
    _dayController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Date scrollers with faded items above and below
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Month scroller
            _buildScrollerSection(
              _months,
              _monthController,
                  (value) {
                setState(() {
                  _selectedMonth = _months[value];
                });
                widget.onDateSelected(_buildSelectedDate());
                widget.controller.isselected.value = true;
              },
            ),

            // Day scroller
            _buildScrollerSection(
              _days,
              _dayController,
                  (value) {
                setState(() {
                  _selectedDay = _days[value];
                });
                widget.onDateSelected(_buildSelectedDate());
                widget.controller.isselected.value = true;
              },
            ),

            // Year scroller
            _buildScrollerSection(
              _years,
              _yearController,
                  (value) {
                setState(() {
                  _selectedYear = _years[value];
                  _months = _generateMonthsList(int.parse(_selectedYear)); // Update months
                  _days = _generateDaysList(int.parse(_selectedYear));     // Update days
                });
                widget.onDateSelected(_buildSelectedDate());
                widget.controller.isselected.value = true;
              },
            ),
          ],
        ),

        // Display selected date in fixed containers
        Positioned(
          top: 100,
          left: 0,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSelectedContainer(_selectedMonth),
              const SizedBox(width: 17),
              _buildSelectedContainer2(_selectedDay),
              const SizedBox(width: 25),
              _buildSelectedContainer3(_selectedYear),
            ],
          ),
        ),
      ],
    );
  }

  String _buildSelectedDate() {
    return "${_selectedMonth} ${_selectedDay}, ${_selectedYear}";
  }

  Widget _buildScrollerSection(List<String> items, FixedExtentScrollController controller, Function(int) onChanged) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(

          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.0),
            Colors.white.withOpacity(1.0),
            Colors.white.withOpacity(1.0),
            Colors.white.withOpacity(0.0),
          ],
          stops: const [0.0, 0.3, 0.7, 1.0],

        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: SizedBox(
        width: 128,
        height: 250,
        child: GestureDetector(
          child: ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 50,
            perspective: 0.005,
            diameterRatio: 1.5,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: onChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: items.length,

              builder: (context, index) {
                return Center(
                  child: Text(
                    items[index],
                    style: const TextStyle(fontSize: 18, color: AppColors.neutralGray),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedContainer(String text) {
    return Container(
      width: 141,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.surfaceDark),
      ),
    );
  }

  Widget _buildSelectedContainer2(String text) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.surfaceDark),
      ),
    );
  }

  Widget _buildSelectedContainer3(String text) {
    return Container(
      width: 110,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.surfaceDark),
      ),
    );
  }
}
