import 'package:flutter/cupertino.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supplychaintracker/services/database.dart';
//import 'package:supplychaintracker/screens/home/Userlist.dart';
import 'package:provider/provider.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/screens/middleMens/Result.dart';
import 'package:supplychaintracker/shared/loading.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Userpage extends StatelessWidget {
  final String qrc;
  final Userdetailes pname;
  Userpage({this.qrc, this.pname});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Userdetailes>>.value(
      value: DatabaseService().displayproduct,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Froute'),
          backgroundColor: Colors.orange[400],
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: SellerList(qrs: qrc),
            ),
          ),
        ])),
        backgroundColor: Colors.green[400],
      ),
    );
  }
}

class SellerList extends StatefulWidget {
  final String qrs;
  SellerList({this.qrs});
  @override
  _SellerListState createState() => _SellerListState(qrs1: qrs);
}

class _SellerListState extends State<SellerList> {
  final String qrs1;
  _SellerListState({this.qrs1});
  @override
  Widget build(BuildContext context) {
    List<Userdetailes> list = List<Userdetailes>();
    List<Userdetailes> users = Provider.of<List<Userdetailes>>(context);
    if (users == null) {
      return Loading();
    } else {
      users.sort((a, b) => b.timeStamp.compareTo(a.timeStamp));
      int n = users.length;
      String curhash = qrs1;
      // print(users.length);
      for (int i = 0; i < n; i++) {
        // print(users[i].timeStamp.toDate());
        if (users[i].curhash.compareTo(curhash) == 0) {
          // print(users[i].curhash);
          list.add(users[i]);
          curhash = users[i].preHash;
        }
      }
      print(list.length);
      // print(qrs1);
    }
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return BuyForm(seller: list[index], qrs: qrs1);
      },
    );
  }
}
