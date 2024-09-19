import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final TabController tabController;

  const TabBarWidget({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      controller: tabController,
      isScrollable: true,
      indicator:
<<<<<<< HEAD
          const BoxDecoration(),
      unselectedLabelColor: const Color(0x99FFFFFF),
=======
          BoxDecoration(), 
      unselectedLabelColor: Color(0x99FFFFFF),
>>>>>>> origin/noufAlqahtani
      labelColor: Colors.white,
      tabs: [
        buildFloatingTab('Flutter', 0),
        buildFloatingTab('Java', 1),
        buildFloatingTab('Python', 2),
        buildFloatingTab('UI/UX', 3),
      ],
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: EdgeInsets.zero, 
    );
  }

  Widget buildFloatingTab(String text, int index) {
    return Tab(
      
      child: AnimatedBuilder(
        animation: tabController,
        builder: (context, child) {
          final isSelected = tabController.index == index;
          return Container(
            width: 102,
            height: 33,
            margin: const EdgeInsets.symmetric(
                horizontal: 4), 
            padding: EdgeInsets.zero, 
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF5CE3D9) : const Color(0x99FFFFFF),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4E2EB5),
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
