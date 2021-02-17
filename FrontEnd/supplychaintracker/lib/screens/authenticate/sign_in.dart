import 'package:flutter/material.dart';
import 'package:supplychaintracker/screens/authenticate/authenticate.dart';
import 'package:supplychaintracker/services/auth.dart';
import 'package:supplychaintracker/shared/constants.dart';
import 'package:supplychaintracker/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _validateKey = GlobalKey<FormState>();
  bool loading = false;
  //text field values
  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.indigoAccent[90],
              elevation: 0.2,
              title: Text('Sign in '),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    widget.toggleView();
                  },
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              child: Form(
                key: _validateKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textField.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textField.copyWith(hintText: 'Password'),
                      validator: (val) => (val.length < 8 || val.length > 15)
                          ? 'Password length is 8-15'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => pwd = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        // print(email + ' ' + pwd);
                        if (_validateKey.currentState.validate()) {
                          //print('valid');
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, pwd);
                          if (result == null) {
                            //print('hello');
                            setState(() {
                              error = 'Email or Password is incorrect!';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
