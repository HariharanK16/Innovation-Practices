import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Userpage extends StatelessWidget {
  final String qrs;
  Userpage({this.qrs});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Froute'),
        backgroundColor: Colors.orange[400],
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
            //padding: EdgeInsets.only(top: 3.0),
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 10.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: IconButton(
                      icon: Icon(Icons.person, color: Colors.white),
                      onPressed: () {}),
                  radius: 25,
                  backgroundColor: Colors.black,
                ),
                title: Text(qrs),
              ),
            ),
            onTap: () async {
              if (await canLaunch(qrs)) {
                await launch(qrs);
              }
            }),
      ),
      backgroundColor: Colors.green[400],
    );
    // body: Center(
    //   child: Container(
    //     child: Text('$qrs'),
    //   ),
    // ),
  }
}
