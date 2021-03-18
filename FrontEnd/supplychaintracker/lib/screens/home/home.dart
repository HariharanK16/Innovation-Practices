// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
// import 'package:supplychaintracker/screens/addproduct.dart';
// import 'package:supplychaintracker/screens/home/Userlist.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/screens/navigation/transaction.dart';
import 'package:supplychaintracker/screens/addproduct.dart';
import 'package:provider/provider.dart';
// import 'package:supplychaintracker/services/database.dart';
// import 'package:provider/provider.dart';
// import 'package:supplychaintracker/services/database.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:supplychaintracker/screens/home/usertile.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:supplychaintracker/shared/loading.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Userdetailes>>.value(
      value: DatabaseService().displayproduct,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'FROUTE',
            style: TextStyle(
                color: Colors.black, fontFamily: "Pompiere", fontSize: 25),
          ),
          backgroundColor: Color(0xFFddffc8),
          elevation: 1.0,
        ),
        drawer: Drawer(
          child: ColoredBox(
            color: Color(0xFFddffc8),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.grey[700],
                          size: 40.0,
                        ),
                        label: Text(
                          "Profile",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.place,
                          color: Colors.grey[700],
                          size: 40.0,
                        ),
                        label: Text(
                          "Track",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.add_sharp,
                          color: Colors.grey[700],
                          size: 40.0,
                        ),
                        label: Text(
                          "Add Item",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Navigator.push(context,
                    //     new MaterialPageRoute(builder: (context) => AddProd()));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Addproduct()));
                  },
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.view_list,
                          color: Colors.grey[700],
                          size: 40.0,
                        ),
                        label: Text(
                          "View Product",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )),
                  ),
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.push(context,
                    //       new MaterialPageRoute(builder: (context) => ViewProd()));
                  },
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.access_time_sharp,
                          color: Colors.grey[700],
                          size: 40.0,
                        ),
                        label: Text(
                          "History",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => TransactionDis()));
                  },
                ),
                SizedBox(
                  height: 340.0,
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: FlatButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.logout,
                          color: Colors.grey[700],
                          size: 40.0,
                        ),
                        label: Text(
                          "Sign Out",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )),
                  ),
                  onTap: () async {
                    await _auth.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          image: DecorationImage(
                              colorFilter: ColorFilter.linearToSrgbGamma(),
                              image: AssetImage('assets/froutimg1.jpeg'),
                              fit: BoxFit.cover,
                              scale: 1.0)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Image(
                            image: AssetImage('assets/froute_logo.png'),
                            height: 120,
                            // width: 140,
                          ),
                          Expanded(
                            child: Text(
                              "welcome",
                              style: TextStyle(
                                  fontFamily: "Pompiere",
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                // color: Colors.red,
                                width:
                                    MediaQuery.of(context).size.width * 0.5 - 4,
                                padding: EdgeInsets.all(20),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
                                  radius: 65,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  // color: Colors.yellow,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5 -
                                          4,
                                  child: SizedBox(
                                    child: SizedBox(
                                      child: Text(
                                        "Brad Holmes Kumar",
                                        style: TextStyle(
                                            fontFamily: "Pompiere",
                                            fontSize: 40),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Text("Address : xyz"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Contact : 9945211990"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Role : Farmer"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Color(0xFFddffc8),
                      child: Text(
                        "Your Products",
                        style: TextStyle(fontFamily: "Pompiere", fontSize: 40),
                      ),
                    ),
                    // SingleChildScrollView(
                    //   child: Container(
                    //     child: Column(
                    //       children: <Widget>[
                    //         Expanded(
                    //           child: Container(
                    //             child: Userlist(),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),

                // backgroundColor: Colors.white,
                // elevation: 0.2,
                // actions: <Widget>[
                //   FlatButton.icon(
                //     icon: Icon(Icons.person),
                //     label: Text('Sign Out'),
                //     onPressed: () async {
                //       await _auth.signOut();
                //     },
                // ),
                //   ],
                // ),
                // body: Container(
                //   child: Column(
                //     children: <Widget>[
                //       Expanded(
                //         child: Container(
                //           child: Userlist(),
                //         ),
                //       ),
                //       Container(
                //         child: Ink(
                //           decoration: const ShapeDecoration(
                //             color: Colors.lightBlue,
                //             shape: CircleBorder(),
                //           ),
                //           child: IconButton(
                //               icon: Icon(Icons.add_shopping_cart),
                //               color: Colors.white,
                //               onPressed: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => Addproduct()));
                //               }),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Userlist(),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
// import 'package:supplychaintracker/models/Userdetailes.dart';

class Userlist extends StatefulWidget {
  @override
  _UserlistState createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Userdetailes>>(context);
    if (users == null) {
      return Loading();
    }
    return Container(
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(users.length, (index) {
              return UserTile(user: users[index]);
            })));
    // return ListView.builder(
    //   itemCount: users.length,
    //   itemBuilder: (context, index) {
    //     return UserTile(user: users[index]);
    //   },
    // );
  }
}
