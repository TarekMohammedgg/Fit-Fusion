class ExerciseModel {
  final String image;  
  final String name;
  final String category;

  ExerciseModel({required this.image ,  required this.name, required this.category});
}

enum ExercisFilter {All ,  Push , Pull , Legs} 