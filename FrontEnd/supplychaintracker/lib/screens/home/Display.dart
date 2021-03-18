// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/services/auth.dart';

import 'package:supplychaintracker/screens/home/Scanner.dart';

class Display extends StatelessWidget {
  final AuthService _auth = AuthService();
  final Userdetailes user;
  Display({this.user});
  @override
  Widget build(BuildContext context) {
    // print('abcd ${user.imgurl}');

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
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
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      "Product Name: ",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.amberAccent),
                    ),
                    Text(
                      user.pname,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25.0, color: Colors.teal),
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
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.amberAccent),
                    ),
                    Text(
                      user.buyerName,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25.0, color: Colors.teal),
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
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.amberAccent),
                    ),
                    Text(
                      user.quan + " " + user.quant,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25.0, color: Colors.teal),
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
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.amberAccent),
                    ),
                    Text(
                      user.qual,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25.0, color: Colors.teal),
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
                      style:
                          TextStyle(fontSize: 25.0, color: Colors.amberAccent),
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
                        "      " + user.pdesc,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20.0, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      //       child: Column(
      //         children: [
      //           SizedBox(
      //             height: 40.0,
      //           ),
      //           Text('Product Details',
      //               style: TextStyle(fontSize: 25, color: Colors.black)),
      //           SizedBox(
      //             height: 20.0,
      //           ),
      //           Container(
      //             width: 150,
      //             height: 150,
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               image: DecorationImage(
      //                   image: user.imgurl != ''
      //                       ? NetworkImage('${user.imgurl}')
      //                       : NetworkImage(
      //                           'https://cdn.dribbble.com/users/2066835/screenshots/11186147/media/616bc1e9a6ff48544b2342e5a6b85d01.jpg?compress=1&resize=400x300'),
      //                   fit: BoxFit.fill),
      //             ),
      //           ),
      //           ListTile(
      //             // leading: Icon(Icons.thumb_up),
      //             title: Text('Name: ${user.pname}'),
      //             subtitle: Text(
      //               'Quality: ${user.qual}',
      //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //             ),
      //           ),
      //           ListTile(
      //             // leading: Icon(Icons.thumb_up),
      //             title: Text('Description: ${user.pdesc}'),
      //             subtitle: Text(
      //               'Quality: ${user.qual}',
      //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //             ),
      //           ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(19.0),
      //           //   child: Text(
      //           //     'Description: ${user.pdesc}',
      //           //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //           //   ),
      //           // ),
      //           // Padding(
      //           //   padding: const EdgeInsets.all(16.0),
      //           //   child: Text(
      //           //     'Quantity: ${user.quan}',
      //           //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
      //           //   ),
      //           // ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.qr_code),
        label: Text('QR CODE'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Scan(detail: user)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
