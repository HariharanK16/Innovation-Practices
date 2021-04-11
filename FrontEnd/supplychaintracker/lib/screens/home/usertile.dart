import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplychaintracker/screens/home/Display.dart';
import 'package:supplychaintracker/services/auth.dart';

class UserTile extends StatelessWidget {
  final Userdetailes user;
  final String req = 'Scan';
  final String id = AuthService().userDetails();
  @override
  UserTile({this.user});
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          padding: EdgeInsets.only(top: 8.0),
          child: Container(
            height: 650,
            // width: 300,
            child: Card(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 200,
                      margin: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                            fit: BoxFit.fill,
                            image: user.imgurl != ''
                                ? NetworkImage('${user.imgurl}')
                                : NetworkImage(
                                    'https://cdn.dribbble.com/users/2066835/screenshots/11186147/media/616bc1e9a6ff48544b2342e5a6b85d01.jpg?compress=1&resize=400x300')),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("Product Name: " + user.pname),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text("Seller Name: " + user.buyerName),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text("Seller: " + user.buyerRole),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: int.parse(user.quan) > 0
                        ? Text("Status : Available")
                        : Text("Status : Currently Unavailable"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Display(user: user, request: req)));
          }),
    );
  }
}
