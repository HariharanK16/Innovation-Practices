import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:supplychaintracker/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplychaintracker/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().accounts,
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
      ),
    );
  }
}
