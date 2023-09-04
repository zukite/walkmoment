import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String subjectText;
  final String connectName;
  const MyTextButton({
    super.key,
    required this.subjectText,
    required this.connectName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, connectName);
      },
      child: Text(
        subjectText,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


// TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/walk');
//               },
//               child: Text(
//                 "산책의 흔적",
//                 style: TextStyle(
//                   color: Colors.grey[800],
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),