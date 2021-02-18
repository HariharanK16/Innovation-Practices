import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference account =
      FirebaseFirestore.instance.collection('accountDetail');

  Future updateUserAccount(String userName, String email) async {
    return await account.doc(uid).set({
      'userName': userName,
      'email': email,
      'userID': uid,
    });
  }

  Stream<QuerySnapshot> get accounts {
    return account.snapshots();
  }
}
