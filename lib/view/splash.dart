import 'dart:async';

import 'package:chat_app/view/chatScreen.dart';
import 'package:chat_app/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplasgScreen extends StatefulWidget {
  const SplasgScreen({super.key});

  @override
  State<SplasgScreen> createState() => _SplasgScreenState();
}

class _SplasgScreenState extends State<SplasgScreen> {
  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.get("email");

    Timer(const Duration(seconds: 1), (() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => email == null ? LogIn() : ChatScreen(),
          ));
      print("object");
    }));
  }
}
