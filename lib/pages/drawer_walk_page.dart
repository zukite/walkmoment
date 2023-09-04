// import 'package:flutter/material.dart';

// class MyWalkPage extends StatefulWidget {
//   const MyWalkPage({super.key});

//   @override
//   State<MyWalkPage> createState() => _MyWalkPageState();
// }

// class _MyWalkPageState extends State<MyWalkPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: const Text("Walk Page"),
//         backgroundColor: Colors.grey[900],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:walkmoment/components/note_card.dart';
// import 'package:walkmoment/components/walk_card.dart';
import 'package:walkmoment/screens/create_note.dart';

import '../models/note_model.dart';
// import '../components/calendar.dart';
// import '../components/today_banner.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({super.key});

  @override
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  void onNewNoteCreate(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNewNoteDelete(int index) {
    notes.removeAt(index);
    setState(() {});
  }

  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[800]),
        title: Text(
          "W A L K",
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        elevation: 0,
        // actions: [
        //   IconButton(
        //     onPressed: ,
        //     icon: Icon(
        //       Icons.add,
        //       color: Colors.grey[800],
        //     ),
        //   ),
        // ],
      ),
      // body: SafeArea(
      // child: Column(
      //   children: [
      //     // MyCalendar(
      //     //   onDaySelected: onDaySelected,
      //     //   selectedDate: selectedDate,
      //     // ),
      //     const SizedBox(
      //       height: 8.0,
      //     ),
      //     MyTodayBanner(
      //       selectedDate: selectedDate,
      //     ),
      //     const SizedBox(
      //       height: 8.0,
      //     ),
      //     const WalkCard(
      //       content: "이러이러이ㅓ리어리얼이ㅓㅓㅇ",
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(note: notes[index], index: index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[600],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => MyNoteAdd(
                    onNewNoteCreate: onNewNoteCreate,
                  )),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
    // );
  }
}
