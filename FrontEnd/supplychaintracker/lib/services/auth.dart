import 'package:firebase_auth/firebase_auth.dart';
import 'package:supplychaintracker/models/user.dart';
import 'package:supplychaintracker/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create custom user object

  UserValue _userFromUser(User user) {
    return user != null ? UserValue(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserValue> get user {
    return _auth.authStateChanges().map(_userFromUser);
  }

  // Sign in anon
  Future signinAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sigin in with email & password
  Future signInWithEmailAndPassword(String email, String pwd) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      User user = result.user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(
      String userName, String email, String pwd) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserAccount(userName, email);
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
