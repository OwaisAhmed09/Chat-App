import 'package:chat_app/view/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController usertextfield = TextEditingController();
  TextEditingController Unavalible = TextEditingController();
  bool _obsecureText = false;
  create() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.add({
        'email': email.text,
        'password': password.text,
        'name': usertextfield.text,
        'status': "Unavalible",
      });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(),
          ));
      if (users != null) {
        print("Account create successfully");
        return users;
      } else {
        print("Account Failed");
        return users;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: const Text("Crate Account"),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: usertextfield,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                )),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 20.0, top: 6),
                  child: Text("Abc"),
                ),
                prefixIcon: Icon(Icons.person),
                hintText: "Enter UserName",
              ),
            ),
            const SizedBox(height: 20),
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
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  create();
                  print("account create");
                },
                child: const Text("SignUP")),
            SizedBox(height: 10),
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
    );
  }
}
