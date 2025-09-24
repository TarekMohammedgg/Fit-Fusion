import 'package:fit_fusion/core/api/constants.dart';
import 'package:fit_fusion/core/helper/supabase_helper.dart';
import 'package:fit_fusion/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseHelper.init(
    publicUrl: Consts.kSUPABASE_URL,
    publicNanoKey: Consts.kSUPABASE_ANON_KEY,
  );
  runApp(ProviderScope(child: const FitFusion()));
}

class FitFusion extends StatelessWidget {
  
    const FitFusion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
