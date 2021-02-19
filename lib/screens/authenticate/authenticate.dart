import 'package:flutter/material.dart';
import 'package:supplychaintracker/screens/authenticate/register.dart';
import 'package:supplychaintracker/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool shownSignIn = true;
  void toggleView() {
    setState(() => shownSignIn = !shownSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (shownSignIn == true)
      return SignIn(toggleView: toggleView);
    else
      return Register(toggleView: toggleView);
  }
}
