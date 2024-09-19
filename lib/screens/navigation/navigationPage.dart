import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/bottomNavBar.dart';
import 'package:project_judge/screens/browse_page/browsePage.dart';
import 'package:project_judge/screens/home_screen/home_screen.dart';
import 'package:project_judge/screens/myproject_page/myProjectsPage.dart';
import 'package:project_judge/screens/profile_screen/profile_screen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const BrowsePage(),
    const Center(child:  Text("Middle Page")),
    const MyProjectsScreen(),
    ProfileScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onMiddleButtonTapped() {
    setState(() {
      selectedIndex = 0;
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
