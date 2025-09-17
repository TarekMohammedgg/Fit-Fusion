import 'package:fit_fusion/core/helper/supabase_helper.dart';
import 'package:fit_fusion/features/body_info/data/models/user_model.dart';
import 'package:riverpod/riverpod.dart';

final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  return await SupabaseHelper.getCurrentUserProfile();
});
