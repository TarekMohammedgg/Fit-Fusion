import 'package:fit_fusion/core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitFusion());
}


class FitFusion extends StatelessWidget {
  const FitFusion
({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    ) ; 
  }
}