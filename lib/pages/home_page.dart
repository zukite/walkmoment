import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walkmoment/components/calendar.dart';
// import 'package:walkmoment/components/navigation.dart';
import 'package:walkmoment/components/today_banner.dart';
// import 'package:walkmoment/components/text_button.dart';
import 'package:walkmoment/pages/drawer_profile_page.dart';
import '../components/drawer.dart';
import 'drawer_book_page.dart';
import 'drawer_meal_page.dart';
import 'drawer_walk_page.dart';

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

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

// navigate to profile page
  void goToProfilePage() {
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyProfilePage(),
      ),
    );
  }

//   void goToWalkPage() {
// // pop menu drawer
//     Navigator.pop(context);

//     // go to profile page
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const MyWalkPage(),
//       ),
//     );
//   }

  void goToMealPage() {
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyMealPage(),
      ),
    );
  }

  void goToBookPage() {
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyBookPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        // title: const Text("Time and Trace"),
        // centerTitle: true,
        backgroundColor: Colors.grey[300],
        iconTheme: IconThemeData(color: Colors.grey[600]),
        elevation: 0,
      ),

      drawer: MyDrawer(
        // onWalkTap: goToWalkPage,
        onWalkTap: '/walk',
        onMealTap: goToMealPage,
        onBookTap: goToBookPage,
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
      ),
      // body: const Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       MyTextButton(
      //         subjectText: "산책의 흔적",
      //         connectName: '/walk',
      //       ),
      //       MyTextButton(
      //         subjectText: "식사의 흔적",
      //         connectName: '/meal',
      //       ),
      //       MyTextButton(
      //         subjectText: "독서의 흔적",
      //         connectName: '/book',
      //       ),

      //     ],
      //   ),

      // ),
      // body: MyNavigation(),
      // body: MyTodayBanner(selectedDate: selectedDate),
      body: MyCalendar(
        onDaySelected: onDaySelected,
        selectedDate: selectedDate,
      ),
    );
  }
}
