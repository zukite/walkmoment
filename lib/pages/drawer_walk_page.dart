import 'package:flutter/material.dart';

class MyWalkPage extends StatefulWidget {
  const MyWalkPage({super.key});

  @override
  State<MyWalkPage> createState() => _MyWalkPageState();
}

class _MyWalkPageState extends State<MyWalkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Walk Page"),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
