import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  const MyCalendar({
    super.key,
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay: DateTime.now(),
      firstDay: DateTime(1950, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      // 달력 최상단 스타일
      headerStyle: const HeaderStyle(
        headerPadding: EdgeInsets.only(bottom: 20),
        // 제목 중앙에 위치
        titleCentered: true,
        // 달력 크기 선택 옵션 없애기
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          // 제목 글꼴
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),

      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        todayDecoration: BoxDecoration(
          color: Colors.grey[500],
          shape: BoxShape.circle,
        ),
        // weekNumberTextStyle: TextStyle(),
        selectedDecoration: BoxDecoration(
          color: Colors.grey[700],
          shape: BoxShape.circle,
        ),
        todayTextStyle: const TextStyle(
          color: Colors.black,
        ),
        selectedTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
