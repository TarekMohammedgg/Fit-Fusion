import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/features/Activity/presentation/views/activity_view_body.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text('Activity', style: AppStyle.styleSemiBod24),
        centerTitle: true,
      ),
      body: activityviewbody(),
    );
  }
}
