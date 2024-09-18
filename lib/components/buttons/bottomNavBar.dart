
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final VoidCallback onMiddleButtonTapped;

  const BottomNavBar({super.key, 
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onMiddleButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: selectedIndex,
              onTap: onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                buildBottomNavBarItem('assets/images/Call.png', 'Home', 0),
                buildBottomNavBarItem('assets/images/browse.png', 'Browse', 1),
                const BottomNavigationBarItem(
                  icon: SizedBox.shrink(), 
                  label: '',
                ),
                buildBottomNavBarItem('assets/images/projects.png', 'My Projects', 3),
                buildBottomNavBarItem('assets/images/profile.png', 'Profile', 4),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: MediaQuery.of(context).size.width / 2 - 35,
          child: GestureDetector(
            onTap: onMiddleButtonTapped,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/FAB.png',
                  fit: BoxFit.cover,
                  width: 48,
                  height: 48,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem(
      String assetPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Image.asset(
            assetPath,
            width: 24,
            height: 24,
            color:
                selectedIndex == index ? const Color(0xFF4E2EB5) : const Color(0xFF848484),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selectedIndex == index
                  ? const Color(0xFF4E2EB5)
                  : const Color(0xFF848484),
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}
