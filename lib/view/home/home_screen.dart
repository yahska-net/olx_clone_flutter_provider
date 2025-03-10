import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olx/controls/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:provider/provider.dart';
import 'package:olx/view/home/widgets/browse_categories.dart';
import 'package:olx/view/home/widgets/recomendations.dart';
import 'package:olx/view/home/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _screens = [
    HomeContentScreen(),
    Center(child: Text("Chats")),
    Center(child: Text("Sell")),
    Center(child: Text("My Ads")),
    Center(child: Text("Account")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SvgPicture.asset("lib/assets/logos/download.svg"),
        ),
        actions: [
          Icon(Icons.pin_drop_outlined),
          Text("Palakkad", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 15),
        ],
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return _screens[provider.selectedIndex];
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

// Extracted Home Content
class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBarWidget(),
          BrowseCategoriesWidget(),
          SizedBox(height: 10),
          FreshRecomendations(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
