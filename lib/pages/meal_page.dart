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
        title: Text("식사의 흔적"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
