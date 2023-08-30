import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:walkmoment/components/my_calendar.dart';
import 'package:walkmoment/components/today_banner.dart';
import 'package:walkmoment/pages/profile_page.dart';

import '../components/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  // sign user out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

// navigate to profile page
  void goToProfilePage() {
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

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
        title: const Text("순간의 기록"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
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
          ScheduleCard(),
        ],
      ),
    );
  }
}
