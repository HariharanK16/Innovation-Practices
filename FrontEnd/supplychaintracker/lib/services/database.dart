import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  //collection reference
  final CollectionReference account =
      FirebaseFirestore.instance.collection('accountDetail');

  final CollectionReference product =
      FirebaseFirestore.instance.collection('ProductDetail');

  Future updateUserAccount(String userName, String email) async {
    return await account.doc(uid).set({
      'userName': userName,
      'email': email,
      'userID': uid,
    });
  }

  Future addProduct(
      String pname, String pdesc, String quan, String qual, String role) async {
    return await product.doc().set({
      'ProductName': pname,
      'ProductDesc': pdesc,
      'Quantity': quan,
      'Quality': qual,
      'Role': role,
      'TimeStamp': Timestamp.now(),
      'userID': uid,
    });
  }

  Stream<QuerySnapshot> get accounts {
    return account.snapshots();
  }
}
