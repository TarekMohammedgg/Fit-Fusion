import 'package:fit_fusion/core/api/api_consumer.dart';
import 'package:fit_fusion/core/api/endpoint.dart';
import 'package:fit_fusion/features/exercise/data/models/exercise_model.dart';

class MuscleRepository {
  final ApiConsumer api;

  MuscleRepository({required this.api});

  Future<List<ExerciseModel>> getMuscles({String? muscleName}) async {
    final response = await api.get(
      EndPoint.exercises,
      queryParameters: muscleName != null ? {'muscle': muscleName} : null,
    );

    final List data = response;
    return data.map((e) => ExerciseModel.fromJson(e)).toList();
  }
}
