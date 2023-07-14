import 'package:chat_app/view/homeView.dart';
import 'package:chat_app/view/signUp.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obsecureText = false;
  login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ));
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              e.message.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "Crate Account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 20.0, top: 6),
                      child: Text("@abc.com"),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Em@il",
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    )),
                    hintText: "Enter Password",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        child: Icon(_obsecureText
                            ? Icons.visibility
                            : Icons.visibility_off_outlined),
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: const Text("LogIn")),
                SizedBox(height: 10),
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
}
