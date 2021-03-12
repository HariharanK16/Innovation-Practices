import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supplychaintracker/screens/home/userpage.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
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
              SizedBox(height: 8),
              RaisedButton.icon(
                  icon: Icon(Icons.account_box_sharp),
                  label: Text("Click to view detaile"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Userpage(qrs: qr)));
                  })
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
      if (!mounted) return;
      setState(() {
        this.qr = qr;
        return qr;
        print("This is qr $qr");
      });
    } on PlatformException {
      qr = "Sorry Some error has occured";
    }
  }
}
