// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:supplychaintracker/models/Userdetailes.dart';
import 'package:supplychaintracker/services/auth.dart';

class Display extends StatelessWidget {
  final AuthService _auth = AuthService();
  final Userdetailes user;
  Display({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text('Supply Chain Tracker'),
        backgroundColor: Colors.white,
        elevation: 0.2,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign Out'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: FlatButton(
        onPressed: () {},
        child: Container(
          height: 450.0,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text('Product Details',
                    style: TextStyle(fontSize: 25, color: Colors.black)),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://images.unsplash.com/photo-1567306226416-28f0efdc88ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMjA3fDB8MXxhbGx8fHx8fHx8fA&ixlib=rb-1.2.1&q=80&w=1080'),
                        fit: BoxFit.fill),
                  ),
                ),
                ListTile(
                  // leading: Icon(Icons.thumb_up),
                  title: Text('Name: ${user.pname}'),
                  subtitle: Text(
                    'Quality: ${user.qual}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ListTile(
                  // leading: Icon(Icons.thumb_up),
                  title: Text('Description: ${user.pdesc}'),
                  subtitle: Text(
                    'Quality: ${user.qual}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(19.0),
                //   child: Text(
                //     'Description: ${user.pdesc}',
                //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text(
                //     'Quantity: ${user.quan}',
                //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
