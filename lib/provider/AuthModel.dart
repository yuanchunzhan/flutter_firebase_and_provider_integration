import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  User? _user = FirebaseAuth.instance.currentUser;

  bool get isSignIn => _user != null;

  User? get user => _user;

  Future signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    _user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future signUp(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    _user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    _user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
}
