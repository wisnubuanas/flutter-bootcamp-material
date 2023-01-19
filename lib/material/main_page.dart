import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class MainPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  // const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Firestore Demo"),
      ),
      body: Stack(children: [
        ListView(
          children: [
            StreamBuilder(
              stream: users.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data!.docs
                          .map((e) => ListTile(
                                title: Text(e["name"]),
                                subtitle: Text(e["age"].toString()),
                              ))
                          .toList());
                } else {
                  return Container();
                }
              },
              // stream: users.snapshots(),
            ),
            //aDd data
          ],
        )
      ]),
    );
  }
}
