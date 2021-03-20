import 'package:cloud_firestore/cloud_firestore.dart';

class Userdetailes {
  final String pname;
  final String pdesc;
  final String quan;
  final String qual;
  final String quant;
  final String buyerID;
  final String imgurl;
  final String buyerName;
  final String curhash;
  final String buyerPhone;
  final String pid;
  final String preHash;
  final Timestamp timeStamp;
  Userdetailes(
      {this.pid,
      this.pname,
      this.pdesc,
      this.quan,
      this.qual,
      this.quant,
      this.imgurl,
      this.buyerID,
      this.curhash,
      this.preHash,
      this.buyerName,
      this.buyerPhone,
      this.timeStamp});
}
