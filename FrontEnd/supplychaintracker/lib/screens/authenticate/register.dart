import 'package:flutter/material.dart';
import 'package:supplychaintracker/screens/authenticate/animation/FadeAnimation.dart';
import 'package:supplychaintracker/services/auth.dart';
// import 'package:supplychaintracker/shared/constants.dart';
import 'package:supplychaintracker/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _validateKey = GlobalKey<FormState>();
  //text field values
  String email = '';
  String name = '';
  String pwd = '';
  String error = '';
  String city = "";
  String role = "";
  String phn = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Form(
                    key: _validateKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // FadeAnimation(
                        //   1.2,
                        //   Container(
                        //     width: 150,
                        //     height: 150,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       image: DecorationImage(
                        //           image: AssetImage('assets/illustration.png'),
                        //           fit: BoxFit.fill),
                        //     ),
                        //   ),
                        // ),
                        Column(
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            FadeAnimation(
                                1.2,
                                Text(
                                  "Create an account",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[700]),
                                )),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            FadeAnimation(1.2, makeInputname(label: "Name")),
                            FadeAnimation(1.2, makeInputemail(label: "Email")),
                            FadeAnimation(1.3, makeInputpwd(label: "Password")),
                            FadeAnimation(1.3, makeInputphn(label: "Phone no")),
                            FadeAnimation(1.4, makeInputrole(label: "Role")),
                            FadeAnimation(1.4, makeInputcity(label: "City")),
                          ],
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
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () async {
                                  print(email + ' ' + pwd);
                                  if (_validateKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
                                            name, email, pwd, role, city, phn);
                                    if (result == null) {
                                      setState(() {
                                        error = 'Please enter a valid email ID';
                                        loading = false;
                                      });
                                    }
                                  }
                                },
                                color: Colors.greenAccent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            )),
                        FadeAnimation(
                            1.6,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Text("Already have an account?"),
                                FlatButton(
                                  onPressed: () {
                                    /*...*/
                                    widget.toggleView();
                                  },
                                  child: Text(
                                    "Already have an account? Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget makeInputname({label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter a name' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => name = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputphn({label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter your phone no' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => phn = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputcity({label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter your city' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => city = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputrole({label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter your role' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => role = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputemail({label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter an email' : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          onChanged: (val) {
            setState(() => email = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInputpwd({label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (val) => (val.length < 8 || val.length > 15)
              ? 'Password length is 8-15'
              : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
          obscureText: true,
          onChanged: (val) {
            setState(() => pwd = val);
          },
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
