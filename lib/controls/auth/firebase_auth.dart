import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // usr details
  User? _user;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;
  String? get userEmail => _user?.email;

  // auth check
  bool get isLoggedIn => _user != null;

  //logout

  Future<void> logout(BuildContext context) async {
    await _firebaseAuth.signOut();
    notifyListeners();

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }
}
