import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  final String test;
  const MyPost({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [Text(test), Text(test)],
      ),
    );
  }
}
