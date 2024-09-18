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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF4E2EB5),
        elevation: 0,
        centerTitle: true,
        title: Text('Rate', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/send.png"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ProjectName', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Text('Rate this project on a scale from 1 (poor) to 10 (excellent).', style: TextStyle(color: Colors.grey, fontSize: 22)),
              SizedBox(height: 10),

              // Sliders
              SliderSection(
                label: 'Idea',
                value: ideaRating,
                imagePath: 'assets/idea.png',
                onChanged: (newValue) {
                  setState(() {
                    ideaRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Design',
                value: designRating,
                imagePath: 'assets/design.png',
                onChanged: (newValue) {
                  setState(() {
                    designRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Tools',
                value: toolsRating,
                imagePath: 'assets/tools.png',
                onChanged: (newValue) {
                  setState(() {
                    toolsRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Practices',
                value: practicesRating,
                imagePath: 'assets/medal.png',
                onChanged: (newValue) {
                  setState(() {
                    practicesRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Presentation',
                value: presentationRating,
                imagePath: 'assets/presentation.png',
                onChanged: (newValue) {
                  setState(() {
                    presentationRating = newValue;
                  });
                },
              ),
              SliderSection(
                label: 'Investment',
                value: investmentRating,
                imagePath: 'assets/invest.png',
                onChanged: (newValue) {
                  setState(() {
                    investmentRating = newValue;
                  });
                },
              ),

              SizedBox(height: 10), 
              NotesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
