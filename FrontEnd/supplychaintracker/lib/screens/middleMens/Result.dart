// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/screens/authenticate/animation/FadeAnimation.dart';
// import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:supplychaintracker/screens/middleMens/Addchain.dart';
// import 'package:supplychaintracker/shared/loading.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

class BuyForm extends StatefulWidget {
  // final AuthService _auth = AuthService();
  final Userdetailes seller;
  final String qrs;
  BuyForm({this.seller, this.qrs});

  @override
  _BuyFormState createState() => _BuyFormState(seller: seller, qrs: qrs);
}

class _BuyFormState extends State<BuyForm> {
  // final AuthService _auth = AuthService();
  final Userdetailes seller;
  final String qrs;
  _BuyFormState({this.seller, this.qrs});
  final _formKey = GlobalKey<FormState>();

  String amount = '';
  String quantity = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            height: 750.0,
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text('Product Details',
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: seller.imgurl != ''
                              ? NetworkImage('${seller.imgurl}')
                              : NetworkImage(
                                  'https://cdn.dribbble.com/users/2066835/screenshots/11186147/media/616bc1e9a6ff48544b2342e5a6b85d01.jpg?compress=1&resize=400x300'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  ListTile(
                    // leading: Icon(Icons.thumb_up),
                    title: Text('Name: ${seller.pname}'),
                    subtitle: Text(
                      'Quality: ${seller.qual}',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ListTile(
                    // leading: Icon(Icons.thumb_up),
                    title: Text('Description: ${seller.pdesc}'),
                    subtitle: Text(
                      'Quantity: ${seller.quan}',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Column(
                          children: <Widget>[
                            FadeAnimation(1.2,
                                makeInputquantity(label: "Product Quantity")),
                            FadeAnimation(
                                1.2, makeInputamt(label: "Purchase amount")),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FadeAnimation(
                            1.5,
                            Container(
                              padding: EdgeInsets.only(top: 3, left: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                    top: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black),
                                  )),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    await DatabaseService(uid: seller.buyerID)
                                        .changeQuan(
                                            seller.quan, quantity, seller.pid);
                                    await DatabaseService(uid: seller.buyerID)
                                        .addchain(
                                            seller.pname,
                                            seller.pdesc,
                                            quantity,
                                            seller.quant,
                                            seller.qual,
                                            seller.imgurl,
                                            seller.buyerID,
                                            seller.curhash,
                                            seller.buyerName,
                                            amount);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Addchain(sellers: seller)));
                                  }
                                },
                                color: Colors.greenAccent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Buy Product",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeInputquantity({
    label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter product quantity' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => quantity = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputamt({
    label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter product quality' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => amount = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
