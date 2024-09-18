
import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/bottomNavBar.dart';
import 'package:project_judge/screens/browse_page/browsePage.dart';
import 'package:project_judge/screens/myproject_page/myProjectsPage.dart';

class NavigationPage extends StatefulWidget {
  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    Center(child: Text("Home Page")),
    BrowsePage(),
    Center(child: Text("Middle Page")),
  MyProjectsScreen(),
    Center(child: Text("Profile Page")),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onMiddleButtonTapped() {
    setState(() {
      selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
        onMiddleButtonTapped: onMiddleButtonTapped,
      ),
    );
  }
}
