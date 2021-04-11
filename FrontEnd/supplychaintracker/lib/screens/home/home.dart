import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:supplychaintracker/screens/Viewproducts.dart';
import 'package:supplychaintracker/screens/myProduct.dart';
import 'package:supplychaintracker/services/auth.dart';
// import 'package:supplychaintracker/screens/navigation/transaction.dart';
import 'package:supplychaintracker/screens/addproduct.dart';
import 'package:provider/provider.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/screens/home/usertile.dart';
import 'package:supplychaintracker/services/database.dart';
import 'package:supplychaintracker/shared/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String ustype;

  void sinitState(String userDeets) async {
    final utype = await DatabaseService().getUserType(userDeets);
    ustype = utype.toString();
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    String userDeets = _auth.userDetails();
    sinitState(userDeets);
    Future.delayed(Duration(seconds: 5));
    return StreamProvider<List<Userdetailes>>.value(
      value: DatabaseService().displayproduct,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'froute',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Pompiere",
                fontSize: 25,
                letterSpacing: 2,
                fontWeight: FontWeight.w800),
          ),
          backgroundColor: Color(0xFFddffc8),
          elevation: 1.0,
        ),
        drawer: Drawer(
            child: ColoredBox(
          color: Color(0xFFddffc8),
          child: ListView(
            children: <Widget>[
              Container(
                height: 70,
                child: DrawerHeader(
                    padding: EdgeInsets.fromLTRB(30.0, 16.0, 16.0, 8.0),
                    child: Text(
                      'froute',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Pompiere",
                          fontSize: 30,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w800),
                    )),
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
              // if (ustype == "Farmer")
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
                        "Add Product",
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      )),
                ),
                onTap: () {
                  Navigator.of(context).pop();

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
                        "View all Products",
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      )),
                ),
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewProducts()));
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
                        "My Products",
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      )),
                ),
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProduct()));
                },
              ),
              // ListTile(
              //   title: Align(
              //     alignment: Alignment.centerLeft,
              //     child: FlatButton.icon(
              //         onPressed: null,
              //         icon: Icon(
              //           Icons.access_time_sharp,
              //           color: Colors.grey[700],
              //           size: 40.0,
              //         ),
              //         label: Text(
              //           "History",
              //           style: TextStyle(fontSize: 15.0, color: Colors.black),
              //         )),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).pop();
              //     Navigator.push(
              //         context,
              //         new MaterialPageRoute(
              //             builder: (context) => TransactionDis()));
              //   },
              // ),
              SizedBox(
                height: 300.0,
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
        )),
        body: (userDeets == null)
            ? Loading()
            : SingleChildScrollView(
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
                                    colorFilter:
                                        ColorFilter.linearToSrgbGamma(),
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
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 4),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // if (userDeets == null) ...[Loading()],
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("accountDetail")
                                  .doc(userDeets)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Center(child: Loading());
                                return Card(
                                  elevation: 0.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5 -
                                                4,
                                            padding: EdgeInsets.all(20),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
                                              radius: 65,
                                            ),
                                          ),
                                          Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 10, 0),
                                              // color: Colors.yellow,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5 -
                                                  4,
                                              child: SizedBox(
                                                child: SizedBox(
                                                  child: Text(
                                                    snapshot.data['userName'],
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
                                          Text("CITY : "),
                                          Text(snapshot.data['city'])
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text("CONTACT : "),
                                          Text(snapshot.data['phn'])
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text("ROLE : "),
                                          Text(snapshot.data['role'])
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ]),
              ),
      ),
    );
  }
}

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
  }
}
