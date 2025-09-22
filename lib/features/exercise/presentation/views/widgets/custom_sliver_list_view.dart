import 'package:fit_fusion/features/exercise/data/models/exercise_model.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_card.dart';
import 'package:fit_fusion/features/home/presentation/view_models/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSliverListView extends ConsumerWidget {
  const CustomSliverListView({super.key, required this.filters});

  final Set<String> filters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (filters.contains(Muscle.all.name) && filters.length == 1) {
      final exercises = ref.watch(musclesProvider(null));
      return _buildExercises(exercises);
    }

    final providers = filters
        .map((muscle) => ref.watch(musclesProvider(muscle)))
        .toList();

    if (providers.any((p) => p.isLoading)) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final error = providers.where((p) => p.hasError).firstOrNull;
    if (error != null) {
      return SliverToBoxAdapter(
        child: Center(child: Text("Error: ${error.error}")),
      );
    }
    final items = providers
        .where((p) => p.hasValue)
        .expand((p) => p.value!)
        .toList();

    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final exercise = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: ExerciseCard(exercise: exercise),
        );
      },
    );
  }

  Widget _buildExercises(AsyncValue<List<ExerciseModel>> exercises) {
    return exercises.when(
      data: (items) => SliverList.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final exercise = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: ExerciseCard(exercise: exercise),
          );
        },
      ),
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) =>
          SliverToBoxAdapter(child: Center(child: Text("Error: $err"))),
    );
  }
}
