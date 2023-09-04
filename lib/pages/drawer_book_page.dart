// import 'package:flutter/material.dart';

// class MyBookPage extends StatefulWidget {
//   const MyBookPage({super.key});

//   @override
//   State<MyBookPage> createState() => _MyBookPageState();
// }

// class _MyBookPageState extends State<MyBookPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: const Text("Book Page"),
//         backgroundColor: Colors.grey[900],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("B O O K"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
