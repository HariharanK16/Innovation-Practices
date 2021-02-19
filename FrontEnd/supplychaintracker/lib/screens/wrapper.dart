import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supplychaintracker/models/user.dart';
import 'package:supplychaintracker/screens/authenticate/authenticate.dart';
import 'package:supplychaintracker/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserValue>(context);
    print(user);
    if (user == null)
      return Authenticate();
    else
      return Home();
  }
}
