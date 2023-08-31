import 'package:flutter/material.dart';

import '../components/my_calendar.dart';
import '../components/today_banner.dart';

class MyWalkPage extends StatefulWidget {
  const MyWalkPage({super.key});

  @override
  State<MyWalkPage> createState() => _MyWalkPageState();
}

class _MyWalkPageState extends State<MyWalkPage> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("산책의 흔적"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          MyCalendar(
            onDaySelected: onDaySelected,
            selectedDate: selectedDate,
          ),
          SizedBox(
            height: 8.0,
          ),
          TodayBanner(
            selectedDate: selectedDate,
            count: 0,
          ),
          SizedBox(
            height: 8.0,
          ),
          // ScheduleCard(),
        ],
      ),
    );
  }
}
