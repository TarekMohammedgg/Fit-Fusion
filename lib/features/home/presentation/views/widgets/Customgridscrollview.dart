import 'package:fit_fusion/features/home/presentation/views/widgets/exercise_model.dart';
import 'package:flutter/material.dart';

class CustomSliverGridV extends StatelessWidget {
  CustomSliverGridV({super.key});
  List<ExerciseModel> items = [
    ExerciseModel(
      name: 'Bench Press',
      description:
          "A strength training exercise that involves pressing a weight upwards from a supine position.",
      tag: ExerciseTag.push.name,
    ),
    ExerciseModel(
      name: 'Deadlift',
      description:
          "A weight training exercise where a loaded barbell is lifted off the ground to the level of the hips, then lowered back to the ground.",

      tag: ExerciseTag.pull.name,
    ),
  ];
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xff973ec2), width: 2),
          ),

          color: Color(0xff242424),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${items[index].name} \n${items[index].description}'),
            ),
          ),
        ),
        childCount: items.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 150, // FIXED height
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }
}
