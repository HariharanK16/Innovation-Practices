import "package:flutter/material.dart";
import 'package:supplychaintracker/screens/home/MyProdTile.dart';
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
    final users = Provider.of<List<Userdetailes>>(context);
    if (users == null) {
      return Loading();
    }
    return Container(
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(users.length, (index) {
              return MyProdTile(user: users[index]);
            })));
  }
}
