import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplychaintracker/screens/home/Display.dart';
import 'package:supplychaintracker/services/auth.dart';

class UserTile extends StatelessWidget {
  final Userdetailes user;
  final String id = AuthService().userDetails();
  @override
  UserTile({this.user});
  Widget build(BuildContext context) {
    if (user.buyerID == id) {
      return Container(
        child: FlatButton(
            padding: EdgeInsets.only(top: 8.0),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: IconButton(
                      icon: Icon(Icons.person, color: Colors.white),
                      onPressed: () {}),
                  radius: 25,
                  backgroundColor: Colors.black,
                ),
                title: Text(user.pname),
                subtitle: Text('I am a ${user.pname}'),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Display(user: user)));
            }),
      );
    } else {
      return Container();
    }
  }
}
