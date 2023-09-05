import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:walkmoment/auth/auth.dart';
import 'package:walkmoment/firebase_options.dart';
import 'package:walkmoment/pages/drawer_book_page.dart';
import 'package:walkmoment/pages/drawer_meal_page.dart';
import 'package:walkmoment/pages/drawer_walk_page.dart';
import 'package:walkmoment/pages/walk_add.dart';
// import 'package:walkmoment/pages/home_book_page.dart';
// import 'package:walkmoment/pages/home_meal_page.dart';
// import 'package:walkmoment/pages/home_walk_page.dart';

void main() async {
  // 데이터베이스 초기화
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth', // 초기 연결 페이지
      routes: {
        // 각 연결 페이지
        '/auth': (context) => const AuthPage(), // auth.dart
        '/walk': (context) => const WalkPage(), // drawer_walk_page.dart
        '/meal': (context) => const MealPage(), // drawer_meal_page.dart
        '/book': (context) => const BookPage(), // drawer_book_page.dart
        '/add': (context) =>
            AddPage(selectedDate: selectedDate), // walk_add.dart
      },
    );
  }
}
