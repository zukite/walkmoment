import 'package:flutter/material.dart';

import '../components/calendar.dart';
import '../components/diary_card.dart';
import '../components/today_banner.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({super.key});

  @override
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
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
        title: const Text("산책의 흔적"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          MyCalendar(
            onDaySelected: onDaySelected,
            selectedDate: selectedDate,
          ),
          const SizedBox(
            height: 8.0,
          ),
          TodayBanner(
            selectedDate: selectedDate,
            count: 0,
          ),
          const SizedBox(
            height: 8.0,
          ),
          DiaryCard(
            content: "이러이러이ㅓ리어리얼이ㅓㅓㅇ",
          ),
        ],
      ),
    );
  }
}
