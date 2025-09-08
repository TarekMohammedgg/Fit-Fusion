import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image(fit: BoxFit.cover, image: AssetImage(image)),
    );
  }
}
