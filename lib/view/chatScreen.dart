import 'package:chat_app/view/authFunction.dart';
import 'package:chat_app/view/showMsg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var LoginUser = FirebaseAuth.instance.currentUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Servicesfnc services = Servicesfnc();
  TextEditingController msg = TextEditingController();

  final msgstore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  GetCurrentUser() {
    final user = auth.currentUser;
    if (user != null) {
      LoginUser = user;
    }
  }

  msgSendButton() {
    if (msg.text.isNotEmpty) {
      msgstore.collection('Messages').doc().set({
        "Messages": msg.text.trim(),
        "user": LoginUser!.email.toString(),
        "time": DateTime.now(),
      });
    }
    msg.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.home)),
        actions: [
          IconButton(
              onPressed: () async {
                services.Logout(context);

                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove('email');
              },
              icon: const Icon(Icons.logout)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        title: Text(LoginUser!.email.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: const SingleChildScrollView(
                  physics: ScrollPhysics(), child: ShowMessages()),
            ),
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 8)),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 237, 226, 255),
                    border: Border(
                      top: BorderSide(width: 0.5),
                    ),
                  ),
                  child: TextField(
                    controller: msg,
                    decoration: const InputDecoration(
                      hintText: "Enter Message",
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 237, 226, 255),
                  border: Border(
                    top: BorderSide(width: 0.5),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    msgSendButton();
                    print("msgSendButton");
                  },
                  icon: const Icon(Icons.send),
                  color: Colors.deepPurple,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
