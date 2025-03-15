import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, "/");
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeApp(context);
    return Scaffold(
      backgroundColor: Color(0xFF33fad9),
      body: Center(
        child: Image(
          image: AssetImage("lib/assets/logos/OLX anime.gif"),
          width: 180,
          height: 180,
          fit: BoxFit.contain,
          colorBlendMode: BlendMode.color,
        ),
      ),
    );
  }
}
