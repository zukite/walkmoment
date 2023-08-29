import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswirdTextController = TextEditingController();

  // sign user up
  void signUp() async {
    // show loding circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (!emailTextController.text.contains("@")) {
      // pop loding circle
      Navigator.pop(context);

      // show error to user
      displayMessage("이메일 주소를 정확하게 입력해주세요");
      return;
    } else if (passwordTextController.text.length < 6) {
      // pop loding circle
      Navigator.pop(context);

      // show error to user
      displayMessage("비밀번호는 6자 이상 입력해주세요");
      return;
    } else if (passwordTextController.text !=
        confirmPasswirdTextController.text) {
      // pop loding circle
      Navigator.pop(context);
      // show error to user
      displayMessage("비밀번호가 일치하지않습니다");
      return;
    }

    // try creating the user
    try {
      // create the user
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      // after creating the user, create a new document in cloud firestore called Users
      FirebaseFirestore.instance
          .collection("User")
          .doc(userCredential.user!.email)
          .set({
        'username': emailTextController.text.split("@")[0], // initial username
        'bio': 'Empty bio..' // initially empty bio
        // add any additional fields as needed
      });

      // pop loding circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loding circle
      Navigator.pop(context);
      //show error to user
      displayMessage(e.code);
    }
  }

  // display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  const Icon(
                    Icons.edit_note,
                    size: 100,
                  ),

                  const SizedBox(height: 50),

                  // Welcome back message
                  Text(
                    "Let's create an account for you",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // email textfield
                  MyTextField(
                    controller: emailTextController,
                    hintText: "Email",
                    obscureText: false, // 입력했을 때 입력한 값이 보이는지 아닌지
                  ),
                  const SizedBox(height: 10),

                  //password textfield
                  MyTextField(
                    controller: passwordTextController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),

                  // confirm password textfield
                  MyTextField(
                    controller: confirmPasswirdTextController,
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  //sign in button
                  MyButon(
                    onTap: signUp,
                    text: "Sing Up",
                  ),
                  const SizedBox(height: 25),
                  // goto register page
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
