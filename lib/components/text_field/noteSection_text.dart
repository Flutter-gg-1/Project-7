
import 'package:flutter/material.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset('assets/images/note.png'),
              const SizedBox(width: 12),
              const Text("Note", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child:  TextField(controller: controller,
            decoration: const InputDecoration(
              hintText: 'Add any additional notes',
              border: InputBorder.none,
            ),
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
