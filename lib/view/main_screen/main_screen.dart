import 'package:flutter/material.dart';
import 'package:olx/controls/auth/firebase_auth.dart';
import 'package:olx/controls/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:olx/view/account/account_screen.dart';
import 'package:olx/view/add_post/add_post.dart';
import 'package:olx/view/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:olx/view/home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final List<Widget> screens = [
      HomeScreen(),
      Center(child: Text("Chats")),
      AddPost(),
      Center(child: Text("My Ads")),
      authProvider.isLoggedIn ? AccountScreen() : LoginScreen(),
    ];
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return screens[provider.selectedIndex];
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.selectedIndex,
            onTap: provider.changeIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                label: "Chats",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: "Sell",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: "My Ads",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account",
              ),
            ],
          );
        },
      ),
    );
  }
}
