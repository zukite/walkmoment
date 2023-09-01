import 'package:flutter/material.dart';

class MyDiaryTextField extends StatelessWidget {
  final String label;

  const MyDiaryTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600),
        ),
        TextFormField(),
      ],
    );
  }
}
