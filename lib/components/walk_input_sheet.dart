import 'package:flutter/material.dart';

class MyDiaryInputSheet extends StatefulWidget {
  const MyDiaryInputSheet({super.key});

  @override
  State<MyDiaryInputSheet> createState() => _MyDiaryInputSheetState();
}

class _MyDiaryInputSheetState extends State<MyDiaryInputSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // height: MediaQuery.of(context).size.height / 2,
        color: Colors.grey[300],
      ),
    );
  }
}
