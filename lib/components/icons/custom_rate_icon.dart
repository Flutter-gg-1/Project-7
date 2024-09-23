import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget starRating(double rating) {
  int fullStars = rating.floor();
  int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
  int emptyStars = 5 - (fullStars + halfStars);

  List<Widget> stars = [];

  for (int i = 0; i < fullStars; i++) {
    stars.add(const Icon(Icons.star, color: Colors.yellow));
  }

  for (int i = 0; i < halfStars; i++) {
    stars.add(const Icon(Icons.star_half, color: Colors.yellow));
  }

  for (int i = 0; i < emptyStars; i++) {
    stars.add(const Icon(Icons.star_outline, color: Colors.grey));
  }

  return Row(children: stars);
}