
import 'package:flutter/material.dart';
import 'package:project_judge/components/buttons/bottomNavBar.dart';
import 'package:project_judge/screens/browse_page/browsePage.dart';
import 'package:project_judge/screens/myproject/myProjectsPage.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Home Page")),
    BrowsePage(),
    Center(child: Text("Middle Page")),
  MyProjectsScreen(),
    Center(child: Text("Profile Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onMiddleButtonTapped() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        onMiddleButtonTapped: _onMiddleButtonTapped,
      ),
    );
  }
}
