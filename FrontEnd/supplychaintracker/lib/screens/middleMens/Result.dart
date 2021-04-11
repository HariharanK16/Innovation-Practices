import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/screens/authenticate/animation/FadeAnimation.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:supplychaintracker/screens/middleMens/Addchain.dart';

class BuyForm extends StatefulWidget {
  final List<Userdetailes> seller;
  final String qrs;
  BuyForm({this.seller, this.qrs});

  @override
  _BuyFormState createState() => _BuyFormState(seller: seller, qrs: qrs);
}

class _BuyFormState extends State<BuyForm> {
  final List<Userdetailes> seller;
  final String qrs;
  _BuyFormState({this.seller, this.qrs});
  final _formKey = GlobalKey<FormState>();

  String amount = '';
  String quantity = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: double.infinity,
          ),
          // height: 1000,
          width: MediaQuery.of(context).size.width - 5,
          child: Card(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Product Name: ' + seller[0].pname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Pompiere",
                      fontSize: 40),
                ),
                SizedBox(
                  height: 10.0,
                ),
                for (int i = 0; i < seller.length; i++) ...[
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            //CirclAvatar
                            SizedBox(
                              height: 10,
                            ), //SizedBox
                            Text(
                              'Current:' + seller[i].buyerName,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w500,
                              ), //Textstyle
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Role:' + seller[i].buyerRole,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w500,
                              ), //Textstyle
                            ),
                            SizedBox(
                              height: 30,
                            ), //SizedBox
                            Text(
                              seller[i].sellerName == ''
                                  ? ''
                                  : 'Previous:' + seller[i].sellerName,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w500,
                              ), //Textstyle
                            ), //Text
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              seller[i].sellerRole == ''
                                  ? ''
                                  : 'Role:' + seller[i].sellerRole,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w500,
                              ), //Textstyle
                            ),
                            SizedBox(
                              height: 10,
                            ), //SizedBox  //SizedBox
                            Text(
                              'Date:' + seller[i].timeStamp.toDate().toString(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green[900],
                                fontWeight: FontWeight.w500,
                              ), //Textstyle
                            ), //SizedBox
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
                  ),
                ],
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Purchase!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Pompiere",
                      fontSize: 40),
                ),
                SizedBox(
                  height: 10.0,
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
                              minWidth: 200,
                              height: 60,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  await DatabaseService(uid: seller[0].buyerID)
                                      .changeQuan(seller[0].quan, quantity,
                                          seller[0].pid);
                                  await DatabaseService(uid: seller[0].buyerID)
                                      .addchain(
                                          seller[0].pname,
                                          seller[0].pdesc,
                                          quantity,
                                          seller[0].quant,
                                          seller[0].qual,
                                          seller[0].imgurl,
                                          seller[0].buyerID,
                                          seller[0].curhash,
                                          seller[0].buyerName,
                                          amount,
                                          seller[0].buyerRole);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Addchain(sellers: seller[0])));
                                }
                              },
                              color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Buy Product",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
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
    );
  }

  Widget makeInputquantity({
    label,
  }) {
    return Container(
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
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
      ),
    );
  }

  Widget makeInputamt({
    label,
  }) {
    return Container(
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black87),
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
      ),
    );
  }
}
