import 'package:flutter/material.dart';
import 'package:olx/controller/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
        );
      },
    );
  }
}
