
import 'package:flutter/material.dart';
import 'package:project_judge/components/project_card/projectCard.dart';
import 'package:project_judge/components/tab_bar/tab_bar_browse.dart';
import 'package:project_judge/components/text_field/custom_text_form_field.dart';
import 'package:project_judge/screens/rating_page/ratingPage.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  BrowsePageState createState() => BrowsePageState();
}

class BrowsePageState extends State<BrowsePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4E2EB5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E2EB5),
        title: const Text(
          "Browse",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              const CustomTextFormField(hintText: "search", icon: Icons.search),
              
              TabBarWidget(tabController: tabController),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildListView(),
          buildListView(),
          buildListView(),
          buildListView(),
        ],
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RatingPage()),
              );
            },
            child: ProjectCard());
      },
    );
  }
}
