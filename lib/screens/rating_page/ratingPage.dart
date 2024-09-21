import 'package:flutter/material.dart';
import 'package:project_judge/components/slider_section/sliderSection.dart';
import 'package:project_judge/components/text_field/noteSection_text.dart';

class RatingPage extends StatefulWidget {
  @override
  RatingPageState createState() => RatingPageState();
}

class RatingPageState extends State<RatingPage> {
  double ideaRating = 5;
  double designRating = 8;
  double toolsRating = 6;
  double practicesRating = 6;
  double presentationRating = 8;
  double investmentRating = 1;
  double noteRating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF4E2EB5),
        elevation: 0,
        centerTitle: true,
        title: const Text('Rate', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/send.png"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ProjectName', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text('Rate this project on a scale from 1 (poor) to 10 (excellent).', style: TextStyle(color: Colors.grey, fontSize: 22)),
              const SizedBox(height: 10),

              // Sliders
              SliderSection(
                label: 'Idea',
                value: ideaRating,
                imagePath: 'assets/images/idea.png',
                onChanged: (newValue) {
                  setState(() {
                    ideaRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Design',
                value: designRating,
                imagePath: 'assets/images/design.png',
                onChanged: (newValue) {
                  setState(() {
                    designRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Tools',
                value: toolsRating,
                imagePath: 'assets/images/tools.png',
                onChanged: (newValue) {
                  setState(() {
                    toolsRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Practices',
                value: practicesRating,
                imagePath: 'assets/images/medal.png',
                onChanged: (newValue) {
                  setState(() {
                    practicesRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Presentation',
                value: presentationRating,
                imagePath: 'assets/images/presentation.png',
                onChanged: (newValue) {
                  setState(() {
                    presentationRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Investment',
                value: investmentRating,
                imagePath: 'assets/images/invest.png',
                onChanged: (newValue) {
                  setState(() {
                    investmentRating = newValue;
                  });
                },
              ),

              const SizedBox(height: 10), 
              NotesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
