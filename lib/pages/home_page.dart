import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference usersReference =
        FirebaseFirestore.instance.collection('USERS');
    print(usersReference);
    usersReference.get().then((value) {
      QuerySnapshot userCollection = value;
      List<QueryDocumentSnapshot> docs = userCollection.docs;
      docs.forEach((element) {
        print(element.id);
        print(element.data());
      });
    });

    // print(usersReference.);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "FirebaseApp",
          ),
          centerTitle: true,
        ),
        body: Column(),
      ),
    );
  }
}
