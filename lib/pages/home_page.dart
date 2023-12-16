import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection('USERS');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "FirebaseApp",
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  usersReference.get().then((value) {
                    QuerySnapshot userCollection = value;
                    List<QueryDocumentSnapshot> docs = userCollection.docs;
                    docs.forEach((element) {
                      print(element.id);
                    });
                  });
                },
                child: Text("Obtener data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
