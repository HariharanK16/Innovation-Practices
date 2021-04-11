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
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Alert',
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Pompiere",
              fontSize: 25,
              letterSpacing: 2,
              fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.orange[400],
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Purchase Successful",
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
                    "Go to home page",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
