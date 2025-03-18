import 'package:flutter/material.dart';
import 'package:olx/controller/auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("My Account")),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(radius: 40, backgroundColor: Colors.black),
                  Text("Welcome \n${authProvider.userEmail ?? 'Guest'}"),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    authProvider.logout(context);
                  },
                  child: Text("Log Out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
