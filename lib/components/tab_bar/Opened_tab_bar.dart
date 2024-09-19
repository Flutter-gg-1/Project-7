
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_judge/models/project_model.dart';

class MyProjectCardOpened extends StatelessWidget {
<<<<<<< HEAD
  const MyProjectCardOpened({super.key});
=======
  final Project project;

  MyProjectCardOpened({required this.project});
>>>>>>> origin/noufAlqahtani

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        height: 115,
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 117.79,
                height: 94,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: const Color(0x004e2eb5),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Image.asset(
<<<<<<< HEAD
                      'assets/images/logo.png',
=======
                      'assets/images/logo.png', 
>>>>>>> origin/noufAlqahtani
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
<<<<<<< HEAD
                      const Text(
                        'Flutter Bootcamp',
=======
                      Text(
                        project.title,
>>>>>>> origin/noufAlqahtani
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
<<<<<<< HEAD
                      const SizedBox(height: 2),
                      const Text(
                        'Lorem ipsum sfgl...',
=======
                      SizedBox(height: 2),
                      Text(
                        project.description,
>>>>>>> origin/noufAlqahtani
                        style: TextStyle(
                          color: Color(0xFF4E2EB5),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      RatingBar.builder(
                        itemSize: 16,
                        initialRating: project.rating,
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
<<<<<<< HEAD
                      const Text(
                        'App',
=======
                      Text(
                        'App', 
>>>>>>> origin/noufAlqahtani
                        style: TextStyle(
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
<<<<<<< HEAD
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFF4E2EB5),
                      )))
=======
                child: IconButton(
                  onPressed: () {
                
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Color(0xFF4E2EB5),
                  ),
                ),
              ),
>>>>>>> origin/noufAlqahtani
            ],
          ),
        ),
      ),
    );
  }
}
