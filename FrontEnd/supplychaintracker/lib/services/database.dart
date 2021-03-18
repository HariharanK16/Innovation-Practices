import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

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
}
