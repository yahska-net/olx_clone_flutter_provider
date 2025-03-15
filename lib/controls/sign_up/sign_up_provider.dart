import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String email = "";
  String password = "";

  bool validateForm(FormState? formKey) {
    if (formKey!.validate()) {
      formKey.save();
      return true;
    }
    return false;
  }

  void setEmail(String val) {
    email = val;
    notifyListeners();
  }

  void setPassword(String val) {
    password = val;
    notifyListeners();
  }
}
