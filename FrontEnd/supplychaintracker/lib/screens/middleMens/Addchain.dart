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
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                "Purchase Successfull",
                style: TextStyle(
                    fontFamily: "Pompiere",
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.amberAccent),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  color: Colors.greenAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Go Back",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
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
