import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
//import 'package:supplychaintracker/screens/home/Userlist.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';

class Addchain extends StatelessWidget {
  final Userdetailes sellers;
  final db = FirebaseFirestore.instance.collection('TChain');
  Addchain({this.sellers});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SubCategories"),
        centerTitle: true,
      ),
      // body: new StreamBuilder<DocumentSnapshot>(
      //   stream: db.doc().snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       var doc = snapshot.data;
      //       return new ListView.builder(
      //           itemCount: doc.length,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Card(
      //                 child: Column(
      //                   children: <Widget>[
      //                     Text(sellers.pname),
      //                     SizedBox(
      //                       height: 10.0,
      //                     ),
      //                     Text(sellers.quan),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           });
      //     } else {
      //       return LinearProgressIndicator();
      //     }
      //   },
      // ),
    );
  }
}
