import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  bool _isLoading = false;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  User? get user => _user;
  String? get userEmail => _user?.email;
  bool get isLoggedIn => _user != null;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //Login
  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      setLoading(true);
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, "/");
      }
    } on FirebaseAuthException catch (e) {
      _showErrorToast(e);
    } finally {
      setLoading(false);
    }
  }

  // Sign Up
  Future<void> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      setLoading(true);
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, "/");
      }
    } on FirebaseAuthException catch (e) {
      _showErrorToast(e);
    } finally {
      setLoading(false);
    }
  }

  // Logout
  Future<void> logout(BuildContext context) async {
    await _firebaseAuth.signOut();
    notifyListeners();

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  //  Errora
  void _showErrorToast(FirebaseAuthException e) {
    String message = "Something went wrong.";
    if (e.code == 'email-already-in-use') {
      message = "An account already exists with this email.";
    } else if (e.code == 'weak-password') {
      message = "Password should be at least 6 characters.";
    } else if (e.code == 'wrong-password') {
      message = "Incorrect password.";
    } else if (e.code == 'user-not-found') {
      message = "No user found with this email.";
    }

    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
