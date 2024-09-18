import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/components/slider_section/sliderSection.dart';
import 'package:project_judge/components/text_field/noteSection_text.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_rating_bloc.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_rating_event.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_rating_state.dart';


class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF4E2EB5),
        elevation: 0,
        centerTitle: true,
        title: Text('Rate', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/send.png"),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => RatingBloc(),
        child: BlocBuilder<RatingBloc, RatingState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ProjectName',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    Text(
                        'Rate this project on a scale from 1 (poor) to 10 (excellent).',
                        style: TextStyle(color: Colors.grey, fontSize: 22)),
                    SizedBox(height: 10),

                    // Idea Slider
                    SliderSection(
                      label: 'Idea',
                      value: state.ideaRating,
                      imagePath: 'assets/images/idea.png',
                      onChanged: (newValue) {
                        context.read<RatingBloc>().add(UpdateRating(
                              category: 'Idea',
                              value: newValue,
                            ));
                      },
                    ),

                    // Design Slider
                    SliderSection(
                      label: 'Design',
                      value: state.designRating,
                      imagePath: 'assets/images/design.png',
                      onChanged: (newValue) {
                        context.read<RatingBloc>().add(UpdateRating(
                              category: 'Design',
                              value: newValue,
                            ));
                      },
                    ),

                    // Tools Slider
                    SliderSection(
                      label: 'Tools',
                      value: state.toolsRating,
                      imagePath: 'assets/images/tools.png',
                      onChanged: (newValue) {
                        context.read<RatingBloc>().add(UpdateRating(
                              category: 'Tools',
                              value: newValue,
                            ));
                      },
                    ),

                    // Practices Slider
                    SliderSection(
                      label: 'Practices',
                      value: state.practicesRating,
                      imagePath: 'assets/images/medal.png',
                      onChanged: (newValue) {
                        context.read<RatingBloc>().add(UpdateRating(
                              category: 'Practices',
                              value: newValue,
                            ));
                      },
                    ),

                    // Presentation Slider
                    SliderSection(
                      label: 'Presentation',
                      value: state.presentationRating,
                      imagePath: 'assets/images/presentation.png',
                      onChanged: (newValue) {
                        context.read<RatingBloc>().add(UpdateRating(
                              category: 'Presentation',
                              value: newValue,
                            ));
                      },
                    ),

                    // Investment Slider
                    SliderSection(
                      label: 'Investment',
                      value: state.investmentRating,
                      imagePath: 'assets/images/invest.png',
                      onChanged: (newValue) {
                        context.read<RatingBloc>().add(UpdateRating(
                              category: 'Investment',
                              value: newValue,
                            ));
                      },
                    ),

                    NotesSection(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
