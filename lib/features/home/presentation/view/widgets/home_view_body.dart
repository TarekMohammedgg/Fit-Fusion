import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:fit_fusion/core/utils/assets.dart';
import 'package:fit_fusion/features/exercise/presentation/views/widgets/exercise_card.dart';
import 'package:fit_fusion/features/home/presentation/view/widgets/avatar_card.dart';
import 'package:fit_fusion/features/home/presentation/view/widgets/info_card.dart';
import 'package:fit_fusion/features/home/presentation/view/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvatarCard(),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InfoCard(firstText: "Weight", secondText: "95"),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: InfoCard(firstText: "Calories", secondText: "1,000"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InfoCard(firstText: "Activity", secondText: "30"),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("Daily Goals", style: AppStyle.styleSemiBod24),
            SizedBox(height: 12),
            ProgressIndenticator(),
            SizedBox(height: 12),

            Text("7,500 Steps", style: AppStyle.styleRegular14),

            SizedBox(height: 20),
            Text("Recent Workouts", style: AppStyle.styleSemiBod24),
            SizedBox(height: 12),
            SizedBox(
              height: 100 ,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: const EdgeInsets.only(right : 8.0),
                      child: ExerciseCard(image: Assets.imagesExercisesGraphicsBack),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






