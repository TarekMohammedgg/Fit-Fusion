import 'package:dio/dio.dart';
import 'package:fit_fusion/core/api/dio_consumer.dart';
import 'package:fit_fusion/core/helper/supabase_helper.dart';
import 'package:fit_fusion/core/repos/muscle_repo.dart';
import 'package:fit_fusion/features/body_info/data/models/user_model.dart';
import 'package:fit_fusion/features/exercise/data/models/exercise_model.dart';
import 'package:riverpod/riverpod.dart';

final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  return await SupabaseHelper.getCurrentUserProfile();
});
final exercisesProvider = FutureProvider<List<ExerciseModel>?>((ref) async {
  return await SupabaseHelper.getAllExercises();
});

final dioProvider = Provider<DioConsumer>((ref) {
  return DioConsumer(dio: Dio());
});
final muscleRepositoryProvider = Provider<MuscleRepository>((ref) {
  final api = ref.watch(dioProvider);
  return MuscleRepository(api: api);
});

final musclesProvider = FutureProvider.family<List<ExerciseModel>, String?>((
  ref,
  muscleName,
) async {
  final repo = ref.read(muscleRepositoryProvider);
  return repo.getMuscles(muscleName: muscleName);
});
// providers.dart
