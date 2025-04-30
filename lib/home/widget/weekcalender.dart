import 'package:calzz/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({Key? key}) : super(key: key);

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late DateTime _currentDate;
  late List<DateTime> _weekDays;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _calculateWeekDays();
    // Find the index of today in the week days
    _selectedIndex = _weekDays.indexWhere((day) =>
    day.day == _currentDate.day &&
        day.month == _currentDate.month &&
        day.year == _currentDate.year
    );
  }

  void _calculateWeekDays() {
    // Find the first day of the current week (Sunday)
    DateTime startOfWeek = _currentDate.subtract(
      Duration(days: _currentDate.weekday % 7),
    );

    // Create a list of 7 days starting from Sunday
    _weekDays = List.generate(
      7,
          (index) => startOfWeek.add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) {
        final day = _weekDays[index];
        final isSelected = index == _selectedIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: DayItem(
            dayName: _getDayName(day.weekday),
            dayNumber: day.day.toString(),
            isSelected: isSelected,
          ),
        );
      }),
    );
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }
}

class DayItem extends StatelessWidget {
  final String dayName;
  final String dayNumber;
  final bool isSelected;

  const DayItem({
    Key? key,
    required this.dayName,
    required this.dayNumber,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dayName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.darkOlive: AppColors.lightGray2
            ),
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 18,
            backgroundColor: isSelected ? AppColors.darkGreen : Colors.transparent,
            child: Text(
              dayNumber,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}