import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController search = TextEditingController();
  bool isLoading = false;
  Map<String, dynamic> userMap = {};

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });
    final emailQuery =
        _firestore.collection('users').where("email", isEqualTo: search.text);
    final nameQuery =
        _firestore.collection('users').where("name", isEqualTo: search.text);

    final emailResults = await emailQuery.get();
    final nameResults = await nameQuery.get();

    final combinedResults = [...emailResults.docs, ...nameResults.docs];

    if (combinedResults.isNotEmpty) {
      setState(() {
        userMap = combinedResults[0].data();
        isLoading = false;
      });
      print(userMap);
    } else {
      print('User not found');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ));
            },
            child: const Text(
              "Chat",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.home)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment),
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height / 20,
                width: MediaQuery.sizeOf(context).width / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 241, 236, 252),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 17,
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              hintText: "Search",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    onSearch();
                                  },
                                  icon: const Icon(Icons.search))),
                        ),
                      ),
                    ],
                  ),
                ),
                userMap.isNotEmpty
                    ? Card(
                        elevation: 0.7,
                        child: InkWell(
                          child: ListTile(
                            onTap: () {},
                            leading: Icon(CupertinoIcons.person),
                            title: Text(userMap['name']),
                            subtitle: Text(
                              userMap['email'],
                              style: TextStyle(fontSize: 10),
                            ),
                            trailing: Text("12 a.m"),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
    );
  }
}
