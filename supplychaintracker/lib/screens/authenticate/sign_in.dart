import 'package:flutter/material.dart';
import 'package:supplychaintracker/screens/authenticate/animation/FadeAnimation.dart';
// import 'package:supplychaintracker/screens/authenticate/authenticate.dart';
import 'package:supplychaintracker/services/auth.dart';
// import 'package:supplychaintracker/shared/constants.dart';
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
                  Icons.arrow_forward_ios,
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
                child: Form(
                  key: _validateKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FadeAnimation(
                        1.2,
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/illustration.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          FadeAnimation(
                              1,
                              Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              1.2,
                              Text(
                                "Join us! make a difference",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[700]),
                              )),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          FadeAnimation(1.2, makeInputemail(label: "Email")),
                          FadeAnimation(1.3, makeInputpwd(label: "Password")),
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
                              color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                          )),
                      FadeAnimation(
                          1.6,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  widget.toggleView();
                                },
                                child: Text(
                                  "No account yet? SignUp",
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
