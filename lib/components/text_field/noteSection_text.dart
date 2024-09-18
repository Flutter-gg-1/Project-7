
import 'package:flutter/material.dart';

class NotesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset('assets/note.png'),
              SizedBox(width: 12),
              Text("Note", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: InputDecoration(
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
