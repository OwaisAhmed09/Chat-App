import 'package:chat_app/view/chatScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Servicesfnc {
  void ErrorBox(context, e) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(e.toString()),
        );
      },
    );
  }

 createAccount(email, password, usertextfield, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // final CollectionReference users =
      //     FirebaseFirestore.instance.collection('users');
      // users.add({
      //   'email': email,
      //   'password': password,
      //   'name': usertextfield,
      //   'status': "Unavalible",
      // });

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LogIn(),
          ));
    } on FirebaseAuthException catch (e) {
      print("User SignIn");
      ErrorBox(context, e);
    }
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

  Logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LogIn(),
        ));
  }

  signOut(context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LogIn(),
            ));
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
