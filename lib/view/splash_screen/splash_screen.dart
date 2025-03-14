import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olx/view/core/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, "/");
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeApp(context);
    return Scaffold(
      backgroundColor: AppColors.greenDark,
      body: Center(child: SvgPicture.asset("lib/assets/logos/OLX_new.svg")),
    );
  }
}
