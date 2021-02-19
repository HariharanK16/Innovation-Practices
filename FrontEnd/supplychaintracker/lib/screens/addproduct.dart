import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/services/database.dart';

class Addproduct extends StatelessWidget {
  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Colors.lightGreen,
        elevation: 0.2,
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String pname = '';
  String pdesc = '';
  String quan = '';
  String qual = '';
  String role = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter a product name' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.shopping_basket),
              hintText: 'Enter product name',
              labelText: 'Product Name',
            ),
            onChanged: (val) {
              setState(() => pname = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter description' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.description),
              hintText: 'Enter product description',
              labelText: 'Product Description',
            ),
            onChanged: (val) {
              setState(() => pdesc = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Quantity must' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.line_weight),
              hintText: 'Enter product quantity in kilograms',
              labelText: 'Quantity',
            ),
            onChanged: (val) {
              setState(() => quan = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter quality grade' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.high_quality),
              hintText: 'Enter Quality check details',
              labelText: 'Quality',
            ),
            onChanged: (val) {
              setState(() => qual = val);
            },
          ),
          TextFormField(
            validator: (val) => val.isEmpty ? 'Enter your role' : null,
            decoration: const InputDecoration(
              icon: const Icon(Icons.perm_identity),
              hintText: 'Enter your role eg:"Farmer"',
              labelText: 'Role',
            ),
            onChanged: (val) {
              setState(() => role = val);
            },
          ),
          new Container(
            child: new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text('Add Product'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await DatabaseService(uid: uid)
                          .addProduct(pname, pdesc, quan, qual, role);

                      Navigator.pop(context);
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
