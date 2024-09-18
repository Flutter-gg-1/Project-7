
import 'package:flutter/material.dart';
import 'package:project_judge/components/tab_bar/Closed_tab_bar.dart';
import 'package:project_judge/components/tab_bar/Opened_tab_bar.dart';

class MyProjectsScreen extends StatefulWidget {
  @override
  MyProjectsScreenState createState() => MyProjectsScreenState();
}

class MyProjectsScreenState extends State<MyProjectsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4E2EB5),
      appBar: AppBar(
        backgroundColor: Color(0xFF4E2EB5),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Projects',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          indicatorWeight: 8.0,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: tabController,
          indicatorColor: Colors.cyan,
          labelColor: Colors.cyan,
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.cyan,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 20,
          ),
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Open'),
            Tab(text: 'Closed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: MyProjectCardOpened(),
                );
              }),
          ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: MyProjectCardClosed(),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
        shape: CircleBorder(),
        heroTag: 'unique_tag',
      ),
    );
  }
}
