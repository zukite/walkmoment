import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  final DateTime selectedDate;
  const AddPage({
    super.key,
    required this.selectedDate,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // void addNote()async{

  //   try{
  //     FirebaseFirestore.instance
  //         .collection("User")
  //         .doc(userCredential.user!.email)
  //         .set({
  //       'username': emailTextController.text.split("@")[0], // initial username
  //       'bio': 'Empty bio..' // initially empty bio
  //       // add any additional fields as needed
  //     });
  //   }on FirebaseAuthException catch (e) {
  //     // pop loding circle
  //     Navigator.pop(context);
  //     //show error to user
  //     displayMessage(e.code);
  //   }
  // }
  // void displayMessage(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(message),
  //     ),
  //   );
  final _formKey = GlobalKey<FormBuilderState>;

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
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.grey[800],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () async {
                //save event
              },
              icon: const Icon(Icons.save_alt)),
        ],
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          FormBuilder(
              child: Column(
            children: [
              // 날짜 선택
              FormBuilderDateTimePicker(
                name: "Date",
                initialValue: widget.selectedDate,
                fieldHintText: "Add Date",
                inputType: InputType.date,
                format: DateFormat('yyyy. MM. dd. EEEE'),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.edit_calendar),
                  hintText: "날짜 선택하기",
                ),
              ),
              const Divider(),
              // 제목 작성
              FormBuilderTextField(
                name: "title",
                decoration: const InputDecoration(
                  hintText: "add title",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 48),
                ),
              ),
              const Divider(),
              // 내용 작성
              FormBuilderTextField(
                name: "description",
                maxLines: 30,
                minLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add Details",
                  prefixIcon: Icon(Icons.short_text),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
