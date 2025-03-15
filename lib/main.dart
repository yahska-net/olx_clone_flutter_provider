import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:olx/controls/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:olx/controls/sign_up/sign_up_provider.dart';
import 'package:olx/firebase_options.dart';
import 'package:olx/view/add_post/add_post.dart';
import 'package:olx/view/core/colors.dart';
import 'package:olx/view/login/login_screen.dart';
import 'package:olx/view/main_screen/main_screen.dart';
import 'package:olx/view/sign_up/sign_up_screen.dart';
import 'package:olx/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OLX Clone',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: AppColors.greenDark),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.greenDark),
        ),
        initialRoute: "/splash",
        routes: {
          "/": (context) => MainScreen(),
          "/splash": (context) => SplashScreen(),
          "/login": (context) => LoginScreen(),
          "/sign_up": (context) => SignUpScreen(),
          "/add": (context) => AddPost(),
        },
      ),
    );
  }
}
