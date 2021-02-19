import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:supplychaintracker/screens/addproduct.dart';
import 'package:supplychaintracker/screens/home/Userlist.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Userdetailes>>.value(
      value: DatabaseService().displayproduct,
      child: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text('Supply Chain Tracker'),
          backgroundColor: Colors.white,
          elevation: 0.2,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign Out'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        // body: Userlist(),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                  icon: Icon(Icons.disc_full),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Userlist()));
                  }),
            ),
          ),
          Container(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Addproduct()));
                  }),
            ),
          ),
        ])),
      ),
    );
  }
}
