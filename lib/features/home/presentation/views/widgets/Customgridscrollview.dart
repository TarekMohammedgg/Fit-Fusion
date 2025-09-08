import 'package:fit_fusion/core/utils/assets.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/exercise_card.dart';
import 'package:fit_fusion/features/home/presentation/views/widgets/exercise_model.dart';
import 'package:flutter/material.dart';

class CustomSliverGridView extends StatefulWidget {
  CustomSliverGridView({super.key, required this.filters});

  final Set<String> filters;

  @override
  State<CustomSliverGridView> createState() => _CustomSliverGridViewState();
}

class _CustomSliverGridViewState extends State<CustomSliverGridView> {
  final List<ExerciseModel> items = [
    ExerciseModel(
      image: Assets.imagesExercisesGraphicsBiecps,
      name: 'Biceps',
      category: ExercisFilter.Pull.name,
    ),
    ExerciseModel(
      image: Assets.imagesExercisesGraphicsChest,
      name: 'Chest',
      category: ExercisFilter.Push.name,
    ),
    ExerciseModel(
      image: Assets.imagesExercisesGraphicsTriceps,
      name: 'Triceps',
      category: ExercisFilter.Push.name,
    ),
    ExerciseModel(
      image: Assets.imagesExercisesGraphicsBack,
      name: 'Back',
      category: ExercisFilter.Pull.name,
    ),
    ExerciseModel(
      image: Assets.imagesExercisesGraphicsCardio,
      name: 'Cardio',
      category: ExercisFilter.Legs.name,
    ),
    ExerciseModel(
      image: Assets.imagesExercisesGraphicsShoulders,
      name: 'Shoulders',
      category: ExercisFilter.Push.name,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        widget.filters.contains(ExercisFilter.All.name) &&
            widget.filters.length == 1
        ? items
        : items.where((e) => widget.filters.contains(e.category)).toList();

    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Color(0xff973ec2), width: 2),
          ),
          color: const Color(0xff242424),
          child: ExerciseCard(image: filteredItems[index].image),
        ),
        childCount: filteredItems.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 150,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }
}
