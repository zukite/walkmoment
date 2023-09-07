import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:walkmoment/components/calendar.dart';
import 'package:walkmoment/components/post.dart';
// import 'package:walkmoment/components/navigation.dart';
// import 'package:walkmoment/components/today_banner.dart';
// import 'package:walkmoment/components/text_button.dart';
import 'package:walkmoment/pages/drawer_profile_page.dart';
// import 'package:walkmoment/pages/walk_add.dart';
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

  // 현재 사용자
  final currentUser = FirebaseAuth.instance.currentUser!;

  // 로그아웃 함수
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

  void goToWalkPage() {
// pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WalkPage(),
      ),
    );
  }

  void goToMealPage() {
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MealPage(),
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
        builder: (context) => const BookPage(),
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
        onWalkTap: goToWalkPage,
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
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       MyCalendar(
      //         //calendar.dart
      //         onDaySelected: onDaySelected,
      //         selectedDate: selectedDate,
      //       ),
      //       // const SizedBox(
      //       //   height: 8.0,
      //       // ),
      //       // const MyTextButton(
      //       //   subjectText: "산책 기록",
      //       //   connectName: '/walk',
      //       // ),
      //       // const MyTextButton(
      //       //   subjectText: "식사 기록",
      //       //   connectName: '/meal',
      //       // ),
      //       // const MyTextButton(
      //       //   subjectText: "독서 기록",
      //       //   connectName: '/book',
      //       // ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.grey[600],
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //           builder: (cotext) => AddPage(
      //                 selectedDate: selectedDate,
      //               )
      //           // selectedDate: selectedDate,

      //           ), // walk_add.dart
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // body: Column(
      //   children: [
      //     Expanded(
      //         child: StreamBuilder(
      //       stream: FirebaseFirestore.instance
      //           .collection("User Posts")
      //           .orderBy(
      //             "Timestamp",
      //             descending: false,
      //           )
      //           .snapshots(),
      //           builder: (context, snapshot) {
      //             if(snapshot.hasData){
      //               return ListView.builder(itemBuilder: (context, index) {
      //                 final post=snapshot.data!.docs[index];
      //                 return
      //             },);
      //             }
      //           },
      //     ),),
      //     // 로그인 한 사람 확인
      //     Text("현재 로그인 한 사람 :  " + currentUser.email!),
      //   ],
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(8),
              ),
              height: 55.0,
              child: Center(
                child: Text(
                  '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
