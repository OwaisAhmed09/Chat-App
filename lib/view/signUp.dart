import 'package:chat_app/view/authFunction.dart';
import 'package:chat_app/view/login.dart';
import 'package:chat_app/widgets/button.dart';
import 'package:chat_app/widgets/passwordField_widget.dart';
import 'package:chat_app/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController usertextfield = TextEditingController();
  bool _obsecureText = true;
  var results;


  

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
                    "Create Account",
                    style: GoogleFonts.josefinSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        letterSpacing: 1),
                  ),
                ),
                TextFieldWidget(
                    controller: usertextfield,
                    hintText: 'Enter Username . . .',
                    iconData: Icon(
                      Icons.person,
                      color: Colors.deepPurple.shade700,
                    )),
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
                ButtonWidget(buttonText: 'Sign Up', onTap:  Servicesfnc.createAccount(email.text, password.text, context),),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "If you have an Account",
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                        child: const Text(
                          "Login",
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

 


}
