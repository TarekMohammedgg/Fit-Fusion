import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_card.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_model.dart';
import 'package:fit_fusion/features/home/presentation/view_models/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSliverGridView extends ConsumerWidget {
  const CustomSliverGridView({super.key, required this.filters});

  final Set<String> filters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(exercisesProvider);

    return exercises.when(
      data: (items) {
        final filteredItems =
            (filters.contains(Muscle.all.name) && filters.length == 1)
            ? items
            : items!.where((e) => filters.contains(e.force)).toList();

        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) =>
                ExerciseCard(image: filteredItems[index].images!),
            childCount: filteredItems!.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) =>
          SliverToBoxAdapter(child: Center(child: Text("Error: $err"))),
    );
  }
}
