import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDate;
  final int count;
  const TodayBanner({
    super.key,
    required this.selectedDate,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    // final textStyle = TextStyle(
    //   fontWeight: FontWeight.w600,
    //   color: Colors.white,
    // );
    return Container(
      color: Colors.grey[400],
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${selectedDate.year}. ${selectedDate.month}. ${selectedDate.day}.",
            ),
          ],
        ),
      ),
    );
  }
}
