// import 'package:flutter/material.dart';
// import 'package:walkmoment/screens/main_screen.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const LoginSignupScreen(),
//     );
//   }
// }

// 다시 시작

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:walkmoment/auth/auth.dart';
import 'package:walkmoment/firebase_options.dart';
import 'package:walkmoment/pages/book_page.dart';
import 'package:walkmoment/pages/meal_page.dart';
import 'package:walkmoment/pages/walk_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthPage(),
        '/walk': (context) => const MyWalkPage(),
        '/meal': (context) => const MyMealPage(),
        '/book': (context) => const MyBookPage(),
      },
    );
  }
}
