import 'package:cloud_firestore/cloud_firestore.dart';

class Userdetailes {
  final String pname;
  final String pdesc;
  final String quan;
  final String qual;
  final String role;
  final String timestamp;

  Userdetailes(
      {this.pname,
      this.pdesc,
      this.quan,
      this.qual,
      this.role,
      this.timestamp});
}
