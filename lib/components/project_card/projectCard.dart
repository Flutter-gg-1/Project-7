import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_judge/models/project_info_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectsInfo project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageHeight = screenHeight * 0.12;
    final cardHeight = screenHeight * 0.12;
    final padding = screenWidth * 0.02;
    final titleFontSize = screenWidth * 0.03;
    final descriptionFontSize = screenWidth * 0.04;
    final ratingItemSize = screenWidth * 0.04;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: imageHeight,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: const Color(0x004e2eb5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.projectName ?? 'Project Name',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFC4C4C4),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        project.projectDescription ?? 'Project Description',
                        style: TextStyle(
                          color: const Color(0xFF4E2EB5),
                          fontSize: descriptionFontSize,
                        ),
                      ),
                      const SizedBox(height: 2),
                      RatingBar.builder(
                        itemSize: ratingItemSize,
                        initialRating: project.rating?.toDouble() ?? 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${project.type}",
                        style: const TextStyle(
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
