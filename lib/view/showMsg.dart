import 'package:chat_app/view/chatScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowMessages extends StatefulWidget {
  const ShowMessages({super.key});

  @override
  State<ShowMessages> createState() => _ShowMessagesState();
}

class _ShowMessagesState extends State<ShowMessages> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Messages")
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          physics: const ScrollPhysics(),
          reverse: false,
          shrinkWrap: true,
          primary: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, i) {
            QueryDocumentSnapshot x = snapshot.data!.docs[i];
            return ListTile(
              title: Column(
                crossAxisAlignment: LoginUser!.email == x['user']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 212, 186, 255),
                        border: Border.all(
                          color: const Color.fromARGB(255, 212, 186, 255),
                          width: 0.1,
                        ),
                        borderRadius: LoginUser!.email == x['user']
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.zero,
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.zero,
                                topRight: Radius.circular(25),
                              ),
                      ),
                      child: Column(
                        crossAxisAlignment: LoginUser!.email == x['user']
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            x['user'],
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            x['Messages'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
