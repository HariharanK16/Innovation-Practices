import "package:flutter/material.dart";
import 'package:supplychaintracker/screens/home/usertile.dart';
// import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/shared/loading.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:provider/provider.dart';
import 'package:supplychaintracker/services/database.dart';

class ViewProducts extends StatefulWidget {
  @override
  _ViewProductsState createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Userdetailes>>.value(
        value: DatabaseService().displayproduct,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'FROUTE',
              style: TextStyle(
                  color: Colors.black, fontFamily: "Pompiere", fontSize: 25),
            ),
            backgroundColor: Color(0xFFddffc8),
            elevation: 1.0,
          ),
          body: Container(
            child: Userlist(),
          ),
        ));
  }
}

class Userlist extends StatefulWidget {
  @override
  _UserlistState createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    List<Userdetailes> list = List<Userdetailes>();
    final users = Provider.of<List<Userdetailes>>(context);
    // final String id = AuthService().userDetails();
    if (users == null) {
      return Loading();
    } else {
      int n = users.length;
      for (int i = 0; i < n; i++) {
        // print(users[i].sellFlag);
        if (users[i].sellFlag == true) {
          // print(users[i].sellFlag);
          list.add(users[i]);
        }
      }
    }
    // print(list.length);
    return Container(
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(list.length, (index) {
              return UserTile(user: list[index]);
            })));
  }
}
