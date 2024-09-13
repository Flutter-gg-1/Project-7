import 'package:flutter/material.dart';
import 'custom_evaluation_slider.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rating'),
          actions: [TextButton(onPressed: () {}, child: const Text('Send'))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                    ),
                    Container(
                      height: 88,
                      width: 178,
                      color: const Color(0xffD9D4F1).withOpacity(0.6),
                      child: Text('Project Details'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomEvaluationSlider(label: 'Idea',),
                const SizedBox(
                  height: 30,
                ),
                const CustomEvaluationSlider(label: 'Design',),
                const SizedBox(
                  height: 30,
                ),
                const CustomEvaluationSlider(label: 'Tools',),
                const SizedBox(
                  height: 30,
                ),
                const CustomEvaluationSlider(label: 'Presentation',),
                const SizedBox(
                  height: 30,
                ),
                const CustomEvaluationSlider(label: 'Investment',),
                const SizedBox(
                  height: 30,
                ),
          
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Comment', style:TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                      height: 115,
                      width: 307,
                      color: const Color(0xffD9D4F1).withOpacity(0.6),
                      child: TextField(),
                    )
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
