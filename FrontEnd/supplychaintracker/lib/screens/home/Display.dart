import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/services/auth.dart';

class Display extends StatelessWidget {
  final AuthService _auth = AuthService();
  final Userdetailes user;
  Display({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FlatButton(
          child: Text(
              '${user.pdesc}\n${user.pname}\n${user.qual}\n${user.quan}\n${user.role}')),
    );
  }
}
