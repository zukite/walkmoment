import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:walkmoment/models/note_model.dart';

class MyNoteAdd extends StatefulWidget {
  final Function(Note) onNewNoteCreate;
  const MyNoteAdd({
    super.key,
    required this.onNewNoteCreate,
  });

  @override
  State<MyNoteAdd> createState() => _MyNoteAddState();
}

class _MyNoteAddState extends State<MyNoteAdd> {
  final pickDateController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[800]),
        backgroundColor: Colors.grey[300],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "WALK ADD",
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              style: const TextStyle(
                fontSize: 18,
              ),
              controller: pickDateController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.edit_calendar),
                hintText: "날짜 선택하기",
              ),
              onTap: () async {
                DateTime? pickDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (pickDate != null) {
                  setState(() {
                    pickDateController.text =
                        DateFormat('yyyy.MM.dd').format(pickDate);
                  });
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextFormField(
                style: const TextStyle(fontSize: 18),
                controller: bodyController,
                maxLines: 100,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your Stroy",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[600],
        onPressed: () {
          if (pickDateController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }

          final note =
              Note(date: pickDateController.text, body: bodyController.text);

          widget.onNewNoteCreate(note);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
