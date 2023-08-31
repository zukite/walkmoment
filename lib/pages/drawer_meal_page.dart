import 'package:flutter/material.dart';

class MyMealPage extends StatefulWidget {
  const MyMealPage({super.key});

  @override
  State<MyMealPage> createState() => _MyMealPageState();
}

class _MyMealPageState extends State<MyMealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Meal Page"),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
