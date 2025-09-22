import 'package:fit_fusion/features/exercise/data/models/exercise_model.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final String type = exercise.type!.contains("_")
        ? exercise.type!.split("_")[1]
        : exercise.type!;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
      child: ExpansionTile(
        title: Align(
          alignment: Alignment.topLeft,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              exercise.name!,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.fitness_center, size: 18, color: Colors.blueGrey),
            const SizedBox(width: 6),
            Text(
              type,
              style: TextStyle(color: Colors.grey[700]),
              overflow: TextOverflow.visible,
            ),
            const Spacer(),
            const Icon(Icons.accessibility_new, size: 18, color: Colors.green),
            const SizedBox(width: 6),
            Text(exercise.muscle!, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
        childrenPadding: const EdgeInsets.all(12),
        children: [
          Row(
            children: [
              const Icon(Icons.speed, size: 18, color: Colors.orange),
              const SizedBox(width: 6),
              Text(
                exercise.difficulty!,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            exercise.instructions!,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
