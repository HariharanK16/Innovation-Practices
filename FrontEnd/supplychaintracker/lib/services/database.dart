import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
// import 'package:flutter/cupertino.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/services/auth.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference account =
      FirebaseFirestore.instance.collection('accountDetail');

  final CollectionReference product =
      FirebaseFirestore.instance.collection('TChain');

  final String userID = AuthService().userDetails().toString();

  final CollectionReference sctracker =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> updateUserData(
      String buyerID,
      String buyerName,
      String descofProd,
      int productID,
      String productName,
      String quality,
      int sellerID,
      String sellerName,
      Timestamp timestamp,
      String transactionID) async {
    return await sctracker.doc(uid).set({
      'buyerID': buyerID,
      'buyerName': buyerName,
      'descofProd': productID,
      'productName': productName,
      'quality': quality,
      'sellerID': sellerID,
      'sellerName': sellerName,
      'timeStamp': timestamp,
      'transactionID': transactionID,
    });
  }

  // get transaction stream
  Stream<QuerySnapshot> get transacs {
    return sctracker.snapshots();
  }

  Future updateUserAccount(
      String userName, String email, String role, String city) async {
    return await account.doc(userID).set({
      'userName': userName,
      'email': email,
      'userID': uid,
      'role': role,
      'city': city,
    });
  }

  Future addProduct(String pname, String pdesc, String quan, String quant,
      String qual, String imgUrl) async {
    String buyerName = '';
    account.doc(userID).snapshots().listen((event) {
      buyerName = event.get('userName');
    });
    await Future.delayed(Duration(seconds: 1));
    print(buyerName);

    // print(buyerName);
    DateTime time = Timestamp.now().toDate();
    var val = (pname + buyerName + userID + pdesc + qual + time.toString());
    var bytes = utf8.encode(val);
    var encode = sha256.convert(bytes);
    // print(encode);
    return await product.doc().set({
      'ProductName': pname,
      'ProductDesc': pdesc,
      'Quantity': quan,
      'Quality': qual,
      'QuantityType': quant,
      'prevHash': null,
      'currentHash': encode.toString(),
      'sellFlag': true,
      'Timestamp': time,
      'buyerID': userID,
      'sellerID': null,
      'sellerName': null,
      'buyerName': buyerName,
      'amount': 0,
      'imgURL': imgUrl,
    });
  }

  List<Userdetailes> _userlist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Userdetailes(
        pname: doc.data()['ProductName'] ?? '',
        pdesc: doc.data()['ProductDesc'] ?? '',
        quan: doc.data()['Quantity'] ?? '',
        qual: doc.data()['Quality'] ?? '',
        quant: doc.data()['QuantityType'] ?? '',
        imgurl: doc.data()['imgURL'] ?? '',
        buyerID: doc.data()['buyerID'] ?? '',
        buyerName: doc.data()['buyerName'] ?? '',
      );
    }).toList();
  }

  Stream<List<Userdetailes>> get displayproduct {
    return product.snapshots().map(_userlist);
  }
}
// how about running the app?
