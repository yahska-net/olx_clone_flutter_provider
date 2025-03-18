import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:olx/view/screens/home/widgets/browse_categories.dart';
import 'package:olx/view/screens/home/widgets/recomendations.dart';
import 'package:olx/view/screens/home/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            BrowseCategoriesWidget(),
            SizedBox(height: 10),
            FreshRecomendations(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
