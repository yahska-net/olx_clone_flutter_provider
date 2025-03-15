import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String email = "";
  String pass = "";

  bool validateLoginForm(FormState? loginFormKey) {
    if (loginFormKey!.validate()) {
      loginFormKey.save();
      return true;
    }
    return false;
  }

  void setEmail(String val) {
    email = val;
    notifyListeners();
  }

  void setPass(String val) {
    pass = val;
    notifyListeners();
  }
}
