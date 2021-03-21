import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
// import 'package:flutter/foundation.dart';
import 'package:supplychaintracker/models/AccountDetails.dart';
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
  DocumentSnapshot user;
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

  Future updateUserAccount(String userName, String email, String role,
      String city, String phn) async {
    return await account.doc(userID).set({
      'userName': userName,
      'email': email,
      'userID': uid,
      'role': role,
      'city': city,
      'phn': phn,
    });
  }

  Future changeQuan(String quan, String nquan, String pid) async {
    int quantity = int.parse(quan) - int.parse(nquan);
    print(uid);
    return await product.doc(pid).update({'Quantity': quantity.toString()});
    // return await product.doc(uid).set({'Quantity': quantity.toString()});
    // return await product.doc(uid).set({
    //   'Quantity': quan,
    // });
  }

  Future addchain(
      String pname,
      String pdesc,
      String quan,
      String quant,
      String qual,
      String imgUrl,
      String sellerid,
      String sellerhash,
      String sellerName,
      String amount) async {
    DateTime time = Timestamp.now().toDate();
    String buyerName = '', buyerPhone = '';
    account.doc(userID).snapshots().listen((event) {
      buyerName = event.get('userName');
      buyerPhone = event.get('phn');
    });

    var val = (pname +
        buyerName +
        sellerName +
        userID +
        pdesc +
        qual +
        time.toString());
    var bytes = utf8.encode(val);
    var encode = sha256.convert(bytes);

    await Future.delayed(Duration(seconds: 1));

    return await product.doc().set({
      'ProductName': pname,
      'ProductDesc': pdesc,
      'Quantity': quan,
      'Quality': qual,
      'QuantityType': quant,
      'prevHash': sellerhash,
      'currentHash': encode.toString(),
      'sellFlag': false,
      'Timestamp': time,
      'buyerID': userID,
      'sellerID': sellerid,
      'sellerName': sellerName,
      'buyerName': buyerName,
      'amount': int.parse(amount),
      'imgURL': imgUrl,
      'buyerPhone': buyerPhone,
    });
  }

  Future addProduct(String pname, String pdesc, String quan, String quant,
      String qual, String imgUrl) async {
    String buyerName = '', buyerPhone = '';
    account.doc(userID).snapshots().listen((event) {
      buyerName = event.get('userName');
      buyerPhone = event.get('phn');
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
      'buyerPhone': buyerPhone,
    });
  }

  List<AccountDetails> _accountList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AccountDetails(
        uname: doc.data()['userName'] ?? '',
        umail: doc.data()['email'] ?? '',
        uloc: doc.data()['city'] ?? '',
        uphn: doc.data()['phn'] ?? '',
        urole: doc.data()['role'] ?? '',
      );
    }).toList();
  }

  Stream<List<AccountDetails>> get accountDetails {
    return account.snapshots().map(_accountList);
  }

  List<Userdetailes> _userlist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Userdetailes(
        pid: doc.id ?? '',
        pname: doc.data()['ProductName'] ?? '',
        pdesc: doc.data()['ProductDesc'] ?? '',
        quan: doc.data()['Quantity'] ?? '',
        qual: doc.data()['Quality'] ?? '',
        quant: doc.data()['QuantityType'] ?? '',
        imgurl: doc.data()['imgURL'] ?? '',
        buyerID: doc.data()['buyerID'] ?? '',
        curhash: doc.data()['currentHash'] ?? '',
        preHash: doc.data()['prevHash'] ?? '',
        buyerName: doc.data()['buyerName'] ?? '',
        buyerPhone: doc.data()['buyerPhone'] ?? '',
        timeStamp: doc.data()['Timestamp'] ?? '',
        sellFlag: doc.data()['sellFlag'] ?? false,
        sellerName: doc.data()['sellerName'] ?? '',
      );
    }).toList();
  }

  Stream<List<Userdetailes>> get displayproduct {
    return product.snapshots().map(_userlist);
  }

  // Stream<List<Userdetailes>> get displayproducts1 {
  //   Userdetailes users = Usertile().user;
  //   return product
  //       .doc(users.pname)
  //       .collection(users.curhash)
  //       .snapshots()
  //       .map(_userlist);
  // }
}
