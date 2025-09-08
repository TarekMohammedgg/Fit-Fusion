class ExerciseModel {
  final String name;
  final String description;
  final String tag;

  ExerciseModel({
    required this.name,
    required this.description,
    required this.tag,
  });
}

enum ExerciseTag { push, pull, legs }

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
