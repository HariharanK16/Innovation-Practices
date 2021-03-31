// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:supplychaintracker/screens/home/userpage.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/screens/middleMens/scanResult.dart';

class Scan extends StatefulWidget {
  final Userdetailes detail;
  Scan({this.detail});
  @override
  _ScanState createState() => _ScanState(users: this.detail);
}

class _ScanState extends State<Scan> {
  Userdetailes users;
  _ScanState({this.users});
  String qr = 'Hello';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Froute'),
        backgroundColor: Colors.orange[400],
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan Result',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Center(
                    child: QrImage(
                  data: users.curhash,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  version: QrVersions.auto,
                  size: 270.0,
                )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text('Scan'),
        onPressed: () => scanQR(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.green[400],
    );
  }

  Future<void> scanQR() async {
    try {
      final qr = await FlutterBarcodeScanner.scanBarcode(
          '#f21233', 'Cancel', true, ScanMode.QR);
      print(qr);
      if (!mounted) {
        return;
      }

      setState(() {
        // print(qr + " hahahaha");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Userpage(qrc: qr.toString(), pname: users)));
        // return qr;
        // print("This is qr $qr");
      });
    } on PlatformException {
      qr = "Sorry Some error has occured";
    }
  }
}
