import 'package:fit_fusion/features/exercise/data/models/exercise_model.dart';
import 'package:hive_ce/hive.dart';

class ExerciseTypeAdaptor extends TypeAdapter<dynamic> {
  @override
  ExerciseModel read(BinaryReader reader) {
    return ExerciseModel(
      name: reader.readString(),
      difficulty: reader.readString(),
      type: reader.readString(),
      muscle: reader.readString(),
      equipment: reader.readString(),
      instructions: reader.readString(),
    );
  }

  @override
  int get typeId => 0; // from 0 to 223 (each adaptor must have Class typeId)

  @override
  void write(BinaryWriter writer, dynamic obj) {
    final exercises = obj as ExerciseModel;
    writer.writeString(exercises.name ?? "");
    writer.writeString(exercises.type ?? "");
    writer.writeString(exercises.muscle ?? "");
    writer.writeString(exercises.equipment ?? "");
    writer.writeString(exercises.difficulty ?? "");
    writer.writeString(exercises.instructions ?? "");
  }
}
