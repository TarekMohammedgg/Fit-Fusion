// class ExerciseModel {
//   final String id;
//   final String? name;
//   final String? force;
//   final String? level;
//   final String? mechanic;
//   final String? equipment;
//   final String? instructions;
//   final String? category;
//   final String? images;

//   ExerciseModel({
//     required this.id,
//     this.name,
//     this.force,
//     this.level,
//     this.mechanic,
//     this.equipment,
//     this.instructions,
//     this.category,
//     this.images,
//   });

//   factory ExerciseModel.fromJson(Map<String, dynamic> json) {
//     return ExerciseModel(
//       id: json['id'] as String,
//       name: json['name'] as String? ?? "",
//       force: json['force'] as String? ?? "",
//       level: json['level'] as String? ?? "",
//       mechanic: json['mechanic'] as String? ?? "",
//       equipment: json['equipment'] as String? ?? "",
//       instructions: json['instructions'] as String? ?? "",
//       category: json['category'] as String? ?? "",
//       images: json['images'] as String? ?? "",
//     );
//   }
// }

class ExerciseModel {
  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? difficulty;
  String? instructions;

  ExerciseModel({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.instructions,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
    name: json['name'] as String?,
    type: json['type'] as String?,
    muscle: json['muscle'] as String?,
    equipment: json['equipment'] as String?,
    difficulty: json['difficulty'] as String?,
    instructions: json['instructions'] as String?,
  );
}

enum Muscle {
  all,
  abdominals,
  abductors,
  adductors,
  biceps,
  calves,
  chest,
  forearms,
  glutes,
  hamstrings,
  lats,
  lowerBack,
  middleBack,
  neck,
  quadriceps,
  traps,
  triceps,
}
