import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:walkmoment/auth/auth.dart';
import 'package:walkmoment/firebase_options.dart';
import 'package:walkmoment/pages/drawer_book_page.dart';
import 'package:walkmoment/pages/drawer_meal_page.dart';
import 'package:walkmoment/pages/drawer_walk_page.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth', // 초기 연결 페이지
      routes: {
        // 각 연결 페이지
        '/auth': (context) => const AuthPage(),
        '/walk': (context) => const WalkPage(),
        '/meal': (context) => const MealPage(),
        '/book': (context) => const BookPage(),
      },
    );
  }
}
