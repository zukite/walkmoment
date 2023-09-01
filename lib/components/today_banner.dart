import 'package:flutter/material.dart';

class MyTodayBanner extends StatelessWidget {
  final DateTime selectedDate;

  const MyTodayBanner({
    Key? key,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final textStyle = TextStyle(
    //   fontSize: 16.0,
    //   fontWeight: FontWeight.w600,
    //   color: Colors.grey[700],
    // );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1.3,
          width: 230.0,
          color: Colors.grey[500],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            '${selectedDate.year}. ${selectedDate.month}. ${selectedDate.day}.',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ),
        Container(
          height: 1.3,
          width: 30.0,
          color: Colors.grey[500],
        ),
      ],
    );
  }
}
