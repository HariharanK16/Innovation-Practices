import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Container(
          child: Text('$qrs'),
        ),
      ),
      backgroundColor: Colors.green[400],
    );
  }
}
