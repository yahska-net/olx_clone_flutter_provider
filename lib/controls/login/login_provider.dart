import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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

      // ✅ Navigate to Home Screen after login
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, "/");
      }
    } on FirebaseAuthException catch (e) {
      String message = "Login failed. Please try again.";

      if (e.code == 'user-not-found') {
        message = 'No user found with this email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      }

      if (context.mounted) {
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 14.0,
        );
      }
    } finally {
      setLoading(false);
    }
  }
}
