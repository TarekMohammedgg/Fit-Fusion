import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        image,
        width: 200, // set custom width
        height: 200, // set custom height
        fit: BoxFit.cover, // adjust how the image fits
      ),
    );
  }
}
