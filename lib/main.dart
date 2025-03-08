import 'package:flutter/material.dart';
import 'package:olx/view/core/colors.dart';
import 'package:olx/view/home/home_screen.dart';
import 'package:olx/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OLX Clone',
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle(color: AppColors.greenDark)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greenDark),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/splash": (context) => SplashScreen(),
      },
    );
  }
}
