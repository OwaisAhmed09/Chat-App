import 'package:chat_app/view/homeView.dart';
import 'package:chat_app/view/signUp.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/passwordField_widget.dart';
import 'package:chat_app/widgets/textfield_widget.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'chatScreen.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obsecureText = false;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LottieBuilder.asset('assets/lottie/signUp.json'),
                Container(
                  child: Text(
                    "Login",
                    style: GoogleFonts.josefinSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        letterSpacing: 1),
                  ),
                ),
                TextFieldWidget(
                    controller: email,
                    hintText: 'Enter Email . . .',
                    iconData: Icon(
                      Icons.email,
                      color: Colors.deepPurple.shade700,
                    )),
                PasswordFieldWidget(
                    controller: password,
                    hintText: 'Create Password . . .',
                    iconprefix: Icon(
                      Icons.lock,
                      color: Colors.deepPurple.shade700,
                    )),
                ButtonWidget(buttonText: 'Sign In', onTap: login),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account",
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          "SignUp",
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  void loginAccount(email, password, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      ErrorBox(context, e);
    }
  }
}
