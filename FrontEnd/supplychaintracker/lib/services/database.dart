import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference account =
      FirebaseFirestore.instance.collection('accountDetail');

  final CollectionReference product =
      FirebaseFirestore.instance.collection('ProductDetail');

  Future updateUserAccount(String userName, String email) async {
    return await account.doc().set({
      'userName': userName,
      'email': email,
      'userID': uid,
    });
  }

  Future addProduct(String pname, String pdesc, String quan, String qual,
      String role, String imgUrl) async {
    return await product.doc().set({
      'ProductName': pname,
      'ProductDesc': pdesc,
      'Quantity': quan,
      'Quality': qual,
      'Role': role,
      'Timestamp': Timestamp.now().toDate(),
      'userID': uid,
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
        role: doc.data()['Role'] ?? '',
        imgurl: doc.data()['imgURL'] ?? '',
      );
    }).toList();
  }

  Stream<List<Userdetailes>> get displayproduct {
    return product.snapshots().map(_userlist);
  }
}
