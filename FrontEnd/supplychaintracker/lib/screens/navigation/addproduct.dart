import 'package:flutter/material.dart';

class AddProd extends StatefulWidget {
  @override
  _AddProdState createState() => _AddProdState();
}

class _AddProdState extends State<AddProd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.white,
          title: "Add Product",
          child: Text("Add product"),
        ),
      ),
      body: Container(
        child: Text("Product addition"),
      ),
    );
  }
}
