import "package:flutter/material.dart";
import 'package:supplychaintracker/screens/home/MyProdTile.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/shared/loading.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:provider/provider.dart';
import 'package:supplychaintracker/services/database.dart';

class MyProduct extends StatefulWidget {
  @override
  _MyProductState createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
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
            child: MyProdList(),
          ),
        ));
  }
}

class MyProdList extends StatefulWidget {
  @override
  _MyProdListState createState() => _MyProdListState();
}

class _MyProdListState extends State<MyProdList> {
  @override
  Widget build(BuildContext context) {
    List<Userdetailes> list = List<Userdetailes>();
    final users = Provider.of<List<Userdetailes>>(context);
    final String id = AuthService().userDetails();
    if (users == null) {
      return Loading();
    } else {
      int n = users.length;
      for (int i = 0; i < n; i++) {
        if (users[i].buyerID == id) {
          list.add(users[i]);
        }
      }
    }
    return Container(
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(list.length, (index) {
              return MyProdTile(user: list[index]);
            })));
  }
}
