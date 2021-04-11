// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
// import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/screens/home/Scanner.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:supplychaintracker/screens/middleMens/scanResult.dart';
import 'package:flutter/services.dart';

class Display extends StatefulWidget {
  // final AuthService _auth = AuthService();
  final Userdetailes user;
  final String request;
  Display({this.user, this.request});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  String qr = 'Hello';
  @override
  Widget build(BuildContext context) {
    if (widget.request == 'Scan') {
      return Scaffold(
        backgroundColor: Color(0xFFddffc8),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Product Detail',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontFamily: "Pompiere", fontSize: 40),
          ),
          backgroundColor: Color(0xFFddffc8),
          elevation: 0.2,
        ),
        body: Container(
          // height: MediaQuery.of(context).size.height,
          constraints: BoxConstraints(maxHeight: double.infinity),
          width: 500,
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  // width: 100,
                  // height: 100,
                  constraints: BoxConstraints(maxHeight: double.infinity),
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                        // fit: BoxFit.fill,
                        width: 200.0,
                        height: 200.0,
                        image: widget.user.imgurl != ''
                            ? NetworkImage(
                                '${widget.user.imgurl}',
                              )
                            : NetworkImage(
                                'https://cdn.dribbble.com/users/2066835/screenshots/11186147/media/616bc1e9a6ff48544b2342e5a6b85d01.jpg?compress=1&resize=400x300')),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Product Name: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "      " + widget.user.pname,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Seller Name: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "         " + widget.user.buyerName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Seller : ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "                 " + widget.user.buyerRole,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Quantity: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "             " +
                            widget.user.quan +
                            " " +
                            widget.user.quant,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Quality: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "               " + widget.user.qual,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Phone Number: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        widget.user.buyerPhone != ''
                            ? "     " + widget.user.buyerPhone
                            : "     " + "Unavailble",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Description: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        width: 350,
                        child: Text(
                          "      " + widget.user.pdesc,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: "Pompiere",
                              fontSize: 25.0,
                              color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.orange,
                  icon: Icon(Icons.qr_code),
                  label: Text(
                    'Scan QR',
                    style: TextStyle(
                        fontFamily: "Pompiere",
                        fontSize: 25.0,
                        color: Colors.black),
                  ),
                  onPressed: () => scanQR(),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text(
            'Product Detail',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "Pompiere", fontSize: 40),
          ),
          backgroundColor: Colors.lightGreen,
          elevation: 0.2,
        ),
        body: Container(
          height: 650,
          width: 500,
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  // width: 100,
                  // height: 100,
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                        // fit: BoxFit.fill,
                        width: 200.0,
                        height: 200.0,
                        image: widget.user.imgurl != ''
                            ? NetworkImage(
                                '${widget.user.imgurl}',
                              )
                            : NetworkImage(
                                'https://cdn.dribbble.com/users/2066835/screenshots/11186147/media/616bc1e9a6ff48544b2342e5a6b85d01.jpg?compress=1&resize=400x300')),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Product Name: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "      " + widget.user.pname,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Seller Name: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "         " + widget.user.buyerName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Seller: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "         " + widget.user.buyerRole,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Quantity: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "             " +
                            widget.user.quan +
                            " " +
                            widget.user.quant,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Quality: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        "               " + widget.user.qual,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Phone Number: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                      Text(
                        widget.user.buyerPhone != ''
                            ? "     " + widget.user.buyerPhone
                            : "     " + "Unavailble",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontSize: 25.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        "Description: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Pompiere",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        width: 350,
                        child: Text(
                          "      " + widget.user.pdesc,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: "Pompiere",
                              fontSize: 25.0,
                              color: Colors.teal),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.orange,
                  icon: Icon(Icons.qr_code),
                  label: Text(
                    'Get QR',
                    style: TextStyle(
                        fontFamily: "Pompiere",
                        fontSize: 25.0,
                        color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scan(detail: widget.user)));
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Future<void> scanQR() async {
    try {
      final qr = await FlutterBarcodeScanner.scanBarcode(
          '#f21233', 'Cancel', true, ScanMode.QR);
      if (!mounted)
        return;
      else {
        setState(() {
          this.qr = qr;
          // print("This is qr $qr");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Userpage(qrc: qr)));
          return qr;
        });
      }
      // print("This is qr $qr");
    } on PlatformException {
      qr = "Sorry Some error has occured";
    }
  }
}
