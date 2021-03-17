// import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:supplychaintracker/screens/addproduct.dart';
// import 'package:supplychaintracker/screens/home/Userlist.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supplychaintracker/screens/home/usertile.dart';

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
          title: Text(
            'FROUTE',
            style: TextStyle(color: Colors.black54),
          ),
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
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Userlist(),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Addproduct()));
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:supplychaintracker/models/Userdetailes.dart';

class Userlist extends StatefulWidget {
  @override
  _UserlistState createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Userdetailes>>(context);
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        if (users.length == null) {
          return Container(
            child: Text("Loading"),
          );
        }
        return UserTile(user: users[index]);
      },
    );
  }
}
