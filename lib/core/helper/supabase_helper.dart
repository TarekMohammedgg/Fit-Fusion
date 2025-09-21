import 'dart:developer';
import 'dart:io';

import 'package:fit_fusion/features/body_info/data/models/user_model.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fit_fusion/core/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static init({
    required String publicUrl,
    required String publicNanoKey,
  }) async {
    await Supabase.initialize(url: publicUrl, anonKey: publicNanoKey);
    log("Supabase Initialized");
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      log("the Login is success");
    } catch (e) {
      log("the error is $e");
    }
  }

  static Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      log("the Register is success");
    } catch (e) {
      log("the error is $e");
    }
  }

  static Future<UserProfile?> getCurrentUserProfile() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      throw Exception("No user is logged in");
    }

    final response = await Supabase.instance.client
        .from(Consts.kProfilesName)
        .select()
        .eq("id", user.id)
        .single();

    return UserProfile.fromJson(response);
  }

  static Future signout() async {
    await Supabase.instance.client.auth.signOut();
  }

  static Future insertData(UserProfile userData) async {
    try {
      await Supabase.instance.client.from(Consts.kProfilesName).insert({
        "id": userData.id,
        "username": userData.username,
        "weight": userData.weight,
        "height": userData.height,
        "bounce": userData.bounce,
        "gym_duration": userData.gymDuration,
        "workout_duration": userData.workoutDuration,
        "created_at": userData.createdAt?.toIso8601String(),
      });
      log("the profile data saved Successfully");
    } catch (e) {
      log("the error is ${e.toString()}");
    }
  }

  static Future updateData(int id, bool isDone, dynamic todos) async {
    await Supabase.instance.client
        .from(Consts.kDatabaseName)
        .update({"isDone": isDone})
        .eq('id', id);
  }

  static Future deleteItem(int id, dynamic todos) async {
    await Supabase.instance.client
        .from(Consts.kDatabaseName)
        .delete()
        .eq('id', id);
  }

  static Future<List<ExerciseModel>?> getAllExercises() async {
    final response = await Supabase.instance.client
        .from(Consts.kDatabaseName)
        .select();
    if (response == null) {
      throw Exception("No exercises found");
    }
    return response.map((e) => ExerciseModel.fromJson(e)).toList();
  }

  static String? imageUrl;
  static Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    final File imageFile = File(image.path);
    return imageFile;
  }

  static Future uploadImage() async {
    final imageFile = await pickImage();
    if (imageFile == null) return;
    final String timeStamp = DateTime.now().microsecondsSinceEpoch.toString();
    final String uniqueImagePath =
        "\${timeStamp}_\${imageFile.path.split('/').last}";
    await Supabase.instance.client.storage
        .from(Consts.kStorageBucket)
        .upload(uniqueImagePath, imageFile);
    imageUrl = Supabase.instance.client.storage
        .from(Consts.kStorageBucket)
        .getPublicUrl(uniqueImagePath);
    // setState(() {

    // });
  }

  static Future deleteImgae() async {
    if (imageUrl == null) return null;
    await Supabase.instance.client.storage.from(Consts.kStorageBucket).remove([
      imageUrl!.split('/').last,
    ]);
    // setState(() {
    //   imageUrl = null ;
    // });
  }
}
