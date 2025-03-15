import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:olx/controls/login/login_provider.dart';
import 'package:olx/view/core/colors.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset("lib/assets/logos/download.svg"),
              ),
              Expanded(
                child: Container(
                  color: AppColors.greenDark,
                  padding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator:
                              (value) => value!.isEmpty ? "Enter Email" : null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "Email",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          controller: _passController,
                          validator:
                              (value) =>
                                  value!.isEmpty ? "Enter Password" : null,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_outlined),
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              String message = "";
                              if (loginProvider.validateLoginForm(
                                loginFormKey.currentState,
                              )) {
                                try {
                                  await _firebaseAuth
                                      .signInWithEmailAndPassword(
                                        email: _emailController.text.trim(),
                                        password: _passController.text.trim(),
                                      );
                                  if (context.mounted) {
                                    Navigator.pushNamed(context, "/");
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
                                    message = 'Invalid login credentials.';
                                  } else {
                                    message = e.code;
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
                                }
                              }
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/sign_up");
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.greenAccent.withAlpha(100),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
